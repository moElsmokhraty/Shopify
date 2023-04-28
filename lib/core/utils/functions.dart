import 'package:flutter/material.dart';
import 'package:store_app/core/widgets/loading_screen.dart';
import 'package:store_app/features/cart/presentation/view_models/cart_cubit/cart_cubit.dart';
import 'package:store_app/features/favourites/data/models/favourite_model.dart';
import 'package:store_app/features/favourites/presentation/view_models/favourites_cubit/favourites_cubit.dart';
import 'package:store_app/features/home/presentation/view_models/home_cubit/home_cubit.dart';

void addOrRemoveFavourite({
  required BuildContext context,
  required FavouriteModel favouriteModel,
  required HomeCubit homeCubit,
  required FavouritesCubit favouriteCubit,
}) async {
  showDialog(
    context: context,
    builder: (context) => const Loading(
      milliseconds: 4000,
    ),
  );
  await favouriteCubit
      .addOrRemoveFavourite(favouriteModel.product!.id!)
      .then((value) {
    favouriteCubit.getFavourites();
    homeCubit.getHomeData();
  });
}

void addOrRemoveCart({
  required BuildContext context,
  required int productId,
  required HomeCubit homeCubit,
  required CartCubit cartCubit,
}) async {
  showDialog(
    context: context,
    builder: (context) => const Loading(
      milliseconds: 4000,
    ),
  );
  await cartCubit.addOrRemoveCart(productId: productId).then((value) {
    cartCubit.getCart();
  });
}
