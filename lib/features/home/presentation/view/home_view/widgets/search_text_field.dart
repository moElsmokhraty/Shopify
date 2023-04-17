import 'package:flutter/material.dart';
import 'package:store_app/constants.dart';
import 'package:store_app/core/utils/app_assets.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({Key? key}) : super(key: key);
  static const List<String> options = [
    'Apple',
    'Banana',
    'Cherry',
    'Durian',
    'Elderberry'
  ];

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

class AutocompleteExample extends StatelessWidget {
  const AutocompleteExample({super.key});

  static const List<String> options = [
    'Apple',
    'Banana',
    'Cherry',
    'Durian',
    'Elderberry'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Autocomplete<String>(
          optionsBuilder: (TextEditingValue textEditingValue) {
            return options.where((String option) {
              return option.contains(textEditingValue.text.toLowerCase());
            });
          },
          onSelected: (String selection) {
            print('You selected $selection');
          },
        ),
      ),
    );
  }
}
