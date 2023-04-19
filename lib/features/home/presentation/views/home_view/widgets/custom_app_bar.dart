import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/core/utils/app_assets.dart';
import 'package:store_app/features/home/presentation/views/home_view/widgets/custom_auto_complete.dart';
import 'package:store_app/features/home/presentation/view_models/search_cubit/search_cubit.dart';
import 'package:badges/badges.dart' as badges;

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);

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
              badges.Badge(
                badgeContent: const Text("6"),
                child: SizedBox(
                  height: 30,
                  width: 28,
                  child: Image.asset(
                    AppAssets.shoppingBagIcon,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              const SizedBox(
                width: 25,
              ),
              badges.Badge(
                badgeContent: const Text("9"),
                child: SizedBox(
                  height: 35,
                  width: 35,
                  child: Image.asset(
                    AppAssets.messageIcon2,
                    fit: BoxFit.fill,
                  ),
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
