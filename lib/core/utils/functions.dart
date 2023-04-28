import 'package:flutter/material.dart';
import 'package:store_app/core/widgets/loading_screen.dart';
import 'package:store_app/features/cart/presentation/view_models/cart_cubit/cart_cubit.dart';
import 'package:store_app/features/favourites/presentation/view_models/favourites_cubit/favourites_cubit.dart';
import 'package:store_app/features/home/presentation/view_models/home_cubit/home_cubit.dart';

void addOrRemoveFavourite({
  required BuildContext context,
  required int productId,
  required HomeCubit homeCubit,
  required FavouritesCubit favouriteCubit,
  int milliseconds = 4000,
}) async {
  showDialog(
    context: context,
    builder: (context) => Loading(
      milliseconds: milliseconds,
    ),
  );
  await favouriteCubit.addOrRemoveFavourite(productId).then(
      (value) => favouriteCubit
          .getFavourites()
          .then((value) => homeCubit.getHomeData()));
}

void addOrRemoveCart({
  required BuildContext context,
  required int productId,
  required HomeCubit homeCubit,
  required CartCubit cartCubit,
  required int milliseconds,
}) async {
  showDialog(
    context: context,
    builder: (context) => Loading(
      milliseconds: milliseconds,
    ),
  );
  await cartCubit.addOrRemoveCart(productId: productId).then((value) {
    cartCubit.getCart();
  });
}
