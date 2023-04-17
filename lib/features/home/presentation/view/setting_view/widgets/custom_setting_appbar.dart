import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/core/utils/styles.dart';
import 'package:store_app/core/widgets/custom_arrow_back_button.dart';
import 'package:store_app/features/home/presentation/view_models/home_cubit/home_cubit.dart';

class CustomSettingAppBar extends StatelessWidget {
  const CustomSettingAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<HomeCubit>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomIconButton(
            iconData: Icons.arrow_back_sharp,
            onTap: () {
              cubit.changeNavBarIndex(0);
            }),
        const SizedBox(
          height: 20,
        ),
        Text(
          'Settings',
          style: Styles.textStyle24
              .copyWith(fontSize: 22, fontWeight: FontWeight.w400),
        ),
      ],
    );
  }
}
