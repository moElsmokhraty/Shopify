import 'package:flutter/material.dart';
import 'package:store_app/features/home/presentation/views/cart_view/widgets/cart_view_body.dart';

class CartView extends StatelessWidget {
  const CartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: CartViewBody()),
      backgroundColor: Colors.white,
    );
  }
}
