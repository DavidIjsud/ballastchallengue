part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class OnLogin extends LoginEvent {
  final String user;
  final String password;

  const OnLogin({
    required this.password,
    required this.user,
  });

  @override
  List<Object> get props => [
        user,
        password,
      ];
}
