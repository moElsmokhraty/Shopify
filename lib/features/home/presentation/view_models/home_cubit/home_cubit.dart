import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/core/utils/service_locator.dart';
import 'package:store_app/features/home/data/models/home_data_model/home_data_response.dart';
import 'package:store_app/features/home/data/repos/home_repo/home_repo_impl.dart';
import 'package:store_app/features/home/presentation/views/home_view/widgets/home_view_body.dart';
import 'package:store_app/features/home/presentation/view_models/home_cubit/home_state.dart';
import 'package:store_app/features/settings/data/repos/settings_repo/settings_repo_impl.dart';
import 'package:store_app/features/settings/presentation/view_models/setting_cubit/setting_cubit.dart';
import '../../../../settings/presentation/views/setting_view/setting_view.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._homeRepImpl) : super(HomeInitial());
  final textController = TextEditingController();

  int bannerIndex = 0;
  int navBarIndex = 0;

  final HomeRepoImpl _homeRepImpl;

  late HomeDataResponse homeDataResponse;

  List<Widget> screens = [
    const HomeBodyView(),
    const Scaffold(),
    const Scaffold(),
    BlocProvider(
      create: (context) => SettingCubit(
        getIt.get<SettingsRepoImpl>(),
      ),
      child: const SettingView(),
    ),
  ];

  Future<void> getHomeData() async {
    emit(HomeGetDataLoading());
    var result = await _homeRepImpl.getHomeData();
    result.fold((failure) {
      emit(HomeGetDataFailure(failure.errMessage));
    }, (response) {
      if (response.status == true) {
        homeDataResponse = response;
        emit(HomeGetDataSuccess());
      } else {
        emit(HomeGetDataFailure('error'));
      }
    });
  }

  void changeBannerIndex(ind) {
    bannerIndex = ind;
    //emit(ChangeBanner());
  }

  void changeNavBarIndex(index) {
    navBarIndex = index;
    emit(ChangeNavBarIndex());
  }
}
