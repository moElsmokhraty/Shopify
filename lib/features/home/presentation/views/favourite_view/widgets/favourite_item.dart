import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:store_app/constants.dart';
import 'package:store_app/core/utils/styles.dart';
import 'package:store_app/core/widgets/loading_screen.dart';
import 'package:store_app/features/home/data/models/favourite_models/get_favourite_models/get_favourite_model.dart';
import 'package:store_app/features/home/presentation/view_models/favourite_cubit/favourite_cubit.dart';
import 'package:store_app/features/home/presentation/view_models/home_cubit/home_cubit.dart';

class FavouriteItem extends StatelessWidget {
  const FavouriteItem({Key? key, required this.favouriteModel})
      : super(key: key);

  final GetFavouriteModel favouriteModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Slidable(
        closeOnScroll: false,
        key: const ValueKey(0),
        startActionPane: ActionPane(
          motion: const ScrollMotion(),
          children: [
            SlidableAction(
              onPressed: (context) async {
                showDialog(
                  context: context,
                  builder: (context) => const Loading(),
                );
                await BlocProvider.of<FavouriteCubit>(context)
                    .addOrRemoveFavourite(favouriteModel.product!.id!)
                   ;
                await BlocProvider.of<FavouriteCubit>(context).getFavourites();
                await BlocProvider.of<HomeCubit>(context).getHomeData();
              },
              backgroundColor: const Color(0xFFFE4A49),
              foregroundColor: Colors.white,
              autoClose: true,
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              icon: Icons.delete,
              label: 'Delete',
            ),
          ],
        ),
        child: InkWell(
          onTap: () {},
          splashColor: Colors.transparent,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CachedNetworkImage(
                imageUrl: favouriteModel.product!.image!,
                width: 80,
                height: 80,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.41,
                child: Text(
                  favouriteModel.product!.name!,
                  style: Styles.textStyle20,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
              // const Spacer(),
              Text(
                '${favouriteModel.product!.price!} LE',
                style: const TextStyle(
                  color: kMainColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              InkWell(
                onTap: () {},
                child: Icon(
                  Icons.add_shopping_cart,
                  size: 22.5,
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
