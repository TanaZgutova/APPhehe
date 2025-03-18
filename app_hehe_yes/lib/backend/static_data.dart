class AchievementData {
  final String name;
  final String description;

  const AchievementData({
    required this.name,
    required this.description,
  });
}

class AchievementList {
  static const List<AchievementData> _achievements = [
    //level 1
    AchievementData(
        name: "Skip the Latte ",
        description:
            "Avoid buying coffee/snacks for a day and use what you have at home."),
    AchievementData(
        name: "Meal Swap Challenge",
        description:
            "Replace one takeout meal with a home-cooked meal this week."),
    AchievementData(
        name: "No-Spend Evening",
        description:
            "After 6 PM, avoid spending on anything online or in stores."),
    AchievementData(
        name: "App Detox",
        description:
            "Delete or mute notifications from shopping apps for a full day."),
    AchievementData(
        name: "Subscription Check",
        description:
            "Find one subscription you don’t use often and consider pausing it."),
    //level 2
    AchievementData(
        name: "No Online Shopping Day",
        description: "Avoid buying anything online for 24 hours."),
    AchievementData(
        name: "DIY Coffee Week",
        description:
            "Make all your coffee or tea at home for a week instead of buying it."),
    AchievementData(
        name: "Cart Patience",
        description:
            "Add an item to your online cart but wait 48 hours before deciding to buy."),
    AchievementData(
        name: "Grocery Smart Swap",
        description:
            "Pick one premium item (e.g., brand-name cereal) and replace it with a cheaper alternative."),
    AchievementData(
        name: "Unsubscribe & Save",
        description:
            "Unsubscribe from marketing emails that tempt you to spend."),

    //level 3
    AchievementData(
        name: "Impulse Shield",
        description:
            "Set a daily spending limit for non-essential purchases this week."),
    AchievementData(
        name: "Digital Minimalist",
        description:
            "Remove one online subscription or service that you don’t fully use."),
    AchievementData(
        name: "Wishlist Challenge",
        description:
            "Add something you want to a wishlist and wait a week before purchasing."),
    AchievementData(
        name: "Cashback Hunt",
        description:
            "Find a discount, cashback offer, or promo code before making an online purchase."),
    AchievementData(
        name: "One-Click Off",
        description:
            "Disable one-click purchases or saved payment details to reduce impulse buying."),

    //level 4
    AchievementData(
        name: "Grocery List Lockdown",
        description:
            "Stick strictly to your grocery list with no extra purchases."),
    AchievementData(
        name: "Unused App Cleanup",
        description:
            "Cancel or delete apps that encourage unnecessary spending."),
    AchievementData(
        name: "24-Hour Social Media Detox",
        description:
            "Avoid social media ads and influencer-driven shopping for a day."),
    AchievementData(
        name: "Prepaid Challenge",
        description:
            "Set a fixed amount for digital entertainment (games, movies, music) and don’t exceed it."),
    AchievementData(
        name: "Digital Declutter Sale",
        description:
            "Sell an item you no longer need via an online marketplace."),

    //level 5
    AchievementData(
        name: "No-Spend Week",
        description:
            "Spend money only on absolute essentials for a full week."),
    AchievementData(
        name: "Unsubscribe & Cut Back",
        description: "Cancel an automatic payment that no longer adds value."),
    AchievementData(
        name: "Ad-Free Savings",
        description:
            "Avoid clicking on digital ads and remove unnecessary paid services."),
    AchievementData(
        name: "Subscription Freeze",
        description:
            "Pause or downgrade a streaming or software subscription for a month."),
    AchievementData(
        name: "Smart Digital Shopping",
        description:
            "Compare prices on three different platforms before making a big purchase."),
  ];

  AchievementList._();

  static List<AchievementData> getAchiemventData() {
    return _achievements;
  }

  static AchievementData getAchievementAt(int index) {
    return _achievements[index];
  }
}

class CurrencyData {
  final String name;
  final String displayName;

  const CurrencyData({
    required this.name,
    required this.displayName,
  });
}

class CurrencyList {
  static const List<CurrencyData> _currencies = [
    CurrencyData(displayName: "USD", name: "dollars"),
    CurrencyData(displayName: "PLZ", name: "zloty"),
    CurrencyData(displayName: "EUR", name: "euros"),
    CurrencyData(displayName: "GBP", name: "ponds")
  ];
  CurrencyList._();

  static List<CurrencyData> getCurrencies() {
    return _currencies;
  }

  static CurrencyData getCurrencyAt(int index) {
    return _currencies[index];
  }
}

class CharacterData {
  final String imgPath; //to be updated when necessary

  const CharacterData({required this.imgPath});
}

class CharacterList {
  static const List<CharacterData> _characters = [];
  CharacterList._();

  static List<CharacterData> getCharacters() {
    return _characters;
  }

  static CharacterData getCharacterAt(int index) {
    return _characters[index];
  }
}

class CategoryList {
  static const List<String> _categories = [
    "Food",
    "Rent",
    "Bills",
    "Gaming",
    "Transport",
    "Shopping",
    "Subscriptions",
    "Health",
    "Education",
    "Entertainment"
  ];
  CategoryList._();

  static List<String> getCategories() {
    return _categories;
  }

  static String getCategoryAt(int index) {
    return _categories[index];
  }
}
