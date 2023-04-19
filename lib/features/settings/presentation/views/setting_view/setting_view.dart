import 'package:flutter/material.dart';
import 'package:store_app/features/settings/presentation/views/setting_view/widgets/setting_body.dart';

class SettingView extends StatelessWidget {
  const SettingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SettingBody(),
      backgroundColor: Colors.white,
    );
  }
}
