import 'package:bloc/bloc.dart';
import 'package:flowery_e_commerce/core/result/result.dart';
import 'package:flowery_e_commerce/core/state_status/state_status.dart';
import 'package:flowery_e_commerce/features/auth/domain/entities/auth_session.dart';
import 'package:flowery_e_commerce/features/auth/domain/use_cases/login_use_case.dart';
import 'package:flowery_e_commerce/features/auth/presentation/bloc/login/login_event.dart';
import 'package:flowery_e_commerce/features/auth/presentation/bloc/login/login_state.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUseCase _loginUseCase;
  LoginBloc(this._loginUseCase) : super(LoginState()) {
    on<LoginRequestEvent>(_login);
    on<ToggleRememberMeEvent>(_toggleRememberMe);
  }

  _login( LoginRequestEvent event,
      Emitter<LoginState> emit,)async{

    emit(state.copyWith(loginStatus: StateStatus.loading()));

    var result=await _loginUseCase.call(email: event.email, password: event.password);

    switch(result) {
      case SuccessResult<AuthSession>():
        emit(state.copyWith(
          loginStatus: StateStatus.success(result.data)
        ));
      case ErrorResult<AuthSession>():
       emit(state.copyWith(loginStatus: StateStatus.failure(result.failure)));
    }
  }

  _toggleRememberMe(ToggleRememberMeEvent event,
      Emitter<LoginState> emit,){
    emit(state.copyWith(
      rememberMeCheck: event.isChecked
    ));

  }
}
