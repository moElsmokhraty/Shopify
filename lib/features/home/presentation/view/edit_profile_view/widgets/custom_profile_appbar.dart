import 'package:flutter/material.dart';
import 'package:store_app/core/utils/app_router.dart';
import 'package:store_app/core/utils/styles.dart';
import 'package:store_app/core/widgets/custom_arrow_back_button.dart';

class CustomEditProfileAppBar extends StatelessWidget {
  const CustomEditProfileAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      child: Row(
        children: [
          CustomIconButton(
              iconData: Icons.arrow_back_sharp,
              onTap: () {
                AppRouter.router.pop();
              }),
          const Spacer(),
          Text(
            "Edit Profile",
            style: Styles.textStyle20
                .copyWith(fontSize: 16, color: Colors.grey[700]),
          ),
          const Spacer(),
          CustomIconButton(
            iconData: Icons.check,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
