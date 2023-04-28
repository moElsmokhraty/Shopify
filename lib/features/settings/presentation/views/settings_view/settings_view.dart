import 'package:flutter/material.dart';
import 'package:store_app/features/settings/presentation/views/settings_view/widgets/settings_view_body.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SettingsViewBody(),
      backgroundColor: Colors.white,
    );
  }
}
