part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
  @override
  List<Object> get props => [];
}

class UpdateEmail extends LoginEvent {
  const UpdateEmail({required this.email});

  final String email;

  @override
  List<Object> get props => [email];
}

class UpdatePassword extends LoginEvent {
  const UpdatePassword({required this.password});

  final String password;

  @override
  List<Object> get props => [password];
}

class LoginButton extends LoginEvent {
  const LoginButton();
}
