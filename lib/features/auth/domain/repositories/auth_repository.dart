import 'package:flowery_e_commerce/core/result/result.dart';
import 'package:flowery_e_commerce/features/auth/domain/entities/auth_session.dart';

abstract interface class AuthRepository {

  Future<Result<AuthSession>>  login({
    required String email,
    required String password,
  });

}