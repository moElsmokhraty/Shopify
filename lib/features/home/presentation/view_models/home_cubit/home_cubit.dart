import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/core/utils/service_locator.dart';
import 'package:store_app/features/favourites/data/repos/favourite_repo/favourites_repo_impl.dart';
import 'package:store_app/features/favourites/presentation/view_models/favourites_cubit/favourites_cubit.dart';
import 'package:store_app/features/favourites/presentation/views/favourite_view/favourite_view.dart';
import 'package:store_app/features/home/data/models/home_data_models/home_data_response.dart';
import 'package:store_app/features/home/data/repos/home_repo/home_repo_impl.dart';
import 'package:store_app/features/home/presentation/views/home_view/widgets/home_view_body.dart';
import 'package:store_app/features/home/presentation/view_models/home_cubit/home_state.dart';
import 'package:store_app/features/settings/data/repos/settings_repo/settings_repo_impl.dart';
import 'package:store_app/features/settings/presentation/view_models/settings_cubit/settings_cubit.dart';
import 'package:store_app/features/settings/presentation/views/settings_view/settings_view.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._homeRepImpl) : super(HomeInitial());
  final textController = TextEditingController();
  int navBarIndex = 0;
  bool firstTime = false;
  final HomeRepoImpl _homeRepImpl;

  late HomeDataResponse homeDataResponse;

  List<Widget> screens = [
    const HomeViewBody(),
    const Scaffold(),
    BlocProvider(
      create: (context) => FavouritesCubit(
        getIt.get<FavouritesRepoImpl>(),
      )..getFavourites(),
      child: const FavouritesView(),
    ),
    BlocProvider(
      create: (context) => SettingsCubit(
        getIt.get<SettingsRepoImpl>(),
      )..getProfile(),
      child: const SettingsView(),
    ),
  ];

  Future<void> getHomeData() async {
    if (firstTime == false) {
      firstTime = true;
      emit(InitHomeGetDataLoading());
    } else {
      emit(HomeGetDataLoading());
    }
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

  void changeNavBarIndex(index) {
    navBarIndex = index;
    emit(ChangeNavBarIndex());
  }
}
