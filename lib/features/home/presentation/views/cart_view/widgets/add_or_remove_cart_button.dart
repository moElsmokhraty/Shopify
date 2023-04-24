import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/features/home/data/models/home_data_model/product.dart';
import 'package:store_app/features/home/presentation/view_models/cart_cubit/cart_cubit.dart';
import 'package:store_app/features/home/presentation/view_models/home_cubit/home_cubit.dart';
import 'package:store_app/features/home/presentation/views/home_view/widgets/loading_screen.dart';

class AddOrRemoveCartButton extends StatelessWidget {
  const AddOrRemoveCartButton({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) => InkWell(
        onTap: () async {
          await BlocProvider.of<CartCubit>(context)
              .addOrRemoveCart(productId: product.id!)
              .then((value) {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return const Loading();
              },
            );
            BlocProvider.of<HomeCubit>(context).getHomeData();
            BlocProvider.of<CartCubit>(context).getCart();
          });
        },
        child: Icon(product.inCart!
            ? Icons.remove_shopping_cart_outlined
            : Icons.add_shopping_cart_outlined),
      ),
    );
  }
}
