import 'package:flutter/material.dart';
import 'package:store_app/features/settings/presentation/views/edit_profile_view/widgets/custom_profile_appbar.dart';
import 'package:store_app/features/settings/presentation/views/edit_profile_view/widgets/edit_profile_details.dart';

class EditProfileBody extends StatelessWidget {
  const EditProfileBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        CustomEditProfileAppBar(),
        SizedBox(
          height: 30,
        ),
        Expanded(
          child: EditProfileDetails(),
        ),
      ],
    );
  }
}
