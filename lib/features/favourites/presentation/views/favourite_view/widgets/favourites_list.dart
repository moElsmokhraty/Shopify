import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/core/widgets/custom_shimmer_list_view.dart';
import 'package:store_app/features/favourites/presentation/view_models/favourites_cubit/favourites_cubit.dart';
import 'favourite_item.dart';

class FavouritesList extends StatelessWidget {
  const FavouritesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavouritesCubit, FavouritesState>(
      builder: (context, state) {
        if (state is GetFavouritesSuccess) {
          if (state.response.data!.data!.isEmpty) {
            return const Center(
              child: Text(
                'Favourites List Is Empty!!!',
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.grey,
                  fontWeight: FontWeight.normal,
                ),
              ),
            );
          }
          return ListView.separated(
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) => FavouriteItem(
              favouriteModel: state.response.data!.data![index],
            ),
            separatorBuilder: (context, index) => const Divider(),
            itemCount: state.response.data!.data!.length,
          );
        } else if (state is GetFavouritesFailure) {
          return Center(
            child: Text(
              state.errMessage,
            ),
          );
        } else {
          return const Padding(
            padding: EdgeInsets.all(20.0),
            child: CustomShimmerList(itemCount: 7),
          );
        }
      },
    );
  }
}
