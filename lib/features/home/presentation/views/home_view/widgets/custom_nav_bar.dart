import 'package:flutter/material.dart';
import 'package:store_app/constants.dart';
import 'package:store_app/core/utils/app_assets.dart';
import 'package:store_app/features/home/presentation/view_models/home_cubit/home_cubit.dart';

class CustomNavBar extends StatelessWidget {
  const CustomNavBar({Key? key, required this.cubit}) : super(key: key);

  final HomeCubit cubit;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: (value) {
        cubit.changeNavBarIndex(value);
      },
      currentIndex: cubit.navBarIndex,
      selectedIconTheme: const IconThemeData(color: kMainColor),
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.grey,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      selectedLabelStyle: const TextStyle(color: Colors.black),
      items: [
        BottomNavigationBarItem(
            icon: Image.asset(AppAssets.homeIcon,
                color: (cubit.navBarIndex == 0) ? kMainColor : Colors.grey,
                height: 25,
                width: 25),
            label: "Home"),
        BottomNavigationBarItem(
            icon: Image.asset(AppAssets.voucherIcon,
                color: (cubit.navBarIndex == 1) ? kMainColor : Colors.grey,
                height: 25,
                width: 25),
            label: "Voucher"),
        const BottomNavigationBarItem(
            icon: Icon(Icons.favorite_outlined), label: "Favourites"),
        const BottomNavigationBarItem(
            icon: Icon(Icons.settings), label: "Settings"),
      ],
    );
  }
}
