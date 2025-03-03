// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $UsersTable extends Users with TableInfo<$UsersTable, UserData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UsersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _userIDMeta = const VerificationMeta('userID');
  @override
  late final GeneratedColumn<int> userID = GeneratedColumn<int>(
      'user_i_d', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _usernameMeta =
      const VerificationMeta('username');
  @override
  late final GeneratedColumn<String> username = GeneratedColumn<String>(
      'username', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 255),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _characterIndexMeta =
      const VerificationMeta('characterIndex');
  @override
  late final GeneratedColumn<int> characterIndex = GeneratedColumn<int>(
      'character_index', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _levelMeta = const VerificationMeta('level');
  @override
  late final GeneratedColumn<int> level = GeneratedColumn<int>(
      'level', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _xpMeta = const VerificationMeta('xp');
  @override
  late final GeneratedColumn<int> xp = GeneratedColumn<int>(
      'xp', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _currencyIndexMeta =
      const VerificationMeta('currencyIndex');
  @override
  late final GeneratedColumn<int> currencyIndex = GeneratedColumn<int>(
      'currency_index', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _darkmodeMeta =
      const VerificationMeta('darkmode');
  @override
  late final GeneratedColumn<bool> darkmode = GeneratedColumn<bool>(
      'darkmode', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("darkmode" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _budgetMeta = const VerificationMeta('budget');
  @override
  late final GeneratedColumn<double> budget = GeneratedColumn<double>(
      'budget', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      defaultValue: const Constant(0.0));
  @override
  List<GeneratedColumn> get $columns => [
        userID,
        username,
        characterIndex,
        level,
        xp,
        currencyIndex,
        darkmode,
        budget
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'users';
  @override
  VerificationContext validateIntegrity(Insertable<UserData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('user_i_d')) {
      context.handle(_userIDMeta,
          userID.isAcceptableOrUnknown(data['user_i_d']!, _userIDMeta));
    }
    if (data.containsKey('username')) {
      context.handle(_usernameMeta,
          username.isAcceptableOrUnknown(data['username']!, _usernameMeta));
    } else if (isInserting) {
      context.missing(_usernameMeta);
    }
    if (data.containsKey('character_index')) {
      context.handle(
          _characterIndexMeta,
          characterIndex.isAcceptableOrUnknown(
              data['character_index']!, _characterIndexMeta));
    }
    if (data.containsKey('level')) {
      context.handle(
          _levelMeta, level.isAcceptableOrUnknown(data['level']!, _levelMeta));
    }
    if (data.containsKey('xp')) {
      context.handle(_xpMeta, xp.isAcceptableOrUnknown(data['xp']!, _xpMeta));
    }
    if (data.containsKey('currency_index')) {
      context.handle(
          _currencyIndexMeta,
          currencyIndex.isAcceptableOrUnknown(
              data['currency_index']!, _currencyIndexMeta));
    }
    if (data.containsKey('darkmode')) {
      context.handle(_darkmodeMeta,
          darkmode.isAcceptableOrUnknown(data['darkmode']!, _darkmodeMeta));
    }
    if (data.containsKey('budget')) {
      context.handle(_budgetMeta,
          budget.isAcceptableOrUnknown(data['budget']!, _budgetMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {userID};
  @override
  UserData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserData(
      userID: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}user_i_d'])!,
      username: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}username'])!,
      characterIndex: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}character_index'])!,
      level: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}level'])!,
      xp: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}xp'])!,
      currencyIndex: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}currency_index'])!,
      darkmode: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}darkmode'])!,
      budget: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}budget'])!,
    );
  }

  @override
  $UsersTable createAlias(String alias) {
    return $UsersTable(attachedDatabase, alias);
  }
}

class UserData extends DataClass implements Insertable<UserData> {
  final int userID;
  final String username;
  final int characterIndex;
  final int level;
  final int xp;
  final int currencyIndex;
  final bool darkmode;
  final double budget;
  const UserData(
      {required this.userID,
      required this.username,
      required this.characterIndex,
      required this.level,
      required this.xp,
      required this.currencyIndex,
      required this.darkmode,
      required this.budget});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['user_i_d'] = Variable<int>(userID);
    map['username'] = Variable<String>(username);
    map['character_index'] = Variable<int>(characterIndex);
    map['level'] = Variable<int>(level);
    map['xp'] = Variable<int>(xp);
    map['currency_index'] = Variable<int>(currencyIndex);
    map['darkmode'] = Variable<bool>(darkmode);
    map['budget'] = Variable<double>(budget);
    return map;
  }

  UsersCompanion toCompanion(bool nullToAbsent) {
    return UsersCompanion(
      userID: Value(userID),
      username: Value(username),
      characterIndex: Value(characterIndex),
      level: Value(level),
      xp: Value(xp),
      currencyIndex: Value(currencyIndex),
      darkmode: Value(darkmode),
      budget: Value(budget),
    );
  }

  factory UserData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserData(
      userID: serializer.fromJson<int>(json['userID']),
      username: serializer.fromJson<String>(json['username']),
      characterIndex: serializer.fromJson<int>(json['characterIndex']),
      level: serializer.fromJson<int>(json['level']),
      xp: serializer.fromJson<int>(json['xp']),
      currencyIndex: serializer.fromJson<int>(json['currencyIndex']),
      darkmode: serializer.fromJson<bool>(json['darkmode']),
      budget: serializer.fromJson<double>(json['budget']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'userID': serializer.toJson<int>(userID),
      'username': serializer.toJson<String>(username),
      'characterIndex': serializer.toJson<int>(characterIndex),
      'level': serializer.toJson<int>(level),
      'xp': serializer.toJson<int>(xp),
      'currencyIndex': serializer.toJson<int>(currencyIndex),
      'darkmode': serializer.toJson<bool>(darkmode),
      'budget': serializer.toJson<double>(budget),
    };
  }

  UserData copyWith(
          {int? userID,
          String? username,
          int? characterIndex,
          int? level,
          int? xp,
          int? currencyIndex,
          bool? darkmode,
          double? budget}) =>
      UserData(
        userID: userID ?? this.userID,
        username: username ?? this.username,
        characterIndex: characterIndex ?? this.characterIndex,
        level: level ?? this.level,
        xp: xp ?? this.xp,
        currencyIndex: currencyIndex ?? this.currencyIndex,
        darkmode: darkmode ?? this.darkmode,
        budget: budget ?? this.budget,
      );
  UserData copyWithCompanion(UsersCompanion data) {
    return UserData(
      userID: data.userID.present ? data.userID.value : this.userID,
      username: data.username.present ? data.username.value : this.username,
      characterIndex: data.characterIndex.present
          ? data.characterIndex.value
          : this.characterIndex,
      level: data.level.present ? data.level.value : this.level,
      xp: data.xp.present ? data.xp.value : this.xp,
      currencyIndex: data.currencyIndex.present
          ? data.currencyIndex.value
          : this.currencyIndex,
      darkmode: data.darkmode.present ? data.darkmode.value : this.darkmode,
      budget: data.budget.present ? data.budget.value : this.budget,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UserData(')
          ..write('userID: $userID, ')
          ..write('username: $username, ')
          ..write('characterIndex: $characterIndex, ')
          ..write('level: $level, ')
          ..write('xp: $xp, ')
          ..write('currencyIndex: $currencyIndex, ')
          ..write('darkmode: $darkmode, ')
          ..write('budget: $budget')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(userID, username, characterIndex, level, xp,
      currencyIndex, darkmode, budget);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserData &&
          other.userID == this.userID &&
          other.username == this.username &&
          other.characterIndex == this.characterIndex &&
          other.level == this.level &&
          other.xp == this.xp &&
          other.currencyIndex == this.currencyIndex &&
          other.darkmode == this.darkmode &&
          other.budget == this.budget);
}

class UsersCompanion extends UpdateCompanion<UserData> {
  final Value<int> userID;
  final Value<String> username;
  final Value<int> characterIndex;
  final Value<int> level;
  final Value<int> xp;
  final Value<int> currencyIndex;
  final Value<bool> darkmode;
  final Value<double> budget;
  const UsersCompanion({
    this.userID = const Value.absent(),
    this.username = const Value.absent(),
    this.characterIndex = const Value.absent(),
    this.level = const Value.absent(),
    this.xp = const Value.absent(),
    this.currencyIndex = const Value.absent(),
    this.darkmode = const Value.absent(),
    this.budget = const Value.absent(),
  });
  UsersCompanion.insert({
    this.userID = const Value.absent(),
    required String username,
    this.characterIndex = const Value.absent(),
    this.level = const Value.absent(),
    this.xp = const Value.absent(),
    this.currencyIndex = const Value.absent(),
    this.darkmode = const Value.absent(),
    this.budget = const Value.absent(),
  }) : username = Value(username);
  static Insertable<UserData> custom({
    Expression<int>? userID,
    Expression<String>? username,
    Expression<int>? characterIndex,
    Expression<int>? level,
    Expression<int>? xp,
    Expression<int>? currencyIndex,
    Expression<bool>? darkmode,
    Expression<double>? budget,
  }) {
    return RawValuesInsertable({
      if (userID != null) 'user_i_d': userID,
      if (username != null) 'username': username,
      if (characterIndex != null) 'character_index': characterIndex,
      if (level != null) 'level': level,
      if (xp != null) 'xp': xp,
      if (currencyIndex != null) 'currency_index': currencyIndex,
      if (darkmode != null) 'darkmode': darkmode,
      if (budget != null) 'budget': budget,
    });
  }

  UsersCompanion copyWith(
      {Value<int>? userID,
      Value<String>? username,
      Value<int>? characterIndex,
      Value<int>? level,
      Value<int>? xp,
      Value<int>? currencyIndex,
      Value<bool>? darkmode,
      Value<double>? budget}) {
    return UsersCompanion(
      userID: userID ?? this.userID,
      username: username ?? this.username,
      characterIndex: characterIndex ?? this.characterIndex,
      level: level ?? this.level,
      xp: xp ?? this.xp,
      currencyIndex: currencyIndex ?? this.currencyIndex,
      darkmode: darkmode ?? this.darkmode,
      budget: budget ?? this.budget,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (userID.present) {
      map['user_i_d'] = Variable<int>(userID.value);
    }
    if (username.present) {
      map['username'] = Variable<String>(username.value);
    }
    if (characterIndex.present) {
      map['character_index'] = Variable<int>(characterIndex.value);
    }
    if (level.present) {
      map['level'] = Variable<int>(level.value);
    }
    if (xp.present) {
      map['xp'] = Variable<int>(xp.value);
    }
    if (currencyIndex.present) {
      map['currency_index'] = Variable<int>(currencyIndex.value);
    }
    if (darkmode.present) {
      map['darkmode'] = Variable<bool>(darkmode.value);
    }
    if (budget.present) {
      map['budget'] = Variable<double>(budget.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UsersCompanion(')
          ..write('userID: $userID, ')
          ..write('username: $username, ')
          ..write('characterIndex: $characterIndex, ')
          ..write('level: $level, ')
          ..write('xp: $xp, ')
          ..write('currencyIndex: $currencyIndex, ')
          ..write('darkmode: $darkmode, ')
          ..write('budget: $budget')
          ..write(')'))
        .toString();
  }
}

class $TransactionsTable extends Transactions
    with TableInfo<$TransactionsTable, TransactionHistory> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TransactionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _transactionIDMeta =
      const VerificationMeta('transactionID');
  @override
  late final GeneratedColumn<int> transactionID = GeneratedColumn<int>(
      'transaction_i_d', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _userIDMeta = const VerificationMeta('userID');
  @override
  late final GeneratedColumn<int> userID = GeneratedColumn<int>(
      'user_i_d', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES users (user_i_d) ON UPDATE CASCADE ON DELETE CASCADE'));
  static const VerificationMeta _categoryIndexMeta =
      const VerificationMeta('categoryIndex');
  @override
  late final GeneratedColumn<int> categoryIndex = GeneratedColumn<int>(
      'category_index', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
      'date', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _withdrawMeta =
      const VerificationMeta('withdraw');
  @override
  late final GeneratedColumn<bool> withdraw = GeneratedColumn<bool>(
      'withdraw', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("withdraw" IN (0, 1))'));
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<double> amount = GeneratedColumn<double>(
      'amount', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [transactionID, userID, categoryIndex, date, withdraw, amount];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'transactions';
  @override
  VerificationContext validateIntegrity(Insertable<TransactionHistory> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('transaction_i_d')) {
      context.handle(
          _transactionIDMeta,
          transactionID.isAcceptableOrUnknown(
              data['transaction_i_d']!, _transactionIDMeta));
    }
    if (data.containsKey('user_i_d')) {
      context.handle(_userIDMeta,
          userID.isAcceptableOrUnknown(data['user_i_d']!, _userIDMeta));
    } else if (isInserting) {
      context.missing(_userIDMeta);
    }
    if (data.containsKey('category_index')) {
      context.handle(
          _categoryIndexMeta,
          categoryIndex.isAcceptableOrUnknown(
              data['category_index']!, _categoryIndexMeta));
    } else if (isInserting) {
      context.missing(_categoryIndexMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    }
    if (data.containsKey('withdraw')) {
      context.handle(_withdrawMeta,
          withdraw.isAcceptableOrUnknown(data['withdraw']!, _withdrawMeta));
    } else if (isInserting) {
      context.missing(_withdrawMeta);
    }
    if (data.containsKey('amount')) {
      context.handle(_amountMeta,
          amount.isAcceptableOrUnknown(data['amount']!, _amountMeta));
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {transactionID};
  @override
  TransactionHistory map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TransactionHistory(
      transactionID: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}transaction_i_d'])!,
      userID: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}user_i_d'])!,
      categoryIndex: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}category_index'])!,
      date: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date'])!,
      withdraw: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}withdraw'])!,
      amount: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}amount'])!,
    );
  }

  @override
  $TransactionsTable createAlias(String alias) {
    return $TransactionsTable(attachedDatabase, alias);
  }
}

class TransactionHistory extends DataClass
    implements Insertable<TransactionHistory> {
  final int transactionID;
  final int userID;
  final int categoryIndex;
  final DateTime date;
  final bool withdraw;
  final double amount;
  const TransactionHistory(
      {required this.transactionID,
      required this.userID,
      required this.categoryIndex,
      required this.date,
      required this.withdraw,
      required this.amount});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['transaction_i_d'] = Variable<int>(transactionID);
    map['user_i_d'] = Variable<int>(userID);
    map['category_index'] = Variable<int>(categoryIndex);
    map['date'] = Variable<DateTime>(date);
    map['withdraw'] = Variable<bool>(withdraw);
    map['amount'] = Variable<double>(amount);
    return map;
  }

  TransactionsCompanion toCompanion(bool nullToAbsent) {
    return TransactionsCompanion(
      transactionID: Value(transactionID),
      userID: Value(userID),
      categoryIndex: Value(categoryIndex),
      date: Value(date),
      withdraw: Value(withdraw),
      amount: Value(amount),
    );
  }

  factory TransactionHistory.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TransactionHistory(
      transactionID: serializer.fromJson<int>(json['transactionID']),
      userID: serializer.fromJson<int>(json['userID']),
      categoryIndex: serializer.fromJson<int>(json['categoryIndex']),
      date: serializer.fromJson<DateTime>(json['date']),
      withdraw: serializer.fromJson<bool>(json['withdraw']),
      amount: serializer.fromJson<double>(json['amount']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'transactionID': serializer.toJson<int>(transactionID),
      'userID': serializer.toJson<int>(userID),
      'categoryIndex': serializer.toJson<int>(categoryIndex),
      'date': serializer.toJson<DateTime>(date),
      'withdraw': serializer.toJson<bool>(withdraw),
      'amount': serializer.toJson<double>(amount),
    };
  }

  TransactionHistory copyWith(
          {int? transactionID,
          int? userID,
          int? categoryIndex,
          DateTime? date,
          bool? withdraw,
          double? amount}) =>
      TransactionHistory(
        transactionID: transactionID ?? this.transactionID,
        userID: userID ?? this.userID,
        categoryIndex: categoryIndex ?? this.categoryIndex,
        date: date ?? this.date,
        withdraw: withdraw ?? this.withdraw,
        amount: amount ?? this.amount,
      );
  TransactionHistory copyWithCompanion(TransactionsCompanion data) {
    return TransactionHistory(
      transactionID: data.transactionID.present
          ? data.transactionID.value
          : this.transactionID,
      userID: data.userID.present ? data.userID.value : this.userID,
      categoryIndex: data.categoryIndex.present
          ? data.categoryIndex.value
          : this.categoryIndex,
      date: data.date.present ? data.date.value : this.date,
      withdraw: data.withdraw.present ? data.withdraw.value : this.withdraw,
      amount: data.amount.present ? data.amount.value : this.amount,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TransactionHistory(')
          ..write('transactionID: $transactionID, ')
          ..write('userID: $userID, ')
          ..write('categoryIndex: $categoryIndex, ')
          ..write('date: $date, ')
          ..write('withdraw: $withdraw, ')
          ..write('amount: $amount')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(transactionID, userID, categoryIndex, date, withdraw, amount);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TransactionHistory &&
          other.transactionID == this.transactionID &&
          other.userID == this.userID &&
          other.categoryIndex == this.categoryIndex &&
          other.date == this.date &&
          other.withdraw == this.withdraw &&
          other.amount == this.amount);
}

class TransactionsCompanion extends UpdateCompanion<TransactionHistory> {
  final Value<int> transactionID;
  final Value<int> userID;
  final Value<int> categoryIndex;
  final Value<DateTime> date;
  final Value<bool> withdraw;
  final Value<double> amount;
  const TransactionsCompanion({
    this.transactionID = const Value.absent(),
    this.userID = const Value.absent(),
    this.categoryIndex = const Value.absent(),
    this.date = const Value.absent(),
    this.withdraw = const Value.absent(),
    this.amount = const Value.absent(),
  });
  TransactionsCompanion.insert({
    this.transactionID = const Value.absent(),
    required int userID,
    required int categoryIndex,
    this.date = const Value.absent(),
    required bool withdraw,
    required double amount,
  })  : userID = Value(userID),
        categoryIndex = Value(categoryIndex),
        withdraw = Value(withdraw),
        amount = Value(amount);
  static Insertable<TransactionHistory> custom({
    Expression<int>? transactionID,
    Expression<int>? userID,
    Expression<int>? categoryIndex,
    Expression<DateTime>? date,
    Expression<bool>? withdraw,
    Expression<double>? amount,
  }) {
    return RawValuesInsertable({
      if (transactionID != null) 'transaction_i_d': transactionID,
      if (userID != null) 'user_i_d': userID,
      if (categoryIndex != null) 'category_index': categoryIndex,
      if (date != null) 'date': date,
      if (withdraw != null) 'withdraw': withdraw,
      if (amount != null) 'amount': amount,
    });
  }

  TransactionsCompanion copyWith(
      {Value<int>? transactionID,
      Value<int>? userID,
      Value<int>? categoryIndex,
      Value<DateTime>? date,
      Value<bool>? withdraw,
      Value<double>? amount}) {
    return TransactionsCompanion(
      transactionID: transactionID ?? this.transactionID,
      userID: userID ?? this.userID,
      categoryIndex: categoryIndex ?? this.categoryIndex,
      date: date ?? this.date,
      withdraw: withdraw ?? this.withdraw,
      amount: amount ?? this.amount,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (transactionID.present) {
      map['transaction_i_d'] = Variable<int>(transactionID.value);
    }
    if (userID.present) {
      map['user_i_d'] = Variable<int>(userID.value);
    }
    if (categoryIndex.present) {
      map['category_index'] = Variable<int>(categoryIndex.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (withdraw.present) {
      map['withdraw'] = Variable<bool>(withdraw.value);
    }
    if (amount.present) {
      map['amount'] = Variable<double>(amount.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TransactionsCompanion(')
          ..write('transactionID: $transactionID, ')
          ..write('userID: $userID, ')
          ..write('categoryIndex: $categoryIndex, ')
          ..write('date: $date, ')
          ..write('withdraw: $withdraw, ')
          ..write('amount: $amount')
          ..write(')'))
        .toString();
  }
}

class $AchievementsTable extends Achievements
    with TableInfo<$AchievementsTable, UserAchievement> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AchievementsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _achievementIndexMeta =
      const VerificationMeta('achievementIndex');
  @override
  late final GeneratedColumn<int> achievementIndex = GeneratedColumn<int>(
      'achievement_index', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _userIDMeta = const VerificationMeta('userID');
  @override
  late final GeneratedColumn<int> userID = GeneratedColumn<int>(
      'user_i_d', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES users (user_i_d) ON UPDATE CASCADE ON DELETE CASCADE'));
  @override
  List<GeneratedColumn> get $columns => [achievementIndex, userID];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'achievements';
  @override
  VerificationContext validateIntegrity(Insertable<UserAchievement> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('achievement_index')) {
      context.handle(
          _achievementIndexMeta,
          achievementIndex.isAcceptableOrUnknown(
              data['achievement_index']!, _achievementIndexMeta));
    } else if (isInserting) {
      context.missing(_achievementIndexMeta);
    }
    if (data.containsKey('user_i_d')) {
      context.handle(_userIDMeta,
          userID.isAcceptableOrUnknown(data['user_i_d']!, _userIDMeta));
    } else if (isInserting) {
      context.missing(_userIDMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {userID, achievementIndex};
  @override
  UserAchievement map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserAchievement(
      achievementIndex: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}achievement_index'])!,
      userID: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}user_i_d'])!,
    );
  }

  @override
  $AchievementsTable createAlias(String alias) {
    return $AchievementsTable(attachedDatabase, alias);
  }
}

class UserAchievement extends DataClass implements Insertable<UserAchievement> {
  final int achievementIndex;
  final int userID;
  const UserAchievement({required this.achievementIndex, required this.userID});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['achievement_index'] = Variable<int>(achievementIndex);
    map['user_i_d'] = Variable<int>(userID);
    return map;
  }

  AchievementsCompanion toCompanion(bool nullToAbsent) {
    return AchievementsCompanion(
      achievementIndex: Value(achievementIndex),
      userID: Value(userID),
    );
  }

  factory UserAchievement.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserAchievement(
      achievementIndex: serializer.fromJson<int>(json['achievementIndex']),
      userID: serializer.fromJson<int>(json['userID']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'achievementIndex': serializer.toJson<int>(achievementIndex),
      'userID': serializer.toJson<int>(userID),
    };
  }

  UserAchievement copyWith({int? achievementIndex, int? userID}) =>
      UserAchievement(
        achievementIndex: achievementIndex ?? this.achievementIndex,
        userID: userID ?? this.userID,
      );
  UserAchievement copyWithCompanion(AchievementsCompanion data) {
    return UserAchievement(
      achievementIndex: data.achievementIndex.present
          ? data.achievementIndex.value
          : this.achievementIndex,
      userID: data.userID.present ? data.userID.value : this.userID,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UserAchievement(')
          ..write('achievementIndex: $achievementIndex, ')
          ..write('userID: $userID')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(achievementIndex, userID);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserAchievement &&
          other.achievementIndex == this.achievementIndex &&
          other.userID == this.userID);
}

class AchievementsCompanion extends UpdateCompanion<UserAchievement> {
  final Value<int> achievementIndex;
  final Value<int> userID;
  final Value<int> rowid;
  const AchievementsCompanion({
    this.achievementIndex = const Value.absent(),
    this.userID = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  AchievementsCompanion.insert({
    required int achievementIndex,
    required int userID,
    this.rowid = const Value.absent(),
  })  : achievementIndex = Value(achievementIndex),
        userID = Value(userID);
  static Insertable<UserAchievement> custom({
    Expression<int>? achievementIndex,
    Expression<int>? userID,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (achievementIndex != null) 'achievement_index': achievementIndex,
      if (userID != null) 'user_i_d': userID,
      if (rowid != null) 'rowid': rowid,
    });
  }

  AchievementsCompanion copyWith(
      {Value<int>? achievementIndex, Value<int>? userID, Value<int>? rowid}) {
    return AchievementsCompanion(
      achievementIndex: achievementIndex ?? this.achievementIndex,
      userID: userID ?? this.userID,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (achievementIndex.present) {
      map['achievement_index'] = Variable<int>(achievementIndex.value);
    }
    if (userID.present) {
      map['user_i_d'] = Variable<int>(userID.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AchievementsCompanion(')
          ..write('achievementIndex: $achievementIndex, ')
          ..write('userID: $userID, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $FriendshipsTable extends Friendships
    with TableInfo<$FriendshipsTable, Friendship> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FriendshipsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _userIDMeta = const VerificationMeta('userID');
  @override
  late final GeneratedColumn<int> userID = GeneratedColumn<int>(
      'user_i_d', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES users (user_i_d) ON UPDATE NO ACTION ON DELETE CASCADE'));
  static const VerificationMeta _friendIDMeta =
      const VerificationMeta('friendID');
  @override
  late final GeneratedColumn<int> friendID = GeneratedColumn<int>(
      'friend_i_d', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES users (user_i_d) ON UPDATE NO ACTION ON DELETE CASCADE'));
  @override
  List<GeneratedColumn> get $columns => [userID, friendID];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'friendships';
  @override
  VerificationContext validateIntegrity(Insertable<Friendship> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('user_i_d')) {
      context.handle(_userIDMeta,
          userID.isAcceptableOrUnknown(data['user_i_d']!, _userIDMeta));
    } else if (isInserting) {
      context.missing(_userIDMeta);
    }
    if (data.containsKey('friend_i_d')) {
      context.handle(_friendIDMeta,
          friendID.isAcceptableOrUnknown(data['friend_i_d']!, _friendIDMeta));
    } else if (isInserting) {
      context.missing(_friendIDMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {userID, friendID};
  @override
  Friendship map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Friendship(
      userID: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}user_i_d'])!,
      friendID: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}friend_i_d'])!,
    );
  }

  @override
  $FriendshipsTable createAlias(String alias) {
    return $FriendshipsTable(attachedDatabase, alias);
  }
}

class Friendship extends DataClass implements Insertable<Friendship> {
  final int userID;
  final int friendID;
  const Friendship({required this.userID, required this.friendID});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['user_i_d'] = Variable<int>(userID);
    map['friend_i_d'] = Variable<int>(friendID);
    return map;
  }

  FriendshipsCompanion toCompanion(bool nullToAbsent) {
    return FriendshipsCompanion(
      userID: Value(userID),
      friendID: Value(friendID),
    );
  }

  factory Friendship.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Friendship(
      userID: serializer.fromJson<int>(json['userID']),
      friendID: serializer.fromJson<int>(json['friendID']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'userID': serializer.toJson<int>(userID),
      'friendID': serializer.toJson<int>(friendID),
    };
  }

  Friendship copyWith({int? userID, int? friendID}) => Friendship(
        userID: userID ?? this.userID,
        friendID: friendID ?? this.friendID,
      );
  Friendship copyWithCompanion(FriendshipsCompanion data) {
    return Friendship(
      userID: data.userID.present ? data.userID.value : this.userID,
      friendID: data.friendID.present ? data.friendID.value : this.friendID,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Friendship(')
          ..write('userID: $userID, ')
          ..write('friendID: $friendID')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(userID, friendID);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Friendship &&
          other.userID == this.userID &&
          other.friendID == this.friendID);
}

class FriendshipsCompanion extends UpdateCompanion<Friendship> {
  final Value<int> userID;
  final Value<int> friendID;
  final Value<int> rowid;
  const FriendshipsCompanion({
    this.userID = const Value.absent(),
    this.friendID = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  FriendshipsCompanion.insert({
    required int userID,
    required int friendID,
    this.rowid = const Value.absent(),
  })  : userID = Value(userID),
        friendID = Value(friendID);
  static Insertable<Friendship> custom({
    Expression<int>? userID,
    Expression<int>? friendID,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (userID != null) 'user_i_d': userID,
      if (friendID != null) 'friend_i_d': friendID,
      if (rowid != null) 'rowid': rowid,
    });
  }

  FriendshipsCompanion copyWith(
      {Value<int>? userID, Value<int>? friendID, Value<int>? rowid}) {
    return FriendshipsCompanion(
      userID: userID ?? this.userID,
      friendID: friendID ?? this.friendID,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (userID.present) {
      map['user_i_d'] = Variable<int>(userID.value);
    }
    if (friendID.present) {
      map['friend_i_d'] = Variable<int>(friendID.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FriendshipsCompanion(')
          ..write('userID: $userID, ')
          ..write('friendID: $friendID, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $LoginsTable extends Logins with TableInfo<$LoginsTable, UserLogIn> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LoginsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _userIDMeta = const VerificationMeta('userID');
  @override
  late final GeneratedColumn<int> userID = GeneratedColumn<int>(
      'user_i_d', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES users (user_i_d) ON UPDATE NO ACTION ON DELETE CASCADE'));
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
      'date', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns => [userID, date];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'logins';
  @override
  VerificationContext validateIntegrity(Insertable<UserLogIn> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('user_i_d')) {
      context.handle(_userIDMeta,
          userID.isAcceptableOrUnknown(data['user_i_d']!, _userIDMeta));
    } else if (isInserting) {
      context.missing(_userIDMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {userID, date};
  @override
  UserLogIn map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserLogIn(
      userID: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}user_i_d'])!,
      date: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date'])!,
    );
  }

  @override
  $LoginsTable createAlias(String alias) {
    return $LoginsTable(attachedDatabase, alias);
  }
}

class UserLogIn extends DataClass implements Insertable<UserLogIn> {
  final int userID;
  final DateTime date;
  const UserLogIn({required this.userID, required this.date});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['user_i_d'] = Variable<int>(userID);
    map['date'] = Variable<DateTime>(date);
    return map;
  }

  LoginsCompanion toCompanion(bool nullToAbsent) {
    return LoginsCompanion(
      userID: Value(userID),
      date: Value(date),
    );
  }

  factory UserLogIn.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserLogIn(
      userID: serializer.fromJson<int>(json['userID']),
      date: serializer.fromJson<DateTime>(json['date']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'userID': serializer.toJson<int>(userID),
      'date': serializer.toJson<DateTime>(date),
    };
  }

  UserLogIn copyWith({int? userID, DateTime? date}) => UserLogIn(
        userID: userID ?? this.userID,
        date: date ?? this.date,
      );
  UserLogIn copyWithCompanion(LoginsCompanion data) {
    return UserLogIn(
      userID: data.userID.present ? data.userID.value : this.userID,
      date: data.date.present ? data.date.value : this.date,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UserLogIn(')
          ..write('userID: $userID, ')
          ..write('date: $date')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(userID, date);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserLogIn &&
          other.userID == this.userID &&
          other.date == this.date);
}

class LoginsCompanion extends UpdateCompanion<UserLogIn> {
  final Value<int> userID;
  final Value<DateTime> date;
  final Value<int> rowid;
  const LoginsCompanion({
    this.userID = const Value.absent(),
    this.date = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  LoginsCompanion.insert({
    required int userID,
    this.date = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : userID = Value(userID);
  static Insertable<UserLogIn> custom({
    Expression<int>? userID,
    Expression<DateTime>? date,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (userID != null) 'user_i_d': userID,
      if (date != null) 'date': date,
      if (rowid != null) 'rowid': rowid,
    });
  }

  LoginsCompanion copyWith(
      {Value<int>? userID, Value<DateTime>? date, Value<int>? rowid}) {
    return LoginsCompanion(
      userID: userID ?? this.userID,
      date: date ?? this.date,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (userID.present) {
      map['user_i_d'] = Variable<int>(userID.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LoginsCompanion(')
          ..write('userID: $userID, ')
          ..write('date: $date, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $UsersTable users = $UsersTable(this);
  late final $TransactionsTable transactions = $TransactionsTable(this);
  late final $AchievementsTable achievements = $AchievementsTable(this);
  late final $FriendshipsTable friendships = $FriendshipsTable(this);
  late final $LoginsTable logins = $LoginsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [users, transactions, achievements, friendships, logins];
  @override
  StreamQueryUpdateRules get streamUpdateRules => const StreamQueryUpdateRules(
        [
          WritePropagation(
            on: TableUpdateQuery.onTableName('users',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('transactions', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('users',
                limitUpdateKind: UpdateKind.update),
            result: [
              TableUpdate('transactions', kind: UpdateKind.update),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('users',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('achievements', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('users',
                limitUpdateKind: UpdateKind.update),
            result: [
              TableUpdate('achievements', kind: UpdateKind.update),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('users',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('friendships', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('users',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('friendships', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('users',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('logins', kind: UpdateKind.delete),
            ],
          ),
        ],
      );
}

typedef $$UsersTableCreateCompanionBuilder = UsersCompanion Function({
  Value<int> userID,
  required String username,
  Value<int> characterIndex,
  Value<int> level,
  Value<int> xp,
  Value<int> currencyIndex,
  Value<bool> darkmode,
  Value<double> budget,
});
typedef $$UsersTableUpdateCompanionBuilder = UsersCompanion Function({
  Value<int> userID,
  Value<String> username,
  Value<int> characterIndex,
  Value<int> level,
  Value<int> xp,
  Value<int> currencyIndex,
  Value<bool> darkmode,
  Value<double> budget,
});

final class $$UsersTableReferences
    extends BaseReferences<_$AppDatabase, $UsersTable, UserData> {
  $$UsersTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$TransactionsTable, List<TransactionHistory>>
      _transactionsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
          db.transactions,
          aliasName:
              $_aliasNameGenerator(db.users.userID, db.transactions.userID));

  $$TransactionsTableProcessedTableManager get transactionsRefs {
    final manager = $$TransactionsTableTableManager($_db, $_db.transactions)
        .filter(
            (f) => f.userID.userID.sqlEquals($_itemColumn<int>('user_i_d')!));

    final cache = $_typedResult.readTableOrNull(_transactionsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$AchievementsTable, List<UserAchievement>>
      _achievementsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
          db.achievements,
          aliasName:
              $_aliasNameGenerator(db.users.userID, db.achievements.userID));

  $$AchievementsTableProcessedTableManager get achievementsRefs {
    final manager = $$AchievementsTableTableManager($_db, $_db.achievements)
        .filter(
            (f) => f.userID.userID.sqlEquals($_itemColumn<int>('user_i_d')!));

    final cache = $_typedResult.readTableOrNull(_achievementsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$FriendshipsTable, List<Friendship>>
      _UserFriendTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.friendships,
              aliasName:
                  $_aliasNameGenerator(db.users.userID, db.friendships.userID));

  $$FriendshipsTableProcessedTableManager get UserFriend {
    final manager = $$FriendshipsTableTableManager($_db, $_db.friendships)
        .filter(
            (f) => f.userID.userID.sqlEquals($_itemColumn<int>('user_i_d')!));

    final cache = $_typedResult.readTableOrNull(_UserFriendTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$FriendshipsTable, List<Friendship>>
      _FriendUserTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
          db.friendships,
          aliasName:
              $_aliasNameGenerator(db.users.userID, db.friendships.friendID));

  $$FriendshipsTableProcessedTableManager get FriendUser {
    final manager = $$FriendshipsTableTableManager($_db, $_db.friendships)
        .filter(
            (f) => f.friendID.userID.sqlEquals($_itemColumn<int>('user_i_d')!));

    final cache = $_typedResult.readTableOrNull(_FriendUserTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$LoginsTable, List<UserLogIn>> _loginsRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.logins,
          aliasName: $_aliasNameGenerator(db.users.userID, db.logins.userID));

  $$LoginsTableProcessedTableManager get loginsRefs {
    final manager = $$LoginsTableTableManager($_db, $_db.logins).filter(
        (f) => f.userID.userID.sqlEquals($_itemColumn<int>('user_i_d')!));

    final cache = $_typedResult.readTableOrNull(_loginsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$UsersTableFilterComposer extends Composer<_$AppDatabase, $UsersTable> {
  $$UsersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get userID => $composableBuilder(
      column: $table.userID, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get username => $composableBuilder(
      column: $table.username, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get characterIndex => $composableBuilder(
      column: $table.characterIndex,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get level => $composableBuilder(
      column: $table.level, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get xp => $composableBuilder(
      column: $table.xp, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get currencyIndex => $composableBuilder(
      column: $table.currencyIndex, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get darkmode => $composableBuilder(
      column: $table.darkmode, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get budget => $composableBuilder(
      column: $table.budget, builder: (column) => ColumnFilters(column));

  Expression<bool> transactionsRefs(
      Expression<bool> Function($$TransactionsTableFilterComposer f) f) {
    final $$TransactionsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.userID,
        referencedTable: $db.transactions,
        getReferencedColumn: (t) => t.userID,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TransactionsTableFilterComposer(
              $db: $db,
              $table: $db.transactions,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> achievementsRefs(
      Expression<bool> Function($$AchievementsTableFilterComposer f) f) {
    final $$AchievementsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.userID,
        referencedTable: $db.achievements,
        getReferencedColumn: (t) => t.userID,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$AchievementsTableFilterComposer(
              $db: $db,
              $table: $db.achievements,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> UserFriend(
      Expression<bool> Function($$FriendshipsTableFilterComposer f) f) {
    final $$FriendshipsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.userID,
        referencedTable: $db.friendships,
        getReferencedColumn: (t) => t.userID,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$FriendshipsTableFilterComposer(
              $db: $db,
              $table: $db.friendships,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> FriendUser(
      Expression<bool> Function($$FriendshipsTableFilterComposer f) f) {
    final $$FriendshipsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.userID,
        referencedTable: $db.friendships,
        getReferencedColumn: (t) => t.friendID,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$FriendshipsTableFilterComposer(
              $db: $db,
              $table: $db.friendships,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> loginsRefs(
      Expression<bool> Function($$LoginsTableFilterComposer f) f) {
    final $$LoginsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.userID,
        referencedTable: $db.logins,
        getReferencedColumn: (t) => t.userID,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$LoginsTableFilterComposer(
              $db: $db,
              $table: $db.logins,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$UsersTableOrderingComposer
    extends Composer<_$AppDatabase, $UsersTable> {
  $$UsersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get userID => $composableBuilder(
      column: $table.userID, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get username => $composableBuilder(
      column: $table.username, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get characterIndex => $composableBuilder(
      column: $table.characterIndex,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get level => $composableBuilder(
      column: $table.level, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get xp => $composableBuilder(
      column: $table.xp, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get currencyIndex => $composableBuilder(
      column: $table.currencyIndex,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get darkmode => $composableBuilder(
      column: $table.darkmode, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get budget => $composableBuilder(
      column: $table.budget, builder: (column) => ColumnOrderings(column));
}

class $$UsersTableAnnotationComposer
    extends Composer<_$AppDatabase, $UsersTable> {
  $$UsersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get userID =>
      $composableBuilder(column: $table.userID, builder: (column) => column);

  GeneratedColumn<String> get username =>
      $composableBuilder(column: $table.username, builder: (column) => column);

  GeneratedColumn<int> get characterIndex => $composableBuilder(
      column: $table.characterIndex, builder: (column) => column);

  GeneratedColumn<int> get level =>
      $composableBuilder(column: $table.level, builder: (column) => column);

  GeneratedColumn<int> get xp =>
      $composableBuilder(column: $table.xp, builder: (column) => column);

  GeneratedColumn<int> get currencyIndex => $composableBuilder(
      column: $table.currencyIndex, builder: (column) => column);

  GeneratedColumn<bool> get darkmode =>
      $composableBuilder(column: $table.darkmode, builder: (column) => column);

  GeneratedColumn<double> get budget =>
      $composableBuilder(column: $table.budget, builder: (column) => column);

  Expression<T> transactionsRefs<T extends Object>(
      Expression<T> Function($$TransactionsTableAnnotationComposer a) f) {
    final $$TransactionsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.userID,
        referencedTable: $db.transactions,
        getReferencedColumn: (t) => t.userID,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TransactionsTableAnnotationComposer(
              $db: $db,
              $table: $db.transactions,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<T> achievementsRefs<T extends Object>(
      Expression<T> Function($$AchievementsTableAnnotationComposer a) f) {
    final $$AchievementsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.userID,
        referencedTable: $db.achievements,
        getReferencedColumn: (t) => t.userID,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$AchievementsTableAnnotationComposer(
              $db: $db,
              $table: $db.achievements,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<T> UserFriend<T extends Object>(
      Expression<T> Function($$FriendshipsTableAnnotationComposer a) f) {
    final $$FriendshipsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.userID,
        referencedTable: $db.friendships,
        getReferencedColumn: (t) => t.userID,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$FriendshipsTableAnnotationComposer(
              $db: $db,
              $table: $db.friendships,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<T> FriendUser<T extends Object>(
      Expression<T> Function($$FriendshipsTableAnnotationComposer a) f) {
    final $$FriendshipsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.userID,
        referencedTable: $db.friendships,
        getReferencedColumn: (t) => t.friendID,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$FriendshipsTableAnnotationComposer(
              $db: $db,
              $table: $db.friendships,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<T> loginsRefs<T extends Object>(
      Expression<T> Function($$LoginsTableAnnotationComposer a) f) {
    final $$LoginsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.userID,
        referencedTable: $db.logins,
        getReferencedColumn: (t) => t.userID,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$LoginsTableAnnotationComposer(
              $db: $db,
              $table: $db.logins,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$UsersTableTableManager extends RootTableManager<
    _$AppDatabase,
    $UsersTable,
    UserData,
    $$UsersTableFilterComposer,
    $$UsersTableOrderingComposer,
    $$UsersTableAnnotationComposer,
    $$UsersTableCreateCompanionBuilder,
    $$UsersTableUpdateCompanionBuilder,
    (UserData, $$UsersTableReferences),
    UserData,
    PrefetchHooks Function(
        {bool transactionsRefs,
        bool achievementsRefs,
        bool UserFriend,
        bool FriendUser,
        bool loginsRefs})> {
  $$UsersTableTableManager(_$AppDatabase db, $UsersTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UsersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UsersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UsersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> userID = const Value.absent(),
            Value<String> username = const Value.absent(),
            Value<int> characterIndex = const Value.absent(),
            Value<int> level = const Value.absent(),
            Value<int> xp = const Value.absent(),
            Value<int> currencyIndex = const Value.absent(),
            Value<bool> darkmode = const Value.absent(),
            Value<double> budget = const Value.absent(),
          }) =>
              UsersCompanion(
            userID: userID,
            username: username,
            characterIndex: characterIndex,
            level: level,
            xp: xp,
            currencyIndex: currencyIndex,
            darkmode: darkmode,
            budget: budget,
          ),
          createCompanionCallback: ({
            Value<int> userID = const Value.absent(),
            required String username,
            Value<int> characterIndex = const Value.absent(),
            Value<int> level = const Value.absent(),
            Value<int> xp = const Value.absent(),
            Value<int> currencyIndex = const Value.absent(),
            Value<bool> darkmode = const Value.absent(),
            Value<double> budget = const Value.absent(),
          }) =>
              UsersCompanion.insert(
            userID: userID,
            username: username,
            characterIndex: characterIndex,
            level: level,
            xp: xp,
            currencyIndex: currencyIndex,
            darkmode: darkmode,
            budget: budget,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), $$UsersTableReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: (
              {transactionsRefs = false,
              achievementsRefs = false,
              UserFriend = false,
              FriendUser = false,
              loginsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (transactionsRefs) db.transactions,
                if (achievementsRefs) db.achievements,
                if (UserFriend) db.friendships,
                if (FriendUser) db.friendships,
                if (loginsRefs) db.logins
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (transactionsRefs)
                    await $_getPrefetchedData<UserData, $UsersTable,
                            TransactionHistory>(
                        currentTable: table,
                        referencedTable:
                            $$UsersTableReferences._transactionsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$UsersTableReferences(db, table, p0)
                                .transactionsRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.userID == item.userID),
                        typedResults: items),
                  if (achievementsRefs)
                    await $_getPrefetchedData<UserData, $UsersTable,
                            UserAchievement>(
                        currentTable: table,
                        referencedTable:
                            $$UsersTableReferences._achievementsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$UsersTableReferences(db, table, p0)
                                .achievementsRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.userID == item.userID),
                        typedResults: items),
                  if (UserFriend)
                    await $_getPrefetchedData<UserData, $UsersTable,
                            Friendship>(
                        currentTable: table,
                        referencedTable:
                            $$UsersTableReferences._UserFriendTable(db),
                        managerFromTypedResult: (p0) =>
                            $$UsersTableReferences(db, table, p0).UserFriend,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.userID == item.userID),
                        typedResults: items),
                  if (FriendUser)
                    await $_getPrefetchedData<UserData, $UsersTable,
                            Friendship>(
                        currentTable: table,
                        referencedTable:
                            $$UsersTableReferences._FriendUserTable(db),
                        managerFromTypedResult: (p0) =>
                            $$UsersTableReferences(db, table, p0).FriendUser,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.friendID == item.userID),
                        typedResults: items),
                  if (loginsRefs)
                    await $_getPrefetchedData<UserData, $UsersTable, UserLogIn>(
                        currentTable: table,
                        referencedTable:
                            $$UsersTableReferences._loginsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$UsersTableReferences(db, table, p0).loginsRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.userID == item.userID),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$UsersTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $UsersTable,
    UserData,
    $$UsersTableFilterComposer,
    $$UsersTableOrderingComposer,
    $$UsersTableAnnotationComposer,
    $$UsersTableCreateCompanionBuilder,
    $$UsersTableUpdateCompanionBuilder,
    (UserData, $$UsersTableReferences),
    UserData,
    PrefetchHooks Function(
        {bool transactionsRefs,
        bool achievementsRefs,
        bool UserFriend,
        bool FriendUser,
        bool loginsRefs})>;
typedef $$TransactionsTableCreateCompanionBuilder = TransactionsCompanion
    Function({
  Value<int> transactionID,
  required int userID,
  required int categoryIndex,
  Value<DateTime> date,
  required bool withdraw,
  required double amount,
});
typedef $$TransactionsTableUpdateCompanionBuilder = TransactionsCompanion
    Function({
  Value<int> transactionID,
  Value<int> userID,
  Value<int> categoryIndex,
  Value<DateTime> date,
  Value<bool> withdraw,
  Value<double> amount,
});

final class $$TransactionsTableReferences extends BaseReferences<_$AppDatabase,
    $TransactionsTable, TransactionHistory> {
  $$TransactionsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $UsersTable _userIDTable(_$AppDatabase db) => db.users.createAlias(
      $_aliasNameGenerator(db.transactions.userID, db.users.userID));

  $$UsersTableProcessedTableManager get userID {
    final $_column = $_itemColumn<int>('user_i_d')!;

    final manager = $$UsersTableTableManager($_db, $_db.users)
        .filter((f) => f.userID.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_userIDTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$TransactionsTableFilterComposer
    extends Composer<_$AppDatabase, $TransactionsTable> {
  $$TransactionsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get transactionID => $composableBuilder(
      column: $table.transactionID, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get categoryIndex => $composableBuilder(
      column: $table.categoryIndex, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get date => $composableBuilder(
      column: $table.date, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get withdraw => $composableBuilder(
      column: $table.withdraw, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get amount => $composableBuilder(
      column: $table.amount, builder: (column) => ColumnFilters(column));

  $$UsersTableFilterComposer get userID {
    final $$UsersTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.userID,
        referencedTable: $db.users,
        getReferencedColumn: (t) => t.userID,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$UsersTableFilterComposer(
              $db: $db,
              $table: $db.users,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$TransactionsTableOrderingComposer
    extends Composer<_$AppDatabase, $TransactionsTable> {
  $$TransactionsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get transactionID => $composableBuilder(
      column: $table.transactionID,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get categoryIndex => $composableBuilder(
      column: $table.categoryIndex,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get date => $composableBuilder(
      column: $table.date, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get withdraw => $composableBuilder(
      column: $table.withdraw, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get amount => $composableBuilder(
      column: $table.amount, builder: (column) => ColumnOrderings(column));

  $$UsersTableOrderingComposer get userID {
    final $$UsersTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.userID,
        referencedTable: $db.users,
        getReferencedColumn: (t) => t.userID,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$UsersTableOrderingComposer(
              $db: $db,
              $table: $db.users,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$TransactionsTableAnnotationComposer
    extends Composer<_$AppDatabase, $TransactionsTable> {
  $$TransactionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get transactionID => $composableBuilder(
      column: $table.transactionID, builder: (column) => column);

  GeneratedColumn<int> get categoryIndex => $composableBuilder(
      column: $table.categoryIndex, builder: (column) => column);

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<bool> get withdraw =>
      $composableBuilder(column: $table.withdraw, builder: (column) => column);

  GeneratedColumn<double> get amount =>
      $composableBuilder(column: $table.amount, builder: (column) => column);

  $$UsersTableAnnotationComposer get userID {
    final $$UsersTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.userID,
        referencedTable: $db.users,
        getReferencedColumn: (t) => t.userID,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$UsersTableAnnotationComposer(
              $db: $db,
              $table: $db.users,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$TransactionsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $TransactionsTable,
    TransactionHistory,
    $$TransactionsTableFilterComposer,
    $$TransactionsTableOrderingComposer,
    $$TransactionsTableAnnotationComposer,
    $$TransactionsTableCreateCompanionBuilder,
    $$TransactionsTableUpdateCompanionBuilder,
    (TransactionHistory, $$TransactionsTableReferences),
    TransactionHistory,
    PrefetchHooks Function({bool userID})> {
  $$TransactionsTableTableManager(_$AppDatabase db, $TransactionsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TransactionsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TransactionsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TransactionsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> transactionID = const Value.absent(),
            Value<int> userID = const Value.absent(),
            Value<int> categoryIndex = const Value.absent(),
            Value<DateTime> date = const Value.absent(),
            Value<bool> withdraw = const Value.absent(),
            Value<double> amount = const Value.absent(),
          }) =>
              TransactionsCompanion(
            transactionID: transactionID,
            userID: userID,
            categoryIndex: categoryIndex,
            date: date,
            withdraw: withdraw,
            amount: amount,
          ),
          createCompanionCallback: ({
            Value<int> transactionID = const Value.absent(),
            required int userID,
            required int categoryIndex,
            Value<DateTime> date = const Value.absent(),
            required bool withdraw,
            required double amount,
          }) =>
              TransactionsCompanion.insert(
            transactionID: transactionID,
            userID: userID,
            categoryIndex: categoryIndex,
            date: date,
            withdraw: withdraw,
            amount: amount,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$TransactionsTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({userID = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (userID) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.userID,
                    referencedTable:
                        $$TransactionsTableReferences._userIDTable(db),
                    referencedColumn:
                        $$TransactionsTableReferences._userIDTable(db).userID,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$TransactionsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $TransactionsTable,
    TransactionHistory,
    $$TransactionsTableFilterComposer,
    $$TransactionsTableOrderingComposer,
    $$TransactionsTableAnnotationComposer,
    $$TransactionsTableCreateCompanionBuilder,
    $$TransactionsTableUpdateCompanionBuilder,
    (TransactionHistory, $$TransactionsTableReferences),
    TransactionHistory,
    PrefetchHooks Function({bool userID})>;
typedef $$AchievementsTableCreateCompanionBuilder = AchievementsCompanion
    Function({
  required int achievementIndex,
  required int userID,
  Value<int> rowid,
});
typedef $$AchievementsTableUpdateCompanionBuilder = AchievementsCompanion
    Function({
  Value<int> achievementIndex,
  Value<int> userID,
  Value<int> rowid,
});

final class $$AchievementsTableReferences
    extends BaseReferences<_$AppDatabase, $AchievementsTable, UserAchievement> {
  $$AchievementsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $UsersTable _userIDTable(_$AppDatabase db) => db.users.createAlias(
      $_aliasNameGenerator(db.achievements.userID, db.users.userID));

  $$UsersTableProcessedTableManager get userID {
    final $_column = $_itemColumn<int>('user_i_d')!;

    final manager = $$UsersTableTableManager($_db, $_db.users)
        .filter((f) => f.userID.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_userIDTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$AchievementsTableFilterComposer
    extends Composer<_$AppDatabase, $AchievementsTable> {
  $$AchievementsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get achievementIndex => $composableBuilder(
      column: $table.achievementIndex,
      builder: (column) => ColumnFilters(column));

  $$UsersTableFilterComposer get userID {
    final $$UsersTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.userID,
        referencedTable: $db.users,
        getReferencedColumn: (t) => t.userID,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$UsersTableFilterComposer(
              $db: $db,
              $table: $db.users,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$AchievementsTableOrderingComposer
    extends Composer<_$AppDatabase, $AchievementsTable> {
  $$AchievementsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get achievementIndex => $composableBuilder(
      column: $table.achievementIndex,
      builder: (column) => ColumnOrderings(column));

  $$UsersTableOrderingComposer get userID {
    final $$UsersTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.userID,
        referencedTable: $db.users,
        getReferencedColumn: (t) => t.userID,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$UsersTableOrderingComposer(
              $db: $db,
              $table: $db.users,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$AchievementsTableAnnotationComposer
    extends Composer<_$AppDatabase, $AchievementsTable> {
  $$AchievementsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get achievementIndex => $composableBuilder(
      column: $table.achievementIndex, builder: (column) => column);

  $$UsersTableAnnotationComposer get userID {
    final $$UsersTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.userID,
        referencedTable: $db.users,
        getReferencedColumn: (t) => t.userID,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$UsersTableAnnotationComposer(
              $db: $db,
              $table: $db.users,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$AchievementsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $AchievementsTable,
    UserAchievement,
    $$AchievementsTableFilterComposer,
    $$AchievementsTableOrderingComposer,
    $$AchievementsTableAnnotationComposer,
    $$AchievementsTableCreateCompanionBuilder,
    $$AchievementsTableUpdateCompanionBuilder,
    (UserAchievement, $$AchievementsTableReferences),
    UserAchievement,
    PrefetchHooks Function({bool userID})> {
  $$AchievementsTableTableManager(_$AppDatabase db, $AchievementsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AchievementsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AchievementsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AchievementsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> achievementIndex = const Value.absent(),
            Value<int> userID = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              AchievementsCompanion(
            achievementIndex: achievementIndex,
            userID: userID,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required int achievementIndex,
            required int userID,
            Value<int> rowid = const Value.absent(),
          }) =>
              AchievementsCompanion.insert(
            achievementIndex: achievementIndex,
            userID: userID,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$AchievementsTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({userID = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (userID) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.userID,
                    referencedTable:
                        $$AchievementsTableReferences._userIDTable(db),
                    referencedColumn:
                        $$AchievementsTableReferences._userIDTable(db).userID,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$AchievementsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $AchievementsTable,
    UserAchievement,
    $$AchievementsTableFilterComposer,
    $$AchievementsTableOrderingComposer,
    $$AchievementsTableAnnotationComposer,
    $$AchievementsTableCreateCompanionBuilder,
    $$AchievementsTableUpdateCompanionBuilder,
    (UserAchievement, $$AchievementsTableReferences),
    UserAchievement,
    PrefetchHooks Function({bool userID})>;
typedef $$FriendshipsTableCreateCompanionBuilder = FriendshipsCompanion
    Function({
  required int userID,
  required int friendID,
  Value<int> rowid,
});
typedef $$FriendshipsTableUpdateCompanionBuilder = FriendshipsCompanion
    Function({
  Value<int> userID,
  Value<int> friendID,
  Value<int> rowid,
});

final class $$FriendshipsTableReferences
    extends BaseReferences<_$AppDatabase, $FriendshipsTable, Friendship> {
  $$FriendshipsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $UsersTable _userIDTable(_$AppDatabase db) => db.users.createAlias(
      $_aliasNameGenerator(db.friendships.userID, db.users.userID));

  $$UsersTableProcessedTableManager get userID {
    final $_column = $_itemColumn<int>('user_i_d')!;

    final manager = $$UsersTableTableManager($_db, $_db.users)
        .filter((f) => f.userID.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_userIDTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $UsersTable _friendIDTable(_$AppDatabase db) => db.users.createAlias(
      $_aliasNameGenerator(db.friendships.friendID, db.users.userID));

  $$UsersTableProcessedTableManager get friendID {
    final $_column = $_itemColumn<int>('friend_i_d')!;

    final manager = $$UsersTableTableManager($_db, $_db.users)
        .filter((f) => f.userID.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_friendIDTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$FriendshipsTableFilterComposer
    extends Composer<_$AppDatabase, $FriendshipsTable> {
  $$FriendshipsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$UsersTableFilterComposer get userID {
    final $$UsersTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.userID,
        referencedTable: $db.users,
        getReferencedColumn: (t) => t.userID,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$UsersTableFilterComposer(
              $db: $db,
              $table: $db.users,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$UsersTableFilterComposer get friendID {
    final $$UsersTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.friendID,
        referencedTable: $db.users,
        getReferencedColumn: (t) => t.userID,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$UsersTableFilterComposer(
              $db: $db,
              $table: $db.users,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$FriendshipsTableOrderingComposer
    extends Composer<_$AppDatabase, $FriendshipsTable> {
  $$FriendshipsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$UsersTableOrderingComposer get userID {
    final $$UsersTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.userID,
        referencedTable: $db.users,
        getReferencedColumn: (t) => t.userID,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$UsersTableOrderingComposer(
              $db: $db,
              $table: $db.users,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$UsersTableOrderingComposer get friendID {
    final $$UsersTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.friendID,
        referencedTable: $db.users,
        getReferencedColumn: (t) => t.userID,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$UsersTableOrderingComposer(
              $db: $db,
              $table: $db.users,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$FriendshipsTableAnnotationComposer
    extends Composer<_$AppDatabase, $FriendshipsTable> {
  $$FriendshipsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$UsersTableAnnotationComposer get userID {
    final $$UsersTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.userID,
        referencedTable: $db.users,
        getReferencedColumn: (t) => t.userID,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$UsersTableAnnotationComposer(
              $db: $db,
              $table: $db.users,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$UsersTableAnnotationComposer get friendID {
    final $$UsersTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.friendID,
        referencedTable: $db.users,
        getReferencedColumn: (t) => t.userID,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$UsersTableAnnotationComposer(
              $db: $db,
              $table: $db.users,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$FriendshipsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $FriendshipsTable,
    Friendship,
    $$FriendshipsTableFilterComposer,
    $$FriendshipsTableOrderingComposer,
    $$FriendshipsTableAnnotationComposer,
    $$FriendshipsTableCreateCompanionBuilder,
    $$FriendshipsTableUpdateCompanionBuilder,
    (Friendship, $$FriendshipsTableReferences),
    Friendship,
    PrefetchHooks Function({bool userID, bool friendID})> {
  $$FriendshipsTableTableManager(_$AppDatabase db, $FriendshipsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$FriendshipsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$FriendshipsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$FriendshipsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> userID = const Value.absent(),
            Value<int> friendID = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              FriendshipsCompanion(
            userID: userID,
            friendID: friendID,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required int userID,
            required int friendID,
            Value<int> rowid = const Value.absent(),
          }) =>
              FriendshipsCompanion.insert(
            userID: userID,
            friendID: friendID,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$FriendshipsTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({userID = false, friendID = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (userID) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.userID,
                    referencedTable:
                        $$FriendshipsTableReferences._userIDTable(db),
                    referencedColumn:
                        $$FriendshipsTableReferences._userIDTable(db).userID,
                  ) as T;
                }
                if (friendID) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.friendID,
                    referencedTable:
                        $$FriendshipsTableReferences._friendIDTable(db),
                    referencedColumn:
                        $$FriendshipsTableReferences._friendIDTable(db).userID,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$FriendshipsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $FriendshipsTable,
    Friendship,
    $$FriendshipsTableFilterComposer,
    $$FriendshipsTableOrderingComposer,
    $$FriendshipsTableAnnotationComposer,
    $$FriendshipsTableCreateCompanionBuilder,
    $$FriendshipsTableUpdateCompanionBuilder,
    (Friendship, $$FriendshipsTableReferences),
    Friendship,
    PrefetchHooks Function({bool userID, bool friendID})>;
typedef $$LoginsTableCreateCompanionBuilder = LoginsCompanion Function({
  required int userID,
  Value<DateTime> date,
  Value<int> rowid,
});
typedef $$LoginsTableUpdateCompanionBuilder = LoginsCompanion Function({
  Value<int> userID,
  Value<DateTime> date,
  Value<int> rowid,
});

final class $$LoginsTableReferences
    extends BaseReferences<_$AppDatabase, $LoginsTable, UserLogIn> {
  $$LoginsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $UsersTable _userIDTable(_$AppDatabase db) => db.users
      .createAlias($_aliasNameGenerator(db.logins.userID, db.users.userID));

  $$UsersTableProcessedTableManager get userID {
    final $_column = $_itemColumn<int>('user_i_d')!;

    final manager = $$UsersTableTableManager($_db, $_db.users)
        .filter((f) => f.userID.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_userIDTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$LoginsTableFilterComposer
    extends Composer<_$AppDatabase, $LoginsTable> {
  $$LoginsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<DateTime> get date => $composableBuilder(
      column: $table.date, builder: (column) => ColumnFilters(column));

  $$UsersTableFilterComposer get userID {
    final $$UsersTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.userID,
        referencedTable: $db.users,
        getReferencedColumn: (t) => t.userID,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$UsersTableFilterComposer(
              $db: $db,
              $table: $db.users,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$LoginsTableOrderingComposer
    extends Composer<_$AppDatabase, $LoginsTable> {
  $$LoginsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<DateTime> get date => $composableBuilder(
      column: $table.date, builder: (column) => ColumnOrderings(column));

  $$UsersTableOrderingComposer get userID {
    final $$UsersTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.userID,
        referencedTable: $db.users,
        getReferencedColumn: (t) => t.userID,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$UsersTableOrderingComposer(
              $db: $db,
              $table: $db.users,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$LoginsTableAnnotationComposer
    extends Composer<_$AppDatabase, $LoginsTable> {
  $$LoginsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  $$UsersTableAnnotationComposer get userID {
    final $$UsersTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.userID,
        referencedTable: $db.users,
        getReferencedColumn: (t) => t.userID,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$UsersTableAnnotationComposer(
              $db: $db,
              $table: $db.users,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$LoginsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $LoginsTable,
    UserLogIn,
    $$LoginsTableFilterComposer,
    $$LoginsTableOrderingComposer,
    $$LoginsTableAnnotationComposer,
    $$LoginsTableCreateCompanionBuilder,
    $$LoginsTableUpdateCompanionBuilder,
    (UserLogIn, $$LoginsTableReferences),
    UserLogIn,
    PrefetchHooks Function({bool userID})> {
  $$LoginsTableTableManager(_$AppDatabase db, $LoginsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$LoginsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$LoginsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$LoginsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> userID = const Value.absent(),
            Value<DateTime> date = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              LoginsCompanion(
            userID: userID,
            date: date,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required int userID,
            Value<DateTime> date = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              LoginsCompanion.insert(
            userID: userID,
            date: date,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), $$LoginsTableReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: ({userID = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (userID) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.userID,
                    referencedTable: $$LoginsTableReferences._userIDTable(db),
                    referencedColumn:
                        $$LoginsTableReferences._userIDTable(db).userID,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$LoginsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $LoginsTable,
    UserLogIn,
    $$LoginsTableFilterComposer,
    $$LoginsTableOrderingComposer,
    $$LoginsTableAnnotationComposer,
    $$LoginsTableCreateCompanionBuilder,
    $$LoginsTableUpdateCompanionBuilder,
    (UserLogIn, $$LoginsTableReferences),
    UserLogIn,
    PrefetchHooks Function({bool userID})>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$UsersTableTableManager get users =>
      $$UsersTableTableManager(_db, _db.users);
  $$TransactionsTableTableManager get transactions =>
      $$TransactionsTableTableManager(_db, _db.transactions);
  $$AchievementsTableTableManager get achievements =>
      $$AchievementsTableTableManager(_db, _db.achievements);
  $$FriendshipsTableTableManager get friendships =>
      $$FriendshipsTableTableManager(_db, _db.friendships);
  $$LoginsTableTableManager get logins =>
      $$LoginsTableTableManager(_db, _db.logins);
}
