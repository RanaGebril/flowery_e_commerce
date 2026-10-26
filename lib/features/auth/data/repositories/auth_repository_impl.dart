import 'dart:io';

import 'package:flowery_e_commerce/core/networking/safe_api_call.dart';
import 'package:flowery_e_commerce/core/result/result.dart';
import 'package:flowery_e_commerce/core/storage/session_storage.dart';
import 'package:flowery_e_commerce/features/auth/data/api/auth_api_client.dart';
import 'package:flowery_e_commerce/features/auth/data/models/request/login_request_dto.dart';
import 'package:flowery_e_commerce/features/auth/data/models/request/sign_up_request_dto.dart';
import 'package:flowery_e_commerce/features/auth/domain/entities/auth_session.dart';
import 'package:flowery_e_commerce/features/auth/domain/entities/sign_up_entity.dart';
import 'package:flowery_e_commerce/features/auth/domain/repositories/auth_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final AuthApiClient _authApiClient;
  final SessionStorage _sessionStorage;

  AuthRepositoryImpl(this._authApiClient, this._sessionStorage);

  @override
  Future<Result<AuthSession>> login({
    required String email,
    required String password,
  }) async {
    return safeCall(() async {
      final response = await _authApiClient.login(
        LoginRequestDto(email: email, password: password),
      );
      final session = response;
      await _sessionStorage.saveSession(
        token: session.token,
        user: session.user.toJson(),
      );

      return session.toEntity();
    });
  }

  @override
  Future<Result<AuthSession>> signUp({required SignUpEntity user}) {
    return safeCall(() async {
      final response = await _authApiClient.signUp(
        SignUpRequestDto(
          firstName: user.firstName,
          lastName: user.lastName,
          email: user.email,
          password: user.password,
          rePassword: user.rePassword,
          phone: user.phone,
          gender: user.gender,
        ),
      );
      final session = response;

      await _sessionStorage.saveSession(
        token: session.token,
        user: session.user.toJson(),
      );

      return session.toEntity();
    });
  }

  @override
  Future<Result<String>> uploadProfilePhoto({required File photo}) {
    return safeCall(() {
      return _authApiClient.uploadProfilePhoto(photo);
    },);
  }
}
