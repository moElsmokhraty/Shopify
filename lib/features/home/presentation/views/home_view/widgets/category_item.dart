import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({Key? key, required this.icon, required this.label})
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
