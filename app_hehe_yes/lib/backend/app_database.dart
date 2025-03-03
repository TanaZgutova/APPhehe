import 'package:drift/drift.dart';
part 'app_database.g.dart';

@DataClassName('UserData')
class Users extends Table {
  IntColumn get userID =>
      integer().autoIncrement()(); // Primary key, auto increment
  TextColumn get username =>
      text().withLength(min: 1, max: 255)(); // Username field
  IntColumn get characterIndex => integer().withDefault(const Constant(0))();
  IntColumn get level =>
      integer().withDefault(const Constant(0))(); // Level of the user
  IntColumn get xp =>
      integer().withDefault(const Constant(0))(); // Experience points
  IntColumn get currencyIndex =>
      integer().withDefault(const Constant(0))(); // Currency Index
  BoolColumn get darkmode =>
      boolean().withDefault(const Constant(false))(); // Darkmode setting
  RealColumn get budget => real()
      .withDefault(const Constant(0.0))(); // Budget (decimal with precision)
}

@DataClassName('TransactionHistory')
class Transactions extends Table {
  IntColumn get transactionID =>
      integer().autoIncrement()(); // Primary key, auto increment
  IntColumn get userID => integer().references(Users, #userID,
      onUpdate: KeyAction.cascade,
      onDelete: KeyAction.cascade)(); // Foreign key to `userdata`
  IntColumn get categoryIndex => integer()(); // Category of the transaction
  DateTimeColumn get date =>
      dateTime().withDefault(currentDateAndTime)(); // Transaction date
  BoolColumn get withdraw => boolean()(); // Whether it's a withdrawal or not
  RealColumn get amount =>
      real()(); // Amount for the transaction (with decimal precision)
}

@DataClassName('UserAchievement')
class Achievements extends Table {
  IntColumn get achievementIndex => integer()(); // Index of the achievement
  IntColumn get userID => integer().references(Users, #userID,
      onUpdate: KeyAction.cascade,
      onDelete: KeyAction.cascade)(); // Foreign key to `userdata`

  @override
  Set<Column> get primaryKey =>
      {userID, achievementIndex}; // Composite primary key
}

@DataClassName('Friendship')
class Friendships extends Table {
  @ReferenceName("UserFriend")
  IntColumn get userID => integer().references(Users, #userID,
      onUpdate: KeyAction.noAction,
      onDelete: KeyAction.cascade)(); // User who has the friend
  @ReferenceName("FriendUser")
  IntColumn get friendID => integer().references(Users, #userID,
      onUpdate: KeyAction.noAction,
      onDelete: KeyAction.cascade)(); // Friend who is linked to the user

  @override
  Set<Column> get primaryKey =>
      {userID, friendID}; // Composite primary key (userID + friendID)
}

@DataClassName('UserLogIn')
class Logins extends Table {
  IntColumn get userID => integer().references(Users, #userID,
      onUpdate: KeyAction.noAction, onDelete: KeyAction.cascade)();
  DateTimeColumn get date => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {userID, date};
}

@DriftDatabase(tables: [Users, Transactions, Achievements, Friendships, Logins])
class AppDatabase extends _$AppDatabase {
  AppDatabase(QueryExecutor e) : super(e);

  @override
  int get schemaVersion => 1;

  Future<int> insertUser(UserData user) async {
    return await into(users).insert(user.toCompanion(true));
  }

  Future<List<UserAchievement>> getAchievementsOfUser(int userId) async {
    return await (select(achievements)..where((a) => a.userID.equals(userId)))
        .get();
  }

  Future<List<UserData>> getFriendsOfUser(int userId) async {
    final friendsQuery = select(users).join([
      innerJoin(friendships, friendships.friendID.equalsExp(users.userID)),
    ])
      ..where(friendships.userID.equals(userId));
    final result = await friendsQuery.get();
    return result.map((row) => row.readTable(users)).toList();
  }

  Future<void> addFriendship(int userID, int friendID) async {
    // Insert both directions into the friendship table
    await transaction(() async {
      await into(friendships).insert(FriendshipsCompanion(
        userID: Value(userID),
        friendID: Value(friendID),
      ));
      await into(friendships).insert(FriendshipsCompanion(
        userID: Value(friendID),
        friendID: Value(userID),
      ));
    });
  }

  Future<List<TransactionHistory>> getTransactionsForUser(int userId) async {
    return await (select(transactions)..where((t) => t.userID.equals(userId)))
        .get();
  }

  Future<int> inserTransaction(TransactionHistory userTransaction) async {
    final retVal =
        await into(transactions).insert(userTransaction.toCompanion(true));
    return retVal;
  }

  Future<int> insertAchievement(UserAchievement userAchivement) async {
    return await into(achievements).insert(userAchivement.toCompanion(true));
  }

  Future<int> getUserLoginStreak(int userId) async {
    final userLogins = await (select(logins)
          ..where((l) => l.userID.equals(userId))
          ..orderBy([
            (l) => OrderingTerm(expression: l.date, mode: OrderingMode.desc)
          ]))
        .get();

    if (userLogins.isEmpty) {
      return 0;
    }

    var loginStreak = 1;
    final lastUserLogin = userLogins.first.date;

    for (var i = 1; i < userLogins.length; i++) {
      if (lastUserLogin.difference(userLogins[i].date).inDays > 1) {
        break;
      }

      loginStreak++;
    }

    return loginStreak;
  }

  Future<UserData?> loginUser(String userName) async {
    return await transaction(() async {
      final user = await (select(users)
            ..where((u) => u.username.equals(userName)))
          .getSingleOrNull();

      if (user == null) {
        return user;
      }

      await into(logins).insert(LoginsCompanion(userID: Value(user.userID)));

      final lastUserLoginDate = await (select(logins)
            ..where((l) => l.userID.equals(user.userID))
            ..orderBy([
              (l) => OrderingTerm(expression: l.date, mode: OrderingMode.desc)
            ])
            ..limit(1))
          .getSingleOrNull();

      if (lastUserLoginDate == null ||
          lastUserLoginDate.date.day != DateTime.now().day) {
        into(logins).insert(LoginsCompanion(userID: Value(user.userID)));
      }

      return user;
    });
  }

  Future<int> updateUserData(int userId,
      {int? level,
      int? xp,
      int? currencyIndex,
      bool? darkmode,
      double? budget}) async {
    final query = update(users)..where((u) => u.userID.equals(userId));

    return await query.write(UsersCompanion(
      level: Value.absentIfNull(level),
      xp: Value.absentIfNull(xp),
      currencyIndex: Value.absentIfNull(currencyIndex),
      darkmode: Value.absentIfNull(darkmode),
      budget: Value.absentIfNull(budget),
    ));
  }

  Future<int> addUserXp(UserData user, int xp) async {
    var userXp = user.xp + xp;
    var userLvl = user.level;

    if (userXp >= 100) {
      userXp -= 100;
      userLvl++;
    }

    return updateUserData(user.userID, level: userLvl, xp: userXp);
  }
}
