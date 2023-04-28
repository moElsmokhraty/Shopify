part of 'details_cubit.dart';

@immutable
abstract class DetailsState {}

class DetailsInitial extends DetailsState {}

class GetDetailsLoading extends DetailsState {}

class GetDetailsSuccess extends DetailsState {
  final Product product;

  GetDetailsSuccess(this.product);
}

class GetDetailsFailure extends DetailsState {
  final String errMessage;

  GetDetailsFailure(this.errMessage);
}
