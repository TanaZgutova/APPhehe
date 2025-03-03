
class AchievementData {
  final String name;
  final String description;
  final Function predicate;

  AchievementData({
    required this.name,
    required this.description,
    required this.predicate,
  });
}

class AchievementList {
  static const List<AchievementData> _achievements = [];
  AchievementList._();

  List<AchievementData> getAchiemventData() {
    return _achievements;
  }

  AchievementData getAchievementAt(int index) {
    return _achievements[index];
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