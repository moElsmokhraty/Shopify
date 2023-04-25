import 'package:flutter/material.dart';
import 'package:store_app/core/utils/styles.dart';

class TotalView extends StatelessWidget {
  const TotalView({Key? key, required this.totalPrice}) : super(key: key);
  final String totalPrice;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      height: 75,
      decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadiusDirectional.circular(25)),
      child: Row(
        children: [
          Text(
            "TOTAL : ",
            style: Styles.textStyle18
                .copyWith(color: Colors.grey[600], fontSize: 17),
          ),
          const Spacer(),
          Text(
            totalPrice,
            style: Styles.textStyle20
                .copyWith(color: Colors.grey[700], fontSize: 21),
          ),
        ],
      ),
    );
  }
}
