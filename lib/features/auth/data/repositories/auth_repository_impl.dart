import 'package:flowery_e_commerce/core/networking/safe_api_call.dart';
import 'package:flowery_e_commerce/core/result/result.dart';
import 'package:flowery_e_commerce/features/auth/data/api/auth_api_client.dart';
import 'package:flowery_e_commerce/features/auth/data/models/request/login_request_dto.dart';
import 'package:flowery_e_commerce/features/auth/domain/entities/auth_session.dart';
import 'package:flowery_e_commerce/features/auth/domain/repositories/auth_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final AuthApiClient _authApiClient;

  AuthRepositoryImpl(this._authApiClient);

  @override
  Future<Result<AuthSession>> login({
    required String email,
    required String password,
  }) async {
    return safeCall(() async {
      final response = await _authApiClient.login(
        LoginRequestDto(email: email, password: password),
      );
      return response.toEntity();
    });
  }
}
