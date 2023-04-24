part of 'setting_cubit.dart';

@immutable
abstract class SettingState {}

class SettingInitial extends SettingState {}

class LogOutLoading extends SettingState {}

class LogOutSuccess extends SettingState {}

class LogOutFailure extends SettingState {
  final String errMessage;

  LogOutFailure(this.errMessage);
}

class GetProfileLoading extends SettingState {}

class GetProfileSuccess extends SettingState {
  final UserDataResponse response;

  GetProfileSuccess(this.response);
}

class GetProfileFailure extends SettingState {
  final String errMessage;

  GetProfileFailure(this.errMessage);
}
