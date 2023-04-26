import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:store_app/features/home/data/models/cart_models/cart_response/cart_item.dart';
import 'package:store_app/features/home/presentation/views/cart_view/widgets/custom_cart_item.dart';

class CustomCartList extends StatelessWidget {
  const CustomCartList({Key? key, required this.items}) : super(key: key);

  final List<CartItem> items;

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) {
      return const Center(
        child: Text(
          'Cart Is Empty!!!',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
      );
    } else {
      return ListView.separated(
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) => CustomCartItem(
          cartItem: items[index],
        ),
        separatorBuilder: (context, index) => const Divider(),
        itemCount: items.length,
      );
    }
  }
}

