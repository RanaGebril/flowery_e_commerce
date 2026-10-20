import 'package:equatable/equatable.dart';
import 'package:flowery_e_commerce/core/state_status/state_status.dart';
import 'package:flowery_e_commerce/features/auth/domain/entities/auth_session.dart';

class LoginState extends Equatable {
  final StateStatus<AuthSession> loginStatus;
  final bool rememberMeCheck;

  const LoginState({
    this.loginStatus = const StateStatus.initial(),
    this.rememberMeCheck = false,
  });

  LoginState copyWith({
    StateStatus<AuthSession>? loginStatus,
    bool? rememberMeCheck,
  }) {
    return LoginState(
      loginStatus: loginStatus ?? this.loginStatus,
      rememberMeCheck: rememberMeCheck ?? this.rememberMeCheck,
    );
  }

  @override
  List<Object?> get props => [loginStatus, rememberMeCheck];
}
