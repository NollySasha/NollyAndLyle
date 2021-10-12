import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  final storage = new FlutterSecureStorage();

  Future getValue(String key) async {
    return await storage.read(key: key);
  }

  Future setValue(String key, String value) async {
    await storage.write(key: key, value: value);
  }

  Future deleteValue(String key) async {
    await storage.delete(key: key);
  }

  bool isLoggedIn() {
    bool result = false;
    getValue('token').then((value) => {if (value != null) result = true});
    return result;
  }
}
