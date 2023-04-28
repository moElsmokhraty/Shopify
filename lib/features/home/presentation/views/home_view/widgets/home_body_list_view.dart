import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/features/home/presentation/views/home_view/widgets/best_seller_grid_view.dart';
import 'package:store_app/features/home/presentation/views/home_view/widgets/home_banners.dart';
import 'package:store_app/features/home/presentation/view_models/home_cubit/home_cubit.dart';
import 'package:store_app/features/home/presentation/view_models/home_cubit/home_state.dart';

class HomeBodyListView extends StatelessWidget {
  const HomeBodyListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HomeBanners(),
              /*const Padding(
                padding: EdgeInsets.symmetric(vertical: 25, horizontal: 20),
                child: SizedBox(height: 70, child: CategoriesListView()),
              ),*/
              Container(
                color: Colors.grey[100],
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsetsDirectional.only(
                        start: 25,
                        bottom: 15,
                        top: 25,
                      ),
                      child: Text(
                        'Best Seller Products',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    BlocBuilder<HomeCubit, HomeState>(
                      builder: (context, state) {
                        var cubit = BlocProvider.of<HomeCubit>(context);
                        // .homeDataResponse;
                        if (state is HomeGetDataFailure) {
                          return const Center(
                            child: Icon(
                              Icons.error_outlined,
                              size: 30.0,
                            ),
                          );
                        } else if (state is HomeGetDataSuccess ||
                            state is ChangeNavBarIndex ||
                            state is HomeGetDataLoading) {
                          return BestSellerGridView(
                              response: cubit.homeDataResponse);
                        } else {
                          return const BestSellerGridView();
                        }
                      },
                    ),
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
