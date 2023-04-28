import 'package:flutter/material.dart';
import 'package:store_app/features/home/presentation/views/details_view/widgets/custom_details_appbar.dart';
import 'package:store_app/features/home/presentation/views/details_view/widgets/product_item.dart';

class DetailsViewBody extends StatelessWidget {
  const DetailsViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Column(
        children: const [
          DetailsAppBar(),
          Expanded(
            child: ProductItem(),
          ),
        ],
      ),
    );
  }
}
