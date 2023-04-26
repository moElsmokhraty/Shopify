import 'package:flutter/material.dart';
import 'package:store_app/features/home/data/models/cart_models/cart_response/get_cart_response.dart';
import 'package:store_app/features/home/presentation/views/cart_view/widgets/cart_app_bar.dart';
import 'package:store_app/features/home/presentation/views/cart_view/widgets/custom_cart_list.dart';
import 'package:store_app/features/home/presentation/views/cart_view/widgets/custom_check_button.dart';
import 'package:store_app/features/home/presentation/views/cart_view/widgets/custom_total_view.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({Key? key, required this.cartResponse}) : super(key: key);

  final GetCartResponse cartResponse;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CartAppBar(),
          const SizedBox(
            height: 25,
          ),
          SizedBox(
            height: 350,
            child: CustomCartList(
              items: cartResponse.cartData!.cartItems!,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          TotalView(totalPrice: cartResponse.cartData!.subTotal!.toString()),
          const Spacer(),
          Center(
            child: CustomCheckButton(
              onTap: () {},
            ),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
