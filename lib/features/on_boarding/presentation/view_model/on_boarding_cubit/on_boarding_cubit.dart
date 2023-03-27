import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app/constants.dart';
import 'package:store_app/features/on_boarding/data/models/on_boarding_model.dart';

part 'on_boarding_state.dart';

class OnBoardingCubit extends Cubit<OnBoardingState> {
  OnBoardingCubit() : super(OnBoardingInitial());

  var onBoardingController = PageController();

  bool isLast = false;

  void changeOnBoarding() {
    onBoardingController.nextPage(
      duration: const Duration(milliseconds: 750),
      curve: Curves.fastLinearToSlowEaseIn,
    );
  }

  List<OnBoardingModel> models = [
    OnBoardingModel(
        'assets/images/onboarding_1.jpg', 'screenTitle', 'screenBody 1'),
    OnBoardingModel(
        'assets/images/onboarding_1.jpg', 'screenTitle', 'screenBody 2'),
    OnBoardingModel(
        'assets/images/onboarding_1.jpg', 'screenTitle', 'screenBody 3'),
  ];

  bool isLastIndex(int index) {
    if (index == models.length - 1) {
      isLast = true;
      emit(OnBoardingLastIndex());
    } else {
      isLast = false;
      emit(OnBoardingNotLastIndex());
    }
    return isLast;
  }

  void navigate(context) {
    if (isLast) {
      GoRouter.of(context).pushReplacement(kLoginView);
    } else {
      onBoardingController.nextPage(
        duration: const Duration(milliseconds: 750),
        curve: Curves.fastLinearToSlowEaseIn,
      );
    }
  }
}
