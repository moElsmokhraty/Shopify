import 'package:flutter/material.dart';
import 'package:store_app/features/favourites/presentation/views/favourite_view/widgets/favourites_view_body.dart';

class FavouritesView extends StatelessWidget {
  const FavouritesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: FavouritesViewBody(),
      ),
    );
  }
}
