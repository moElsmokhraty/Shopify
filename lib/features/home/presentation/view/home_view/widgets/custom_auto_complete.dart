import 'package:flutter/material.dart';
import 'package:store_app/features/home/presentation/view/home_view/widgets/search_text_field.dart';

class AutocompleteExample extends StatelessWidget {
  AutocompleteExample({super.key});

  final TextEditingController _textEditingController = TextEditingController();
  final List<String> _suggestions = [
    'Apple',
    'Banana',
    'Cherry',
    'Durian',
    'Elderberry',
    'Fig',
  ];

  @override
  Widget build(BuildContext context) {
    return Autocomplete<String>(
      optionsViewBuilder: (context, onSelected, options) {
        return Container(
          margin: EdgeInsetsDirectional.only(
              end: 50,
              bottom: MediaQuery.of(context).size.height - 80 * options.length),
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
              padding: const EdgeInsetsDirectional.only(top: 8,end: 8),
              physics: const BouncingScrollPhysics(),
              itemCount: options.length,
              separatorBuilder: (context, index) => const Divider(),
              itemBuilder: (BuildContext context, int index) {
                final option = options.elementAt(index);
                return SizedBox(
                  height: 70,
                  child: ListTile(
                    onTap: () => onSelected(option),
                    leading: Image.network(
                        'https://student.valuxapps.com/storage/uploads/products/1615440322npwmU.71DVgBTdyLL._SL1500_.jpg'),
                    title: Text(option,textAlign: TextAlign.end),
                  ),
                );
              },
            ),
          ),
        );
      },
      optionsBuilder: (TextEditingValue textEditingValue) {
        if (textEditingValue.text.isEmpty) {
          return const Iterable<String>.empty();
        }
        return _suggestions.where((String suggestion) => suggestion
            .toLowerCase()
            .contains(textEditingValue.text.toLowerCase()));
      },
      onSelected: (String selection) {
        _textEditingController.text = selection;
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
  const OptionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
