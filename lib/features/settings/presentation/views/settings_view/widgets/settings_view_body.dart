import 'package:flutter/material.dart';
import 'package:store_app/core/utils/styles.dart';
import 'package:store_app/features/settings/presentation/views/settings_view/widgets/settings_account_view.dart';
import 'package:store_app/features/settings/presentation/views/settings_view/widgets/settings_list.dart';
import 'custom_settings_appbar.dart';

class SettingsViewBody extends StatelessWidget {
  const SettingsViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsetsDirectional.symmetric(vertical: 15, horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          CustomSettingsAppBar(),
          SizedBox(
            height: 40,
          ),
          Text('Account', style: Styles.textStyle20),
          SizedBox(
            height: 15,
          ),
          AccountView(),
          SizedBox(
            height: 8,
          ),
          Divider(),
          SizedBox(
            height: 18,
          ),
          Text(
            "Settings",
            style: Styles.textStyle20,
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: SettingsList(),
          ),
        ],
      ),
    );
  }
}
