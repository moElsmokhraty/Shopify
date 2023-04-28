import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/features/on_boarding/presentation/view_model/on_boarding_cubit/on_boarding_cubit.dart';
import 'package:store_app/features/on_boarding/presentation/views/widgets/page_view_item.dart';

class CustomPageView extends StatelessWidget {
  const CustomPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    OnBoardingCubit cubit = BlocProvider.of(context);
    return Expanded(
      child: PageView.builder(
        controller: cubit.onBoardingController,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          cubit.isLastIndex(index);
          return PageViewItem(
            model: cubit.models[index],
          );
        },
        itemCount: 3,
      ),
    );
  }
}
