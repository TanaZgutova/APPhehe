
class AchievementData {
  late final String name;
  late final String description;
  late final Function predicate;

  AchievementData({
    required name,
    required description,
    required predicate,
  });
}

class AchievementList {
  static final List<AchievementData> _achievements = [];
  AchievementList._();

  List<AchievementData> getAchiemventData() {
    return _achievements;
  }

  AchievementData getAchievementAt(int index) {
    return _achievements[index];
  }
}

class CurrencyData {
  late final String name;
  late final String displayName;

  CurrencyData({
    required name,
    required displayName,
  });
}

class CurrencyList {
  static final List<CurrencyData> _currencies = [];
  CurrencyList._();

  List<CurrencyData> getCurrencies() {
    return _currencies;
  }

  CurrencyData getCurrencyAt(int index) {
    return _currencies[index];
  }
}

class CharacterData {
  late final String imgPath; //to be updated when necessary

  CharacterData({required imgPath});
}

class CharacterList {
  static final List<CharacterData> _characters = [];
  CharacterList._();

  List<CharacterData> getCharacters() {
    return _characters;
  }

  CharacterData getCharacterAt(int index) {
    return _characters[index];
  }
}