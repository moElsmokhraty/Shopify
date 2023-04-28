import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/core/utils/functions.dart';
import 'package:store_app/features/cart/presentation/view_models/cart_cubit/cart_cubit.dart';
import 'package:store_app/core/models/product.dart';
import 'package:store_app/features/home/presentation/view_models/home_cubit/home_cubit.dart';

class AddOrRemoveCartButton extends StatelessWidget {
  const AddOrRemoveCartButton({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    HomeCubit homeCubit = BlocProvider.of(context);
    CartCubit cartCubit = BlocProvider.of(context);
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) => InkWell(
        onTap: () async {
          addOrRemoveCart(
            context: context,
            productId: product.id!,
            homeCubit: homeCubit,
            cartCubit: cartCubit,
            milliseconds: 4000,
          );
          homeCubit.getHomeData();
        },
        child: Icon(product.inCart!
            ? Icons.remove_shopping_cart_outlined
            : Icons.add_shopping_cart_outlined),
      ),
    );
  }
}
