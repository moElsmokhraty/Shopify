import 'package:flutter/material.dart';
import 'package:store_app/features/cart/data/models/cart_model.dart';
import 'custom_cart_item.dart';

class CustomCartList extends StatelessWidget {
  const CustomCartList({
    Key? key,
    required this.items,
  }) : super(key: key);

  final List<CartModel> items;

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) {
      return const Center(
        child: Text(
          'Cart Is Empty!!!',
          style: TextStyle(
            color: Colors.grey,
            fontSize: 25,
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
