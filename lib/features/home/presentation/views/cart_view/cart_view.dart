import 'package:flutter/material.dart';
import 'package:store_app/features/home/data/models/cart_models/cart_response/get_cart_response.dart';
import 'package:store_app/features/home/presentation/views/cart_view/widgets/cart_view_body.dart';

class CartView extends StatelessWidget {
  const CartView({Key? key, required this.cartResponse}) : super(key: key);

  final GetCartResponse cartResponse;

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: CartViewBody(),
      ),
      backgroundColor: Colors.white,
    );
  }
}
