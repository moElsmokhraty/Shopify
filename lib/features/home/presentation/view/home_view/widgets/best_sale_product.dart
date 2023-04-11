import 'package:flutter/material.dart';
import 'package:store_app/core/utils/app_router.dart';
import 'package:store_app/features/home/presentation/view/home_view/widgets/product_model.dart';

class BestSaleProduct extends StatelessWidget {
  const BestSaleProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      primary: true,
      padding: const EdgeInsets.symmetric(horizontal: 25),
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 6 / 10.4,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8),
      itemCount: 6,
      itemBuilder: (context, index) => ProductModel(
        pushRout: () {
          AppRouter.router.push(AppRouter.kDetailsView);
        },
      ),
    );
  }
}
