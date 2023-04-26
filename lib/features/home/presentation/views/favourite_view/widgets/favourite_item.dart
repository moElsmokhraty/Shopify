import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:store_app/constants.dart';
import 'package:store_app/core/utils/styles.dart';
import 'package:store_app/features/home/data/models/favourite_models/favourite_response/favourite_model.dart';

class FavouriteItem extends StatelessWidget {
  const FavouriteItem({Key? key, required this.favouriteModel}) : super(key: key);

  final FavouriteModel favouriteModel ;
  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: const ValueKey(0),
      startActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: (context) {},
            backgroundColor: const Color(0xFFFE4A49),
            foregroundColor: Colors.white,
            autoClose: true,
            borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(20),
                topRight: Radius.circular(20)),
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
            Image.network(
              testImg,
              width: 100,
              height: 100,
            ),
            const SizedBox(
              width: 15,
            ),
            const Text(
              "Iphone",
              style: Styles.textStyle20,
            ),
            const Spacer(),
            const Text(
              '12500 LE',
              style: TextStyle(color: kMainColor, fontWeight: FontWeight.bold),
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
