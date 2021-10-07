import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  final storage = new FlutterSecureStorage();

  Future<String?> getToken() async {
    return await storage.read(key: 'token');
  }

  void setToken(String token) async {
    await storage.write(key: 'token', value: token);
  }

  bool isLoggedIn() {
    bool result = false;
    getToken().then((value) {
      if (value != null) {
        result = true;
      }
    });
    return result;
  }
}
