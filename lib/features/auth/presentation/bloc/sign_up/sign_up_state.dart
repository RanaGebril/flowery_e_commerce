import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flowery_e_commerce/core/state_status/state_status.dart';
import 'package:flowery_e_commerce/features/auth/domain/entities/auth_session.dart';

class SignUpState extends Equatable {
  final StateStatus<AuthSession> signUpState;
  final String selectedGender;
  final File? photo;
  final StateStatus<String> uploadPhotoState;

  const SignUpState({
    this.signUpState = const StateStatus.initial(),
    this.selectedGender = 'female',
    this.photo,
    this.uploadPhotoState = const StateStatus.initial(),
  });

  SignUpState copyWith({
    StateStatus<AuthSession>? signUpState,
    String? selectedGender,
    File? photo,
    StateStatus<String>? uploadPhotoState,
  }) {
    return SignUpState(
      signUpState: signUpState ?? this.signUpState,
      selectedGender: selectedGender ?? this.selectedGender,
      photo: photo,
      uploadPhotoState: uploadPhotoState ?? this.uploadPhotoState,
    );
  }

  @override
  List<Object?> get props => [
    signUpState,
    selectedGender,
    photo,
    uploadPhotoState,
  ];
}
