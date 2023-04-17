import 'package:flutter/material.dart';
import 'package:store_app/constants.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton(
      {Key? key, required this.onTap, required this.iconData})
      : super(key: key);
  final Function() onTap;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 30,
        height: 30,
        decoration: const BoxDecoration(
            color: kMainColor,
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            )),
        child: Icon(
          iconData,
          color: Colors.white,
          size: 18,
        ),
      ),
    );
  }
}
