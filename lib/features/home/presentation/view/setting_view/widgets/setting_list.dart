import 'package:flutter/material.dart';
import 'package:store_app/features/home/presentation/view/setting_view/widgets/custom_setting_item.dart';

class SettingsList extends StatelessWidget {
  const SettingsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
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
          iconData: Icons.warning_amber,
        ),
      ],
    );
  }
}