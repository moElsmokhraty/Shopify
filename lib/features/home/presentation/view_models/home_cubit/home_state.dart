import 'package:store_app/features/home/data/models/home_data_models/home_data_response.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class ChangeBanner extends HomeState {}

class ChangeNavBarIndex extends HomeState {}

class HomeGetDataLoading extends HomeState {}

class InitHomeGetDataLoading extends HomeState {}

class HomeGetDataSuccess extends HomeState {
  final HomeDataResponse homeDataResponse;

  HomeGetDataSuccess(this.homeDataResponse);
}

class HomeGetDataFailure extends HomeState {
  final String errMessage;

  HomeGetDataFailure(this.errMessage);
}
