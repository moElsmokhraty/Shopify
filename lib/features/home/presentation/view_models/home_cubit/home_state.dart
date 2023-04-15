abstract class HomeState {}

class HomeInitial extends HomeState {}

class ChangeBanner extends HomeState {}

class ChangeNavBarIndex extends HomeState {}

class HomeGetDataLoading extends HomeState {}

class HomeGetDataSuccess extends HomeState {}

class HomeGetDataFailure extends HomeState {
  final String errMessage;

  HomeGetDataFailure(this.errMessage);
}
