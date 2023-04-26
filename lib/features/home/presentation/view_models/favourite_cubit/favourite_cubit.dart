import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:store_app/features/home/data/models/favourite_models/add_or_remove_favourite_models/add_or_remove_favourite_response.dart';
import 'package:store_app/features/home/data/models/favourite_models/get_favourite_models/get_favourite_response.dart';
import 'package:store_app/features/home/data/repos/favourite_repo/favourite_repo_impl.dart';

part 'favourite_state.dart';

class FavouriteCubit extends Cubit<FavouriteState> {
  FavouriteCubit(this._favouriteRepoImpl) : super(FavouriteInitial());

  final FavouriteRepoImpl _favouriteRepoImpl;

  Future<void> getFavourites() async {
    emit(GetFavouriteLoading());
    var data = await _favouriteRepoImpl.getFavourites();
    data.fold((failure) {
      emit(GetFavouriteFailure(failure.errMessage));
    }, (response) {
      if (response.status == false) {
        emit(GetFavouriteFailure('error'));
      } else {
        emit(GetFavouriteSuccess(response));
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
