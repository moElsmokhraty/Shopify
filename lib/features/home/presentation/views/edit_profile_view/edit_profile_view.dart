import 'package:flutter/material.dart';
import 'package:store_app/features/home/presentation/views/edit_profile_view/widgets/edit_profile_body.dart';

class EditProfileView extends StatelessWidget {
  const EditProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: EditProfileBody(),
      ),
      backgroundColor: Colors.white,
    );
  }
}
