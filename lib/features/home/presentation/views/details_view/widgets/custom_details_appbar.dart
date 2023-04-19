import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:store_app/core/utils/app_assets.dart';
import 'package:store_app/core/utils/app_router.dart';

class DetailsAppBar extends StatelessWidget {
  const DetailsAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {
            AppRouter.router.pop();
          },
          icon: const Icon(Icons.arrow_back_ios_sharp),
        ),
        const Spacer(),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.favorite_outline_rounded,
            color: Colors.black,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.share_outlined,
            color: Colors.black,
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        badges.Badge(
          badgeContent: const Text("1"),
          child: SizedBox(
            height: 30,
            width: 28,
            child: Image.asset(
              AppAssets.shoppingBagIcon,
              fit: BoxFit.fill,
            ),
          ),
        ),
        const SizedBox(
          width: 15,
        ),
      ],
    );
  }
}
