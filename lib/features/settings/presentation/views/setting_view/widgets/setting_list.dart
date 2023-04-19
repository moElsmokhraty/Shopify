import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app/constants.dart';
import 'package:store_app/core/utils/app_router.dart';
import 'package:store_app/core/utils/cache_helper.dart';
import 'package:store_app/features/settings/presentation/view_models/setting_cubit/setting_cubit.dart';
import 'custom_setting_item.dart';

class SettingsList extends StatelessWidget {
  const SettingsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SettingCubit, SettingState>(
      listener: (context, state) async {
        if (state is LogOutSuccess) {
          CacheHelper.removeData(key: kToken);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Logged Out Successfully'),
            ),
          );
          GoRouter.of(context).pushReplacement(AppRouter.kLoginView);
        } else if (state is LogOutFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('An error occurred'),
            ),
          );
        }
      },
      builder: (context, state) => ListView(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        children: [
          CustomSettingItem(
            onTap: () {},
            text: "Notification",
            iconData: Icons.notifications_outlined,
          ),
          const SizedBox(
            height: 30,
          ),
          CustomSettingItem(
            onTap: () {},
            text: "Language",
            iconData: Icons.language,
          ),
          const SizedBox(
            height: 30,
          ),
          CustomSettingItem(
            onTap: () {},
            text: "Privacy",
            iconData: Icons.lock_outline,
          ),
          const SizedBox(
            height: 30,
          ),
          CustomSettingItem(
            onTap: () {},
            text: "Help Center",
            iconData: Icons.help_outline,
          ),
          const SizedBox(
            height: 30,
          ),
          CustomSettingItem(
            onTap: () {},
            text: "About Us",
            iconData: Icons.error_outline_outlined,
          ),
          const SizedBox(
            height: 30,
          ),
          state is LogOutLoading
              ? const Center(
                  child: CircularProgressIndicator(
                  color: kMainColor,
                ))
              : CustomSettingItem(
                  onTap: () async {
                    await BlocProvider.of<SettingCubit>(context).logout();
                  },
                  text: "Log Out",
                  iconData: Icons.logout_outlined,
                )
        ],
      ),
    );
  }
}
