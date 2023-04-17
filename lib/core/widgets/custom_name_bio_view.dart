import 'package:flutter/material.dart';
import 'package:store_app/core/utils/styles.dart';

class NameAndBio extends StatelessWidget {
  const NameAndBio(
      {Key? key,
      this.crossAxisAlignment = CrossAxisAlignment.start,
      this.space = 5})
      : super(key: key);
  final CrossAxisAlignment crossAxisAlignment;
  final double space;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: crossAxisAlignment,
      children: [
        Text(
          "Mina Zarif",
          style: Styles.textStyle24.copyWith(fontSize: 20),
        ),
        SizedBox(
          height: space,
        ),
        Text(
          "Flutter Developer",
          style: TextStyle(color: Colors.grey[600]),
        )
      ],
    );
  }
}
