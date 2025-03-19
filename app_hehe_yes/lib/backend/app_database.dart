import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'dart:io';
part 'app_database.g.dart';

@DataClassName('UserData')
class Users extends Table {
  IntColumn get userID =>
      integer().autoIncrement()(); // Primary key, auto increment
  TextColumn get username =>
      text().withLength(min: 1, max: 255)(); // Username field
  IntColumn get characterIndex => integer().withDefault(const Constant(0))();
  IntColumn get level =>
      integer().withDefault(const Constant(1))(); // Level of the user
  IntColumn get currencyIndex =>
      integer().withDefault(const Constant(0))(); // Currency Index
  BoolColumn get darkmode =>
      boolean().withDefault(const Constant(false))(); // Darkmode setting
  RealColumn get budget => real()
      .withDefault(const Constant(0.0))(); // Budget (decimal with precision)
  IntColumn get hiddenValue => integer()();
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

@DriftDatabase(tables: [Users, Transactions, Achievements, Friendships])
class AppDatabase extends _$AppDatabase {
  static final _instance = AppDatabase._internal();

  AppDatabase._internal() : super(_openConnection());

  factory AppDatabase() => _instance;

  static LazyDatabase _openConnection() {
    return LazyDatabase(() async {
      final dbFolder = await getApplicationDocumentsDirectory();
      final file = File(p.join(dbFolder.path, 'app.db')); // Database file path
      return NativeDatabase(file); // Returns a database connection
    });
  }

  @override
  int get schemaVersion => 1;

  Future<int> insertUser(UsersCompanion user) async {
    return await into(users).insert(user);
  }

  Future<List<int>> getAchievementsOfUser(int userId) async {
    return await (select(achievements)
          ..where((a) => a.userID.equals(userId))
          ..orderBy([
            (a) => OrderingTerm(
                expression: a.achievementIndex, mode: OrderingMode.asc)
          ]))
        .map((a) => a.achievementIndex)
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

  Future<int> inserTransaction(TransactionsCompanion userTransaction) async {
    final retVal = await into(transactions).insert(userTransaction);

    return retVal;
  }

  Future<void> insertAchievement(
      AchievementsCompanion userAchivement, int userId) async {
    await transaction(
      () async {
        await into(achievements)
            .insert(userAchivement, mode: InsertMode.insertOrIgnore);
        final userData = await getUser(userId);
        if (userData.level == 5) {
          return;
        }

        final completedAchievements = await getAchievementsOfUser(userId);

        if (completedAchievements.length == 5 * userData.level) {
          await updateUserData(userData.userID, level: userData.level + 1);
        }
      },
    );
  }

  Future<UserData> loginUser(String userName, int uid) async {
    return await (select(users)
          ..where(
              (u) => u.username.equals(userName) & u.hiddenValue.equals(uid)))
        .getSingle();
  }

  Future<int> updateUserData(int userId,
      {int? level, int? currencyIndex, bool? darkmode, double? budget}) async {
    final query = update(users)..where((u) => u.userID.equals(userId));

    return await query.write(UsersCompanion(
      level: Value.absentIfNull(level),
      currencyIndex: Value.absentIfNull(currencyIndex),
      darkmode: Value.absentIfNull(darkmode),
      budget: Value.absentIfNull(budget),
    ));
  }

  Future<UserData> getUser(int userId) async {
    return await (select(users)..where((u) => u.userID.equals(userId)))
        .getSingle();
  }
}
