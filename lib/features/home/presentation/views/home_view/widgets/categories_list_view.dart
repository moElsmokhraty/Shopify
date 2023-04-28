import 'package:flutter/material.dart';
import 'category_item.dart';

class CategoriesListView extends StatelessWidget {
  const CategoriesListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      children: const [
        CategoryItem(
          icon: Icon(Icons.apps_rounded),
          label: "Category",
        ),
        SizedBox(width: 25),
        CategoryItem(
            icon: Icon(
              Icons.flight_outlined,
            ),
            label: "Flight"),
        SizedBox(width: 25),
        CategoryItem(icon: Icon(Icons.money_outlined), label: "Bill"),
        SizedBox(width: 25),
        CategoryItem(
            icon: Icon(Icons.network_check_sharp), label: "Data Plane"),
        SizedBox(width: 25),
        CategoryItem(icon: Icon(Icons.add_to_photos_outlined), label: "Top UP"),
      ],
    );
  }
}
