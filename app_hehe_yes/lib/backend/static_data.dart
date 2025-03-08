class AchievementData {
  final String name;
  final String description;
  final double thresholdValue;

  AchievementData({
    required this.name,
    required this.description,
    required this.thresholdValue,
  });
}

class AchievementList {
  static const List<AchievementData> _achievements = [];
  static final _streakAchievements = _achievements.sublist(1, 5);
  static final _savingAhcivements = _achievements.sublist(6, 9);
  AchievementList._();

  static List<AchievementData> getAchiemventData() {
    return _achievements;
  }

  static AchievementData getAchievementAt(int index) {
    return _achievements[index];
  }

  static List<AchievementData> getStreakAchievements() {
    return _streakAchievements;
  }

  static List<AchievementData> getSavingAchievements() {
    return _savingAhcivements;
  }

  static List<int> _checkAchievements(
      List<AchievementData> achList, bool Function(double) predicate) {
    List<int> completedAchivements = [];
    for (var achIdx = 0; achIdx < _achievements.length; achIdx++) {
      if (predicate(_achievements[achIdx].thresholdValue)) {
        completedAchivements.add(achIdx);
      }
    }
    return completedAchivements;
  }

  static List<int> checkStreakAchievements(bool Function(double) predicate) {
    return _checkAchievements(_streakAchievements, predicate);
  }

  static List<int> checkSavingsAchievements(bool Function(double) predicate) {
    return _checkAchievements(_savingAhcivements, predicate);
  }
}

class CurrencyData {
  final String name;
  final String displayName;

  CurrencyData({
    required this.name,
    required this.displayName,
  });
}

class CurrencyList {
  static const List<CurrencyData> _currencies = [];
  CurrencyList._();

  List<CurrencyData> getCurrencies() {
    return _currencies;
  }

  CurrencyData getCurrencyAt(int index) {
    return _currencies[index];
  }
}

class CharacterData {
  final String imgPath; //to be updated when necessary

  CharacterData({required this.imgPath});
}

class CharacterList {
  static const List<CharacterData> _characters = [];
  CharacterList._();

  List<CharacterData> getCharacters() {
    return _characters;
  }

  CharacterData getCharacterAt(int index) {
    return _characters[index];
  }
}
