import 'package:flutter/material.dart';
import 'package:store_app/core/utils/styles.dart';
import 'package:store_app/core/widgets/custom_arrow_back_button.dart';

class FavouriteAppBar extends StatelessWidget {
  const FavouriteAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomIconButton(
            onTap: () {},
            iconData: Icons.arrow_back_sharp,
          ),
          const SizedBox(
            height: 15,
          ),
          const Text(
            "Favourite",
            style: Styles.textStyle24,
          ),
        ],
      ),
    );
  }
}
