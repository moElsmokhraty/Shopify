part of 'setting_cubit.dart';

@immutable
abstract class SettingState {}

class SettingInitial extends SettingState {}

class LogOutSuccess extends SettingState {}

class LogOutFailure extends SettingState {
  final String errMessage;

  LogOutFailure(this.errMessage);
}

class LogOutLoading extends SettingState {}
