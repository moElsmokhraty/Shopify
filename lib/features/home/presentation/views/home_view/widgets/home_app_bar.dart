import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/core/utils/app_assets.dart';
import 'package:store_app/features/home/presentation/views/home_view/widgets/cart_button.dart';
import 'package:store_app/features/home/presentation/views/home_view/widgets/custom_auto_complete.dart';
import 'package:store_app/features/home/presentation/view_models/search_cubit/search_cubit.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsetsDirectional.only(start: 15, bottom: 8),
          child: Row(
            children: [
              AutocompleteExample(),
              const SizedBox(
                width: 25,
              ),
              const CartButton(),
              const SizedBox(
                width: 25,
              ),
              SizedBox(
                height: 35,
                width: 35,
                child: Image.asset(
                  AppAssets.messageIcon2,
                  fit: BoxFit.fill,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
            ],
          ),
        );
      },
    );
  }
}
