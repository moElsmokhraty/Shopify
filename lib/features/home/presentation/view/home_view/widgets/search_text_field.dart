import 'package:flutter/material.dart';
import 'package:store_app/constants.dart';
import 'package:store_app/core/utils/app_assets.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: MediaQuery.of(context).size.width * 0.6,
      child: TextField(
        onTapOutside: (event) {
          FocusManager.instance.primaryFocus!.unfocus();
        },
        autofocus: false,
        cursorColor: kMainColor,
        style: const TextStyle(color: kMainColor),
        onSubmitted: (value) {},
        decoration: InputDecoration(
          border: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: kMainColor,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          hoverColor: kMainColor,
          hintText: "Search...",
          hintStyle: TextStyle(
            color: Colors.grey[500],
          ),
          prefixIcon: Image.asset(
            AppAssets.searchIcon,
            color: Colors.grey[400],
          ),
        ),
      ),
    );
  }
}
