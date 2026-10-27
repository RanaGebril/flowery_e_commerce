import 'dart:io';
import 'package:flowery_e_commerce/core/result/result.dart';
import 'package:flowery_e_commerce/features/auth/domain/repositories/auth_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class UploadProfilePhotoUseCase {
  final AuthRepository _authRepository;

  UploadProfilePhotoUseCase(this._authRepository);

  Future<Result<String>> call({
    required File photo
  }) {
    return _authRepository.uploadProfilePhoto(photo: photo);
  }
}
