import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:store_app/constants.dart';
import 'package:store_app/core/utils/styles.dart';
import 'package:store_app/features/home/data/models/favourite_models/get_favourite_models/get_favourite_model.dart';
import 'package:store_app/features/home/presentation/view_models/favourite_cubit/favourite_cubit.dart';
import 'package:store_app/features/home/presentation/view_models/home_cubit/home_cubit.dart';

class FavouriteItem extends StatelessWidget {
  const FavouriteItem({Key? key, required this.favouriteModel})
      : super(key: key);

  final GetFavouriteModel favouriteModel;

  @override
  Widget build(BuildContext context) {
    return Slidable(
      closeOnScroll: false,
      key: const ValueKey(0),
      startActionPane: ActionPane(
        dismissible: DismissiblePane(
          onDismissed: () async {
            BlocProvider.of<FavouriteCubit>(context)
                .addOrRemoveFavourite(favouriteModel.product!.id!)
                .then((value) {
              BlocProvider.of<FavouriteCubit>(context).getFavourites();
              BlocProvider.of<HomeCubit>(context).getHomeData();
            });
          },
        ),
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: (context) {},
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
          children: [
            CachedNetworkImage(
              imageUrl: favouriteModel.product!.image!,
              width: 100,
              height: 100,
            ),
            const SizedBox(
              width: 15,
            ),
            Text(
              favouriteModel.product!.name!,
              style: Styles.textStyle20,
              overflow: TextOverflow.ellipsis,
            ),
            const Spacer(),
            Text(
              '${favouriteModel.product!.price!} LE',
              style: const TextStyle(
                  color: kMainColor, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              width: 25,
            ),
            InkWell(
              onTap: () {},
              child: Icon(
                Icons.add_shopping_cart,
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(
              width: 10,
            ),
          ],
        ),
      ),
    );
  }
}
