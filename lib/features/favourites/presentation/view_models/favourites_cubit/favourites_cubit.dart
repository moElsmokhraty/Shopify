import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:store_app/features/favourites/data/models/add_or_remove_favourite_models/add_or_remove_favourite_response.dart';
import 'package:store_app/features/favourites/data/models/get_favourites_models/get_favourites_response.dart';
import 'package:store_app/features/favourites/data/repos/favourite_repo/favourites_repo_impl.dart';

part 'favourites_state.dart';

class FavouritesCubit extends Cubit<FavouritesState> {
  FavouritesCubit(this._favouriteRepoImpl) : super(FavouritesInitial());

  final FavouritesRepoImpl _favouriteRepoImpl;

  bool initLoading = false;

  Future<void> getFavourites() async {
    emit(GetFavouritesLoading());
    var data = await _favouriteRepoImpl.fetchFavourites();
    data.fold((failure) {
      emit(GetFavouritesFailure(failure.errMessage));
    }, (response) {
      if (response.status == false) {
        emit(GetFavouritesFailure('error'));
      } else {
        emit(GetFavouritesSuccess(response));
      }
    });
  }

  Future<void> addOrRemoveFavourite(int productID) async {
    emit(AddOrRemoveFavouriteLoading());
    var data = await _favouriteRepoImpl.addOrRemoveFavourite(productID);
    data.fold((failure) {
      emit(AddOrRemoveFavouriteFailure(failure.errMessage));
    }, (response) {
      if (response.status == false) {
        emit(AddOrRemoveFavouriteFailure('error'));
      } else {
        emit(AddOrRemoveFavouriteSuccess(response));
      }
    });
  }
}
