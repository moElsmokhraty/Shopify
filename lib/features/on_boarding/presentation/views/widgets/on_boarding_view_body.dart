import 'package:flutter/material.dart';
import 'package:store_app/features/on_boarding/presentation/views/widgets/custom_page_view.dart';
import 'package:store_app/features/on_boarding/presentation/views/widgets/navigation_row.dart';
import 'package:store_app/features/on_boarding/presentation/views/widgets/on_boarding_app_bar.dart';

class OnBoardingViewBody extends StatelessWidget {
  const OnBoardingViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: const [
          SizedBox(
            height: 10,
          ),
          OnBoardingAppBar(),
          CustomPageView(),
          SizedBox(
            height: 40,
          ),
          NavigationRow(),
        ],
      ),
    );
  }
}
