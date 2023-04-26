import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/constants.dart';
import 'package:store_app/features/home/data/models/home_data_model/product.dart';
import 'package:store_app/features/home/presentation/view_models/favourite_cubit/favourite_cubit.dart';
import 'package:store_app/features/home/presentation/view_models/home_cubit/home_cubit.dart';
import 'package:store_app/features/home/presentation/views/cart_view/widgets/add_or_remove_cart_button.dart';

class BestSellerItem extends StatelessWidget {
  const BestSellerItem({
    Key? key,
    required this.pushRoute,
    required this.product,
  }) : super(key: key);

  final Function() pushRoute;

  final Product product;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: pushRoute,
      child: Card(
        elevation: 20,
        child: Stack(
          alignment: AlignmentDirectional.topEnd,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: CachedNetworkImage(
                    height: 100,
                    width: 100,
                    imageUrl: product.image!,
                    errorWidget: (context, url, error) {
                      return const Icon(Icons.error_outlined);
                    },
                    placeholder: (context, url) {
                      return const Center(
                        child: CircularProgressIndicator(
                          color: kMainColor,
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    product.name!,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      height: 1.5,
                    ),
                  ),
                ),
                const Expanded(
                  child: SizedBox(
                    height: 15,
                  ),
                ),
                Row(
                  children: [
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      '${product.price!} LE',
                      style: const TextStyle(
                          color: kMainColor, fontWeight: FontWeight.bold),
                    ),
                    const Spacer(),
                    AddOrRemoveCartButton(product: product),
                    const SizedBox(
                      width: 8,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
              ],
            ),
            InkWell(
              onTap: () async {
                 BlocProvider.of<FavouriteCubit>(context).addOrRemoveFavourite(product.id!).then((value){
                  BlocProvider.of<HomeCubit>(context).getHomeData();
                });
              },
              child: Container(
                height: 30,
                width: 30,
                color: Colors.grey[100],
                child: Icon(
                  product.inFavorites!
                      ? Icons.favorite_outlined
                      : Icons.favorite_outline,
                  size: 20,
                  color: !product.inFavorites! ? Colors.grey[800] : kMainColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
