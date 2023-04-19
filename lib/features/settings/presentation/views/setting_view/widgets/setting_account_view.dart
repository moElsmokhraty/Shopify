import 'package:flutter/material.dart';
import 'package:store_app/constants.dart';
import 'package:store_app/core/utils/app_router.dart';
import 'package:store_app/core/widgets/custom_name_bio_view.dart';

class AccountView extends StatelessWidget {
  const AccountView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        AppRouter.router.push(AppRouter.kEditProfileView);
      },
      splashColor: Colors.transparent,
      highlightColor: Colors.grey[100],
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.grey[300],
            radius: 25,
            child: const Icon(
              Icons.person_2_sharp,
              size: 40,
              color: kMainColor,
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          const NameAndBio(),
          const Spacer(),
          Icon(
            Icons.arrow_forward_ios,
            color: Colors.grey[600],
          ),
        ],
      ),
    );
  }
}
