part of 'favourite_cubit.dart';

@immutable
abstract class FavouriteState {}

class FavouriteInitial extends FavouriteState {}

class GetFavouriteLoading extends FavouriteState {}

class GetFavouriteSuccess extends FavouriteState {
  final FavouriteResponse response;

  GetFavouriteSuccess(this.response);
}

class GetFavouriteFailure extends FavouriteState {
  final String errMessage;

  GetFavouriteFailure(this.errMessage);
}
