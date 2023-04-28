import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:store_app/core/models/product.dart';
import 'package:store_app/features/home/data/repos/details_repo/details_repo_impl.dart';

part 'details_state.dart';

class DetailsCubit extends Cubit<DetailsState> {
  DetailsCubit(this._detailsRepoImpl) : super(DetailsInitial());

  final DetailsRepoImpl _detailsRepoImpl;

  Future<void> getProductDetails(int productID) async {
    emit(GetDetailsLoading());
    var data = await _detailsRepoImpl.fetchProductDetails(productID);
    data.fold((failure) {
      emit(GetDetailsFailure(failure.errMessage));
    }, (response) {
      if (response.status == true) {
        emit(GetDetailsSuccess(response.product!));
      } else {
        emit(GetDetailsFailure('Unexpected error occurred'));
      }
    });
  }
}
