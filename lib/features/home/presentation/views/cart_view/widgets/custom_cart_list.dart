import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:store_app/constants.dart';
import 'package:store_app/core/utils/styles.dart';
import 'package:store_app/features/home/presentation/view_models/cart_cubit/cart_cubit.dart';
import 'package:store_app/features/home/presentation/views/cart_view/widgets/custom_cart_item.dart';

class CustomCartList extends StatelessWidget {
  const CustomCartList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        if (state is GetCartSuccess) {
          if (state.cartResponse.cartData!.cartItems!.isEmpty) {
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
                cartItem: state.cartResponse.cartData!.cartItems![index],
              ),
              separatorBuilder: (context, index) => const Divider(),
              itemCount: state.cartResponse.cartData!.cartItems!.length,
            );
          }
        } else if (state is GetCartFailure) {
          return const Center(
            child: Icon(
              Icons.warning_amber,
              size: 40,
            ),
          );
        } else {
          return ListView.separated(
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) => Shimmer.fromColors(
              baseColor: Colors.grey[100]!,
              highlightColor: Colors.grey[400]!,
              child: Row(
                children: [
                  Container(
                    color: Colors.grey,
                    height: 80,
                    width: 80,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Container(
                      height: 20,
                      color: Colors.grey[100],
                    ),
                  ),
                ],
              ),
            ),
            separatorBuilder: (context, index) => const Divider(),
            itemCount: 8,
          );
        }
      },
    );
  }
}
