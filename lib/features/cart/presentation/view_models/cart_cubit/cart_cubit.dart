import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/features/cart/data/models/add_or_remove_cart_models/add_or_remove_cart_response.dart';
import 'package:store_app/features/cart/data/models/get_cart_models/get_cart_response.dart';
import 'package:store_app/features/cart/data/repos/cart_repo/cart_repo_impl.dart';
part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit(this._cartRepoImpl) : super(CartInitial());

  final CartRepoImpl _cartRepoImpl;

  late IconData shoppingIcon;

  Future<void> getCart() async {
    emit(GetCartLoading());
    var data = await _cartRepoImpl.fetchCart();
    data.fold((failure) {
      emit(GetCartFailure(failure.errMessage));
    }, (cart) {
      if (cart.status == false) {
        emit(GetCartFailure('error'));
      } else {
        emit(GetCartSuccess(cart));
      }
    });
  }

  Future<void> addOrRemoveCart({required int productId}) async {
    emit(AddOrRemoveCartLoading());
    var data = await _cartRepoImpl.addOrRemoveCartItem(id: productId);
    data.fold((failure) {
      emit(AddOrRemoveCartFailure(failure.errMessage));
    }, (response) {
      if (response.status == false) {
        emit(AddOrRemoveCartFailure('error'));
      } else {
        emit(AddOrRemoveCartSuccess(response));
      }
    });
  }
}
