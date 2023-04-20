import 'package:flutter/material.dart';
import 'package:store_app/constants.dart';
import 'package:store_app/core/utils/styles.dart';

class CustomCheckButton extends StatelessWidget {
  const CustomCheckButton({Key? key, required this.onTap}) : super(key: key);
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 60,
        width: 180,
        decoration: const BoxDecoration(
          color: kMainColor,
          borderRadius: BorderRadius.all(
            Radius.circular(50),
          ),
        ),
        child: Center(
          child: Text(
            "Checkout",
            style: Styles.textStyle18.copyWith(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
