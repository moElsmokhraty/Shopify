import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/constants.dart';
import 'package:store_app/core/utils/AssetsApp.dart';
import 'package:store_app/features/home/presentation/view/home_view/widgets/home_view_body.dart';
import 'package:store_app/features/home/presentation/view_models/home_cubits/home_cubit.dart';
import 'package:store_app/features/home/presentation/view_models/home_cubits/home_state.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        HomeCubit cubit = BlocProvider.of(context);
        return Scaffold(
          body: const SafeArea(
            child: HomeBodyView(),
          ),
          bottomNavigationBar: BottomNavigationBar(
            onTap: (value) {
              cubit.changeNavigationBar(value);
            },
            currentIndex: cubit.navigationBarIndex,
            selectedIconTheme: const IconThemeData(color: kMainColor),
            selectedItemColor: Colors.black,
            unselectedItemColor: Colors.grey,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            selectedLabelStyle: const TextStyle(color: Colors.black),
            items: [
              BottomNavigationBarItem(
                  icon: Image.asset(AssetsApp.homeIcon, color : (cubit.navigationBarIndex == 0) ? kMainColor: Colors.grey, height: 25, width: 25),
                  label: "Home"),
              BottomNavigationBarItem(
                  icon:
                      Image.asset(AssetsApp.voucherIcon,color : (cubit.navigationBarIndex == 1) ? kMainColor: Colors.grey, height: 25, width: 25),
                  label: "Voucher"),
              const BottomNavigationBarItem(
                  icon: Icon(Icons.wallet), label: "Wallet"),
              const BottomNavigationBarItem(
                  icon: Icon(Icons.settings), label: "Setting"),
            ],
          ),
        );
      },
    );
  }
}
