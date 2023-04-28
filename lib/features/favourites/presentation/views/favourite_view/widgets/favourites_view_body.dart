import 'package:flutter/material.dart';
import 'favourites_app_bar.dart';
import 'favourites_list.dart';

class FavouritesViewBody extends StatelessWidget {
  const FavouritesViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        FavouritesAppBar(),
        SizedBox(height: 15),
        Expanded(
          child: FavouritesList(),
        ),
      ],
    );
  }
}
