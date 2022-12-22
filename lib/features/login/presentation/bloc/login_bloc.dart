import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<OnLogin>(onLoginEvent);
  }

  Future<void> onLoginEvent(OnLogin event, Emitter<LoginState> emit) async {
    if (event.password == "admin" && event.user == "admin") {
      emit(LoginSuccess());
    }
  }
}
