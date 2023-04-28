import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/constants.dart';
import 'package:store_app/core/utils/functions.dart';
import 'package:store_app/features/cart/presentation/view_models/cart_cubit/cart_cubit.dart';
import 'package:store_app/features/home/presentation/view_models/details_cubit/details_cubit.dart';
import 'package:store_app/features/home/presentation/view_models/home_cubit/home_cubit.dart';
import 'package:store_app/features/home/presentation/views/details_view/widgets/custom_product_images.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeCubit homeCubit = BlocProvider.of(context);
    CartCubit cartCubit = BlocProvider.of(context);
    DetailsCubit detailsCubit = BlocProvider.of(context);
    return BlocBuilder<DetailsCubit, DetailsState>(
      builder: (context, state) {
        if (state is GetDetailsSuccess) {
          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomProductImages(
                  images: state.product.images!,
                ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8.0,
                  ),
                  child: Text(
                    state.product.name!,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      height: 1.5,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    const SizedBox(
                      width: 8,
                    ),
                    InkWell(
                      onTap: () async {
                        if (state.product.inCart! == false) {
                          addOrRemoveCart(
                            context: context,
                            productId: state.product.id!,
                            homeCubit: homeCubit,
                            cartCubit: cartCubit,
                            milliseconds: 7000,
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Row(
                                children: const [
                                  Icon(Icons.error),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Text("Already Item in Cart"),
                                ],
                              ),
                            ),
                          );
                        }
                      },
                      child: Container(
                        width: 100,
                        height: 40,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(
                              7,
                            ),
                          ),
                          color: Colors.green,
                        ),
                        child: const Center(
                          child: Text(
                            "Add  to cart",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const Spacer(),
                    Text(
                      '${state.product.price!} LE',
                      style: const TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                        fontSize: 19,
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                const Text(
                  'Product Description',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                const Divider(),
                Text(
                  state.product.description!,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          );
        } else if (state is GetDetailsFailure) {
          return Center(
            child: Column(
              children: [
                const Icon(
                  Icons.error,
                  size: 40,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  state.errMessage,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(
              color: kMainColor,
            ),
          );
        }
      },
    );
  }
}
