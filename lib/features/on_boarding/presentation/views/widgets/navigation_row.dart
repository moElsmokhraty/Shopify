import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:store_app/features/on_boarding/presentation/view_model/on_boarding_cubit/on_boarding_cubit.dart';

class NavigationRow extends StatelessWidget {
  const NavigationRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    OnBoardingCubit cubit = BlocProvider.of(context);
    return Row(
      children: [
        SmoothPageIndicator(
          controller: cubit.onBoardingController,
          count: cubit.models.length,
          effect: const ExpandingDotsEffect(
              activeDotColor: Colors.deepOrange,
              expansionFactor: 4,
              dotColor: Colors.grey,
              spacing: 5,
              dotWidth: 10),
        ),
        const Spacer(),
        FloatingActionButton(
          focusColor: Colors.deepOrange,
          autofocus: true,
          onPressed: () {
            cubit.navigate(context);
          },
          child: const Icon(Icons.arrow_forward_ios),
        )
      ],
    );
  }
}
