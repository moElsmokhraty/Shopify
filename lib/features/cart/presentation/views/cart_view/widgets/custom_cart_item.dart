import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:store_app/constants.dart';
import 'package:store_app/core/utils/functions.dart';
import 'package:store_app/core/utils/styles.dart';
import 'package:store_app/features/cart/data/models/cart_model.dart';
import 'package:store_app/features/cart/presentation/view_models/cart_cubit/cart_cubit.dart';
import 'package:store_app/features/home/presentation/view_models/home_cubit/home_cubit.dart';

class CustomCartItem extends StatelessWidget {
  const CustomCartItem({Key? key, this.cartItem}) : super(key: key);

  final CartModel? cartItem;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    HomeCubit homeCubit = BlocProvider.of(context);
    CartCubit cartCubit = BlocProvider.of(context);
    return Slidable(
      closeOnScroll: false,
      key: const ValueKey(0),
      startActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: (context) {
              addOrRemoveCart(
                  context: context,
                  productId: cartItem!.product!.id!,
                  homeCubit: homeCubit,
                  cartCubit: cartCubit,
                milliseconds: 4000,
              );
            },
            backgroundColor: const Color(0xFFFE4A49),
            foregroundColor: Colors.white,
            autoClose: true,
            borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(20),
                topRight: Radius.circular(20)),
            icon: Icons.delete,
            label: 'Delete',
          ),
        ],
      ),
      child: Row(
        children: [
          CachedNetworkImage(
            imageUrl: cartItem!.product!.image!,
            height: 80,
            width: 80,
          ),
          const SizedBox(
            width: 20,
          ),
          SizedBox(
            width: size.width * 0.4,
            child: NameAndCountOfItem(
              name: cartItem!.product!.name!,
            ),
          ),
          const Spacer(),
          Text(
            cartItem!.product!.price!.toString(),
            style: Styles.textStyle18.copyWith(color: kMainColor),
          ),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
    );
  }
}

class NameAndCountOfItem extends StatelessWidget {
  const NameAndCountOfItem({Key? key, required this.name}) : super(key: key);

  final String name;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          name,
          style: Styles.textStyle20.copyWith(fontSize: 18),
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          'Quantity : 1',
          style: Styles.textStyle18.copyWith(fontSize: 15),
        ),
      ],
    );
  }
}
