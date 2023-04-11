import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:store_app/constants.dart';
import 'package:store_app/core/utils/app_router.dart';

class ProductModel extends StatelessWidget {
  const ProductModel({Key? key, required this.pushRout}) : super(key: key);
  final Function() pushRout;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: pushRout,
      child: Card(
        elevation: 20,
        child: Stack(
          alignment: AlignmentDirectional.topEnd,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CachedNetworkImage(
                  imageUrl:
                      'https://student.valuxapps.com/storage/uploads/products/1615440322npwmU.71DVgBTdyLL._SL1500_.jpg',
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    'IPhone',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    'Apple iPhone 12 Pro Max 256GB 6 GB RAM, Pacific Blue',
                    maxLines: 2,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      height: 1.5,
                    ),
                  ),
                ),
                const Spacer(),
                Row(
                  children: [
                    const SizedBox(
                      width: 8,
                    ),
                    const Text(
                      '25000 LE',
                      style: TextStyle(
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
                const Spacer(),
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
            )
          ],
        ),
      ),
    );
  }
}
