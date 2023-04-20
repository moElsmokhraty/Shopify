part of 'details_cubit.dart';

@immutable
abstract class DetailsState {}

class DetailsInitial extends DetailsState {}

class GetDetailsLoading extends DetailsState {}

class GetDetailsSuccess extends DetailsState {
  final ProductDetails productDetails;

  GetDetailsSuccess(this.productDetails);
}

class GetDetailsFailure extends DetailsState {
  final String errMessage;

  GetDetailsFailure(this.errMessage);
}
