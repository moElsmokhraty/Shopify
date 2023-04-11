import 'package:flutter/material.dart';
import 'package:store_app/core/utils/AssetsApp.dart';

class CustomCategoriesView extends StatelessWidget {
  const CustomCategoriesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      children: const [
        CategoryModel(
          icon: Icon(Icons.apps_rounded),
          label: "Category",
        ),
        SizedBox(width: 25),
        CategoryModel(
            icon: Icon(
              Icons.flight_outlined,
            ),
            label: "Flight"),
        SizedBox(width: 25),
        CategoryModel(icon: Icon(Icons.money_outlined), label: "Bill"),
        SizedBox(width: 25),
        CategoryModel(
            icon: Icon(Icons.network_check_sharp), label: "Data Plane"),
        SizedBox(width: 25),
        CategoryModel(
            icon: Icon(Icons.add_to_photos_outlined), label: "Top UP"),
      ],
    );
  }
}

class CategoryModel extends StatelessWidget {
  const CategoryModel({Key? key, required this.icon, required this.label})
      : super(key: key);
  final Widget icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
            child: icon),
        const SizedBox(
          height: 8,
        ),
        Text(
          label,
          style: const TextStyle(color: Colors.grey, fontSize: 12.5),
        )
      ],
    );
  }
}
