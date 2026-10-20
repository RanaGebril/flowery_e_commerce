abstract class LoginEvent {}

class LoginRequestEvent extends LoginEvent {
  final String email;
  final String password;
  LoginRequestEvent({required this.email, required this.password});
}

class ToggleRememberMeEvent extends LoginEvent {
  final bool isChecked;

  ToggleRememberMeEvent({required this.isChecked});
}
