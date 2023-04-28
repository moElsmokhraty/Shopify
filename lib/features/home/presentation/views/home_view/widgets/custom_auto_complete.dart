import 'dart:math';

import 'package:flutter/material.dart';
import 'package:store_app/features/home/presentation/views/home_view/widgets/search_text_field.dart';

class AutocompleteExample extends StatelessWidget {
  AutocompleteExample({super.key});

  final TextEditingController _textEditingController = TextEditingController();
  final List<String> _suggestions = [
    'Apple',
    'Banana',
    'Cherry',
    'Duran',
    'Elderberry',
    'Fig',
  ];

  @override
  Widget build(BuildContext context) {
    return Autocomplete<String>(
      optionsViewBuilder: (context, onSelected, options) {
        return OptionView(
          options: options,
          context: context,
          onSelected: onSelected,
        );
      },
      optionsBuilder: (TextEditingValue textEditingValue) {
        if (textEditingValue.text.isEmpty) {
          return const Iterable<String>.empty();
        }
        return _suggestions;
      },
      onSelected: (String selection) {
        _textEditingController.text = selection;
        /// TODO: Navigate to details
      },
      fieldViewBuilder: (BuildContext context,
          TextEditingController textEditingController,
          FocusNode focusNode,
          VoidCallback onFieldSubmitted) {
        return SizedBox(
          height: 50,
          width: MediaQuery.of(context).size.width * 0.6,
          child: SearchTextField(
            controller: textEditingController,
            focusNode: focusNode,
          ),
        );
      },
    );
  }
}

class OptionView extends StatelessWidget {
  const OptionView(
      {Key? key,
      required this.context,
      required this.onSelected,
      required this.options})
      : super(key: key);
  final BuildContext context;
  final Function(String value) onSelected;
  final Iterable<String> options;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsetsDirectional.only(
        end: 50,
        bottom: max(MediaQuery.of(context).size.height - 80 * options.length,
            MediaQuery.of(context).size.height - 80 * 5),
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Material(
        elevation: 4.0,
        child: ListView.separated(
          padding: const EdgeInsetsDirectional.only(top: 8, end: 8),
          physics: const BouncingScrollPhysics(),
          itemCount: options.length,
          separatorBuilder: (context, index) => Divider(
            color: Colors.grey[500],
          ),
          itemBuilder: (BuildContext context, int index) {
            final option = options.elementAt(index);
            return SizedBox(
              height: 70,
              child: ListTile(
                onTap: () => onSelected(option),
                leading: Image.network(
                    'https://student.valuxapps.com/storage/uploads/products/1615440322npwmU.71DVgBTdyLL._SL1500_.jpg'),
                title: Text(option, textAlign: TextAlign.end),
              ),
            );
          },
        ),
      ),
    );
  }
}
