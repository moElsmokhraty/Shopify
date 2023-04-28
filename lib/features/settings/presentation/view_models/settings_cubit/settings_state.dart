part of 'settings_cubit.dart';

@immutable
abstract class SettingsState {}

class SettingsInitial extends SettingsState {}

class LogOutLoading extends SettingsState {}

class LogOutSuccess extends SettingsState {}

class LogOutFailure extends SettingsState {
  final String errMessage;

  LogOutFailure(this.errMessage);
}

class GetProfileLoading extends SettingsState {}

class GetProfileSuccess extends SettingsState {
  final UserDataResponse response;

  GetProfileSuccess(this.response);
}

class GetProfileFailure extends SettingsState {
  final String errMessage;

  GetProfileFailure(this.errMessage);
}
