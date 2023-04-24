import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/features/home/presentation/view_models/cart_cubit/cart_cubit.dart';
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
      child: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          if (state is GetCartSuccess) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CartAppBar(),
                const SizedBox(
                  height: 25,
                ),
                SizedBox(
                  height: 350,
                  child: CustomCartList(
                    items: state.cartResponse.cartData!.cartItems!,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                TotalView(
                    totalPrice:
                        state.cartResponse.cartData!.subTotal!.toString()),
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
            );
          } else if (state is GetCartFailure) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CartAppBar(),
                const SizedBox(
                  height: 25,
                ),
                SizedBox(height: 350, child: Text(state.errMessage)),
                const SizedBox(
                  height: 30,
                ),
                const TotalView(totalPrice: '0'),
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
            );
          } else {
            return const ShimmerCustomCartList();
          }
        },
      ),
    );
  }
}
