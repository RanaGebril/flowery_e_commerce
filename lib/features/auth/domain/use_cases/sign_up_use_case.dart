import 'package:flowery_e_commerce/core/result/result.dart';
import 'package:flowery_e_commerce/features/auth/domain/entities/auth_session.dart';
import 'package:flowery_e_commerce/features/auth/domain/entities/sign_up_entity.dart';
import 'package:flowery_e_commerce/features/auth/domain/repositories/auth_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class SignUpUseCase {
  final AuthRepository _authRepository;

  SignUpUseCase(this._authRepository);

  Future<Result<AuthSession>> call({
    required SignUpEntity user
  }) {
    return _authRepository.signUp(user: user);
  }
}
