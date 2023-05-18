import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app/core/utils/app_router.dart';
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
        'assets/images/onboarding_1.jpg', 'Store App', 'Hot Offers'),
    OnBoardingModel(
        'assets/images/onboarding_1.jpg', 'Store App', 'User Friendly'),
    OnBoardingModel(
        'assets/images/onboarding_1.jpg', 'Store', 'High Performance'),
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
      GoRouter.of(context).pushReplacement(AppRouter.kLoginView);
    } else {
      onBoardingController.nextPage(
        duration: const Duration(milliseconds: 750),
        curve: Curves.fastLinearToSlowEaseIn,
      );
    }
  }
}
