import 'package:flutter/material.dart';
import 'package:store_app/constants.dart';
import 'package:store_app/core/widgets/custom_name_bio_view.dart';
import 'package:store_app/features/home/presentation/views/edit_profile_view/widgets/custom_text_field.dart';

class EditProfileDetails extends StatelessWidget {
  const EditProfileDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundColor: Colors.grey[300],
            radius: 40,
            child: const Icon(
              Icons.person_2_sharp,
              size: 60,
              color: kMainColor,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          const NameAndBio(
            crossAxisAlignment: CrossAxisAlignment.center,
            space: 10,
          ),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10),
            child: ListView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                CustomTextField(
                  controller: TextEditingController(),
                  label: 'Name',
                  validator: (value) {},
                ),
                const SizedBox(
                  height: 8,
                ),
                CustomTextField(
                  controller: TextEditingController(),
                  label: 'Bio',
                  validator: (value) {},
                ),
                const SizedBox(
                  height: 8,
                ),
                CustomTextField(
                  controller: TextEditingController(),
                  label: 'Email',
                  type: TextInputType.emailAddress,
                  validator: (value) {},
                ),
                const SizedBox(
                  height: 8,
                ),
                CustomTextField(
                  controller: TextEditingController(),
                  label: 'Password',
                  type: TextInputType.visiblePassword,
                  validator: (value) {},
                  obscured: true,
                  isItPassword: true,
                ),
                const SizedBox(
                  height: 8,
                ),
                CustomTextField(
                  controller: TextEditingController(),
                  label: 'Confirm Password',
                  obscured: true,
                  isItPassword: true,
                  type: TextInputType.visiblePassword,
                  validator: (value) {},
                ),
                const SizedBox(
                  height: 8,
                ),
                CustomTextField(
                  controller: TextEditingController(),
                  label: 'phone',
                  type: TextInputType.phone,
                  validator: (value) {},
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
