import 'package:flutter/material.dart';
import 'package:store_app/features/home/presentation/views/favourite_view/widgets/favourite_app_bar.dart';
import 'package:store_app/features/home/presentation/views/favourite_view/widgets/favourite_list.dart';

class FavouriteBody extends StatelessWidget {
  const FavouriteBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        FavouriteAppBar(),
        SizedBox(height: 15),
        Expanded(child: FavouriteList()),
      ],
    );
  }
}
