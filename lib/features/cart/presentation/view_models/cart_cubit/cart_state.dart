part of 'cart_cubit.dart';

@immutable
abstract class CartState {}

class CartInitial extends CartState {}

class GetCartLoading extends CartState {}

class GetCartSuccess extends CartState {
  final GetCartResponse cartResponse;

  GetCartSuccess(this.cartResponse);
}

class GetCartFailure extends CartState {
  final String errMessage;

  GetCartFailure(this.errMessage);
}

class AddOrRemoveCartLoading extends CartState {}

class AddOrRemoveCartSuccess extends CartState {
  final AddOrRemoveCartResponse addOrRemoveResponse;

  AddOrRemoveCartSuccess(this.addOrRemoveResponse);
}

class AddOrRemoveCartFailure extends CartState {
  final String errMessage;

  AddOrRemoveCartFailure(this.errMessage);
}

class ChangeInCart extends CartState {}
