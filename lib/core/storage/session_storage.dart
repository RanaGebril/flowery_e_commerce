import 'dart:convert';

import 'package:flowery_e_commerce/features/auth/data/models/response/user_dto.dart';
import 'package:flowery_e_commerce/features/auth/domain/entities/user_entity.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class SessionStorage {
  //instance of secure storage
  static const _storage = FlutterSecureStorage();

  static const _tokenKey = 'token';
  static const _userKey = 'current_user';

  Future<void> saveSession({
    required String token,
    required Map<String, dynamic> user,
  }) async {
    await _storage.write(
      key: _tokenKey,
      value: token,
    );

    await _storage.write(
      key: _userKey,
      value: jsonEncode(user),
    );
  }

  Future<String?> getToken() async {
    return _storage.read(key: _tokenKey);
  }

  Future<UserEntity?> getUser() async {
    final userJson = await _storage.read(key: _userKey);

    if (userJson == null) return null;

    final userMap = jsonDecode(userJson) as Map<String, dynamic>;

    return UserDto.fromJson(userMap).toEntity();
  }

  Future<bool> isLoggedIn() async {
    final token = await getToken();
    return token != null && token.isNotEmpty;
  }

  Future<void> clearSession() async {
    await _storage.delete(key: _tokenKey);
    await _storage.delete(key: _userKey);
  }
}