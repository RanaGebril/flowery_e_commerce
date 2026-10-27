import 'package:bloc/bloc.dart';
import 'package:flowery_e_commerce/core/result/result.dart';
import 'package:flowery_e_commerce/core/state_status/state_status.dart';
import 'package:flowery_e_commerce/features/auth/domain/entities/auth_session.dart';
import 'package:flowery_e_commerce/features/auth/domain/use_cases/sign_up_use_case.dart';
import 'package:flowery_e_commerce/features/auth/domain/use_cases/upload_profile_photo_use_case.dart';
import 'package:flowery_e_commerce/features/auth/presentation/bloc/sign_up/sign_up_event.dart';
import 'package:flowery_e_commerce/features/auth/presentation/bloc/sign_up/sign_up_state.dart';
import 'package:injectable/injectable.dart';

@injectable
class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final SignUpUseCase _signUpUseCase;
  final UploadProfilePhotoUseCase _uploadProfilePhotoUseCase;
  SignUpBloc(this._signUpUseCase, this._uploadProfilePhotoUseCase)
    : super(SignUpState()) {
    on<SignUpRequestEvent>(_signUp);
    on<SelectGenderEvent>(_selectGender);
    on<UploadProfilePhotoEvent>(_uploadProfilePhoto);
    on<UpdateProfilePhotoEvent>(_updateProfilePhoto);
    on<RemoveProfilePhotoEvent>(_removeProfilePhoto);
  }

  _signUp(SignUpRequestEvent event, Emitter<SignUpState> emit) async {
    emit(state.copyWith(signUpState: StateStatus.loading()));

    var result = await _signUpUseCase.call(user: event.user);
    switch (result) {
      case SuccessResult<AuthSession>():
        emit(state.copyWith(signUpState: StateStatus.success(result.data)));
      case ErrorResult<AuthSession>():
        emit(state.copyWith(signUpState: StateStatus.failure(result.failure)));
    }
  }

  _selectGender(SelectGenderEvent event, Emitter<SignUpState> emit) {
    emit(state.copyWith(selectedGender: event.gender));
  }

  Future<void> _uploadProfilePhoto(
    UploadProfilePhotoEvent event,
    Emitter<SignUpState> emit,
  ) async {
    emit(state.copyWith(uploadPhotoState: const StateStatus.loading()));

    final result = await _uploadProfilePhotoUseCase.call(photo: event.photo);

    switch (result) {
      case SuccessResult<String>():
        emit(
          state.copyWith(uploadPhotoState: StateStatus.success(result.data)),
        );
      case ErrorResult<String>():
        emit(
          state.copyWith(uploadPhotoState: StateStatus.failure(result.failure)),
        );
    }
  }

  void _updateProfilePhoto(
    UpdateProfilePhotoEvent event,
    Emitter<SignUpState> emit,
  ) {
    emit(state.copyWith(photo: event.photo));
  }

  _removeProfilePhoto(
    RemoveProfilePhotoEvent event,
    Emitter<SignUpState> emit,
  ) {
    emit(state.copyWith(photo: null));
  }
}
