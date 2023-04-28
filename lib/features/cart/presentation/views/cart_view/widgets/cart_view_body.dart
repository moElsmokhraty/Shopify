import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/core/widgets/custom_shimmer_list_view.dart';
import 'package:store_app/features/cart/presentation/view_models/cart_cubit/cart_cubit.dart';
import 'cart_app_bar.dart';
import 'custom_cart_list.dart';
import 'custom_check_button.dart';
import 'custom_total_view.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 15),
      child: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          if (state is GetCartFailure) {
            return Center(
              child: Text(
                state.errMessage,
              ),
            );
          }
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CartAppBar(),
              const SizedBox(
                height: 25,
              ),
              SizedBox(
                height: 350,
                child: state is GetCartSuccess
                    ? CustomCartList(
                        items: state.cartResponse.cartData!.cartItems!,
                      )
                    : const CustomShimmerList(itemCount: 5),
              ),
              const SizedBox(
                height: 30,
              ),
              TotalView(
                totalPrice: state is GetCartSuccess
                    ? state.cartResponse.cartData!.subTotal!.toString()
                    : '-----',
              ),
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
        },
      ),
    );
  }
}
