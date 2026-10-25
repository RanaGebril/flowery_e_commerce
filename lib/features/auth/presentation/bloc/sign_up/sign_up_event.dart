import 'package:flowery_e_commerce/features/auth/domain/entities/sign_up_entity.dart';

abstract class SignUpEvent {}

class SignUpRequestEvent extends SignUpEvent {
  final SignUpEntity user;

  SignUpRequestEvent({required this.user});
}

class SelectGenderEvent extends SignUpEvent {
  final String gender;

  SelectGenderEvent({required this.gender});
}
