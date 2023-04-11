import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:store_app/features/home/presentation/view/home_view/widgets/best_sale_product.dart';
import 'package:store_app/features/home/presentation/view/home_view/widgets/category_model_view.dart';
import 'package:store_app/features/home/presentation/view/home_view/widgets/custom_banners.dart';

class CustomListView extends StatelessWidget {
  const CustomListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomBanners(),
              const SizedBox(
                height: 25,
              ),
              Container(
                height: 90,
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: const CustomCategoriesView(),
              ),
              Container(
                color: Colors.grey[100],
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Padding(
                      padding: EdgeInsetsDirectional.only(
                          start: 25, bottom: 15, top: 25),
                      child: Text(
                        'Best Sale Product',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    BestSaleProduct(),
                  ],
                ),
              ),
              // const BestSaleProduct(),
            ],
          ),
        ),
      ],
    );
  }
}
