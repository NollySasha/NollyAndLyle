// Mocks generated by Mockito 5.0.16 from annotations
// in flutter_homepage_project/test/main_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i4;

import 'package:flutter_homepage_project/secure_storage.dart' as _i3;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

class _FakeFlutterSecureStorage_0 extends _i1.Fake
    implements _i2.FlutterSecureStorage {}

/// A class which mocks [SecureStorage].
///
/// See the documentation for Mockito's code generation for more information.
class MockSecureStorage extends _i1.Mock implements _i3.SecureStorage {
  MockSecureStorage() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.FlutterSecureStorage get storage => (super.noSuchMethod(
      Invocation.getter(#storage),
      returnValue: _FakeFlutterSecureStorage_0()) as _i2.FlutterSecureStorage);
  @override
  _i4.Future<String?> getToken() =>
      (super.noSuchMethod(Invocation.method(#getToken, []),
          returnValue: Future<String?>.value()) as _i4.Future<String?>);
  @override
  void setToken(String? token) =>
      super.noSuchMethod(Invocation.method(#setToken, [token]),
          returnValueForMissingStub: null);
  @override
  bool isLoggedIn() => (super.noSuchMethod(Invocation.method(#isLoggedIn, []),
      returnValue: false) as bool);
  @override
  String toString() => super.toString();
}
