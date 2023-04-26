part of 'favourite_cubit.dart';

@immutable
abstract class FavouriteState {}

class FavouriteInitial extends FavouriteState {}

class InitGetFavouriteLoading extends FavouriteState {}

class GetFavouriteLoading extends FavouriteState {}

class GetFavouriteSuccess extends FavouriteState {
  final GetFavouriteResponse response;

  GetFavouriteSuccess(this.response);
}

class GetFavouriteFailure extends FavouriteState {
  final String errMessage;

  GetFavouriteFailure(this.errMessage);
}

class AddOrRemoveFavouriteLoading extends FavouriteState {}

class AddOrRemoveFavouriteSuccess extends FavouriteState {
  final AddOrRemoveFavouriteResponse response;

  AddOrRemoveFavouriteSuccess(this.response);
}

class AddOrRemoveFavouriteFailure extends FavouriteState {
  final String errMessage;

  AddOrRemoveFavouriteFailure(this.errMessage);
}
