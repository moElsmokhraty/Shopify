import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/core/utils/app_router.dart';
import 'package:store_app/core/widgets/custom_arrow_back_button.dart';
import 'package:store_app/features/home/presentation/view_models/cart_cubit/cart_cubit.dart';

class CartAppBar extends StatelessWidget {
  const CartAppBar({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomIconButton(
          onTap: () {
            AppRouter.router.pushReplacement(AppRouter.kHomeView);
          },
          iconData: Icons.arrow_back_outlined,
        ),
        const SizedBox(
          height: 15,
        ),
        const Text(
          "MY\nCART",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
