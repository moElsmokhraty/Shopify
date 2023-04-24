import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:store_app/core/utils/app_router.dart';
import 'package:store_app/features/home/data/models/home_data_model/home_data_response.dart';
import 'package:store_app/features/home/presentation/views/home_view/widgets/best_seller_item.dart';

class BestSellerGridView extends StatelessWidget {
  const BestSellerGridView({
    Key? key,
    this.response,
  }) : super(key: key);

  final HomeDataResponse? response;

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
      itemCount: response == null ? 4 : response!.homeData!.products!.length,
      itemBuilder: (context, index) {
        if(response == null) {
          return const ShimmerItem();
        }
        return BestSellerItem(
        product: response!.homeData!.products![index],
        pushRoute: () {
          if(response != null) {
            AppRouter.router.push(AppRouter.kDetailsView,
              extra: response!.homeData!.products![index].id);
          }
        },
      );
      },
    );
  }
}
class ShimmerItem extends StatelessWidget {
  const ShimmerItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: SizedBox(
        height: 220,
        width: 170,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Container(
                height: 120,
                width: 80,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 8.0),
              child: Container(
                height: 16,
                width: 200,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            /*Row(
              children: [
                const SizedBox(
                  width: 8,
                ),
                Container(
                  height: 16,
                  width: 70,
                  color: Colors.white,
                ),
                const Spacer(),
                Container(
                  height: 32,
                  width: 32,
                  color: Colors.white,
                ),
                const SizedBox(
                  width: 8,
                ),
              ],
            ),*/
            const SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }
}
