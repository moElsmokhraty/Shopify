import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/core/utils/app_assets.dart';
import 'package:store_app/core/utils/app_router.dart';
import 'package:store_app/features/home/presentation/view_models/cart_cubit/cart_cubit.dart';
import 'package:badges/badges.dart' as badges;

class CartButton extends StatelessWidget {
  const CartButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) => InkWell(
        onTap: () {
          AppRouter.router.push(
            AppRouter.kCartView,
            extra: state is GetCartSuccess ? state.cartResponse : null,
          );
        },
        child: badges.Badge(
          showBadge: state is GetCartSuccess &&
              state.cartResponse.cartData!.cartItems!.isNotEmpty,
          badgeContent: (state is GetCartSuccess)
              ? Text(
                  state.cartResponse.cartData!.cartItems!.length > 9
                      ? '+9'
                      : state.cartResponse.cartData!.cartItems!.length
                          .toString(),
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                )
              : null,
          child: SizedBox(
            height: 30,
            width: 28,
            child: Image.asset(
              AppAssets.shoppingBagIcon,
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    );
  }
}
