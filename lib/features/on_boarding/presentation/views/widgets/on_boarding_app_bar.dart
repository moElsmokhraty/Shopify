import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app/core/utils/app_router.dart';

class OnBoardingAppBar extends StatelessWidget {
  const OnBoardingAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(
          onPressed: () {
            GoRouter.of(context).pushReplacement(AppRouter.kLoginView);
          },
          child: const Text(
            'Skip',
            textAlign: TextAlign.end,
          ),
        ),
      ],
    );
  }
}
