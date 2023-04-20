import 'package:flutter/material.dart';
import 'package:store_app/features/home/presentation/views/favourite_view/widgets/favourite_item.dart';

class FavouriteList extends StatelessWidget {
  const FavouriteList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) => const FavouriteItem(),
        separatorBuilder: (context, index) => const Divider(),
        itemCount: 5);
  }
}
