import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/features/cart/presentation/view_models/cart_cubit/cart_cubit.dart';
import 'package:store_app/features/home/presentation/views/home_view/widgets/home_app_bar.dart';
import 'package:store_app/features/home/presentation/views/home_view/widgets/home_body_list_view.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<CartCubit>(context).getCart();
    return Column(
      children: const [
        SizedBox(
          height: 12,
        ),
        HomeAppBar(),
        SizedBox(
          height: 5,
        ),
        Expanded(
          child: HomeBodyListView(),
        ),
      ],
    );
  }
}
