import 'package:flutter/material.dart';
import 'package:store_app/features/home/presentation/views/cart_view/widgets/custom_cart_item.dart';

class CustomCartList extends StatelessWidget {
  const CustomCartList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) => const CustomCartItem(),
        separatorBuilder: (context, index) => const Divider(),
        itemCount: 5);
  }
}
