import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:store_app/features/home/presentation/view_models/home_cubits/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  final textController = TextEditingController();
  final focusNode = FocusNode();
  int bannerIndex = 0;
  int navigationBarIndex = 0;

  void currentBannerIndex(ind) {
    bannerIndex = ind;
    emit(ChangeBanner());
  }
  void changeNavigationBar(index){
    navigationBarIndex = index;
    emit(ChangeNavigationBar());
  }
}
