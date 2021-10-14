import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  final storage = new FlutterSecureStorage();

  Future setValue(String key, String value) async {
    await storage.write(key: key, value: value);
  }

  Future deleteValue(String key) async {
    await storage.delete(key: key);
  }

  Future<String?> getValue(String key) async {
    return await storage.read(key: key);
  }

  Future<bool> isLoggedIn() async {
    bool result = false;
    var token = await getValue('token');
    if (token != null) result = true;
    return result;
  }
}
