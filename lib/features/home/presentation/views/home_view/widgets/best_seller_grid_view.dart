import 'package:flutter/material.dart';
import 'package:store_app/core/utils/app_router.dart';
import 'package:store_app/features/home/data/models/home_data_model/home_data_response.dart';
import 'package:store_app/features/home/presentation/views/home_view/widgets/best_seller_item.dart';

class BestSellerGridView extends StatelessWidget {
  const BestSellerGridView({
    Key? key,
    required this.response,
  }) : super(key: key);

  final HomeDataResponse response;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      primary: true,
      padding: const EdgeInsets.symmetric(horizontal: 25),
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 6 / 8.5,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
      itemCount: response.homeData!.products!.length,
      itemBuilder: (context, index) => BestSellerItem(
        product: response.homeData!.products![index],
        pushRoute: () {
          AppRouter.router.push(AppRouter.kDetailsView);
        },
      ),
    );
  }
}
