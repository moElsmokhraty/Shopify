import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/core/utils/styles.dart';
import 'package:store_app/core/widgets/custom_arrow_back_button.dart';
import 'package:store_app/features/home/presentation/view_models/home_cubit/home_cubit.dart';

class FavouriteAppBar extends StatelessWidget {
  const FavouriteAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeCubit homeCubit = BlocProvider.of<HomeCubit>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomIconButton(
            onTap: () {
              homeCubit.changeNavBarIndex(0);
              homeCubit.getHomeData();
            },
            iconData: Icons.arrow_back_sharp,
          ),
          const SizedBox(
            height: 15,
          ),
          const Text(
            "Favourites",
            style: Styles.textStyle24,
          ),
        ],
      ),
    );
  }
}
