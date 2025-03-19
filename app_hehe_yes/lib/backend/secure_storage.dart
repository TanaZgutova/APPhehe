import 'dart:math';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageService {
  static final _storage = FlutterSecureStorage();

  // Save a string to secure storage
  static Future<int> writeSecureData(String key, value) async {
    await _storage.write(key: key, value: value);
    final rngVal = Random.secure().nextInt(1 << 32);
    await _storage.write(key: "${key}_ID", value: rngVal.toString());
    return rngVal;
  }

  // Read a string from secure storage
  static Future<SecureData?> readSecureData(String key) async {
    var uname = await _storage.read(key: key);
    var id = await _storage.read(key: "${key}_ID");
    if (uname == null && id == null) {
      return null;
    }
    return SecureData(userName: uname!, id: int.tryParse(id!)!);
  }

  // Delete a specific key
  static Future<void> deleteSecureData(String key) async {
    await _storage.delete(key: key);
  }

  // Clear all secure storage data
  static Future<void> clearSecureData() async {
    await _storage.deleteAll();
  }
}

class SecureData {
  String userName;
  int id;

  SecureData({required this.userName, required this.id});
}
