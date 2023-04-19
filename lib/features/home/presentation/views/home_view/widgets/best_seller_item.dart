import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:store_app/constants.dart';
import 'package:store_app/features/home/data/models/home_data_model/product.dart';

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
                      return Text('fuck');
                    },
                    placeholder: (context, url) {
                      return Text('fuck');
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
                    InkWell(
                      onTap: () {},
                      child: Icon(
                        Icons.add_shopping_cart,
                        color: Colors.grey[600],
                      ),
                    ),
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
              onTap: () {},
              child: Container(
                height: 30,
                width: 30,
                color: Colors.grey[100],
                child: const Icon(
                  Icons.favorite_outline_rounded,
                  size: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
