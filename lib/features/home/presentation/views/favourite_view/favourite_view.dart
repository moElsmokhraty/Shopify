import 'package:flutter/material.dart';
import 'package:store_app/features/home/presentation/views/favourite_view/widgets/favourite_body.dart';

class FavouriteView extends StatelessWidget {
  const FavouriteView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: FavouriteBody(),
      ),
    );
  }
}
