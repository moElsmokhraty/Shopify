part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginSuccess extends LoginState {
  final UserDataResponse userDataResponse;

  LoginSuccess(this.userDataResponse);
}

class LoginLoading extends LoginState {}

class LoginFailure extends LoginState {
  final String errMessage;

  LoginFailure(this.errMessage);
}

class LoginChangePasswordVisibility extends LoginState {}
