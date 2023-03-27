part of 'register_cubit.dart';

@immutable
abstract class RegisterState {}

class RegisterInitial extends RegisterState {}

class RegisterSuccess extends RegisterState {
  final UserDataResponse userDataResponse;

  RegisterSuccess(this.userDataResponse);
}

class RegisterLoading extends RegisterState {}

class RegisterFailure extends RegisterState {
  final String errMessage;

  RegisterFailure(this.errMessage);
}

class RegisterChangePasswordVisibility extends RegisterState {}
