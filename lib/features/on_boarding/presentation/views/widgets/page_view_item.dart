import 'package:flutter/material.dart';
import 'package:store_app/features/on_boarding/data/models/on_boarding_model.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem({Key? key, required this.model}) : super(key: key);

  final OnBoardingModel model;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(child: Image.asset(model.imagePath)),
        const SizedBox(
          height: 30,
        ),
        Text(
          model.screenTitle,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          model.screenBody,
          style: const TextStyle(fontSize: 14),
        ),
        const SizedBox(
          height: 30,
        )
      ],
    );
  }
}
