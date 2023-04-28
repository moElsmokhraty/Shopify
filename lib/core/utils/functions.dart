import 'package:flutter/material.dart';
import 'package:store_app/core/widgets/loading_screen.dart';
import 'package:store_app/features/home/data/models/favourite_models/get_favourite_models/get_favourite_model.dart';
import 'package:store_app/features/home/presentation/view_models/cart_cubit/cart_cubit.dart';
import 'package:store_app/features/home/presentation/view_models/favourite_cubit/favourite_cubit.dart';
import 'package:store_app/features/home/presentation/view_models/home_cubit/home_cubit.dart';

void removeFavourite({
  required BuildContext context,
  required GetFavouriteModel favouriteModel,
  required HomeCubit homeCubit,
  required FavouriteCubit favouriteCubit,
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
    cartCubit.getCart().then((value){
      homeCubit.getHomeData();
    });
  });
}
