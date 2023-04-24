import 'package:flutter/material.dart';
import 'package:store_app/features/home/presentation/views/cart_view/widgets/cart_app_bar.dart';
import 'package:store_app/features/home/presentation/views/cart_view/widgets/custom_cart_list.dart';
import 'package:store_app/features/home/presentation/views/cart_view/widgets/custom_check_button.dart';
import 'package:store_app/features/home/presentation/views/cart_view/widgets/custom_total_view.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({Key? key}) : super(key: key);

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
          const SizedBox(
            height: 350,
            child: CustomCartList(),
          ),
          const SizedBox(
            height: 30,
          ),
          const TotalView(),
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
