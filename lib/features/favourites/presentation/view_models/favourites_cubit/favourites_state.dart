part of 'favourites_cubit.dart';

@immutable
abstract class FavouritesState {}

class FavouritesInitial extends FavouritesState {}

class InitGetFavouritesLoading extends FavouritesState {}

class GetFavouritesLoading extends FavouritesState {}

class GetFavouritesSuccess extends FavouritesState {
  final GetFavouritesResponse response;

  GetFavouritesSuccess(this.response);
}

class GetFavouritesFailure extends FavouritesState {
  final String errMessage;

  GetFavouritesFailure(this.errMessage);
}

class AddOrRemoveFavouriteLoading extends FavouritesState {}

class AddOrRemoveFavouriteSuccess extends FavouritesState {
  final AddOrRemoveFavouriteResponse response;

  AddOrRemoveFavouriteSuccess(this.response);
}

class AddOrRemoveFavouriteFailure extends FavouritesState {
  final String errMessage;

  AddOrRemoveFavouriteFailure(this.errMessage);
}
