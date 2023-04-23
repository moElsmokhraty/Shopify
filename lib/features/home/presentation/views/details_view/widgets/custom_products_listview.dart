import 'package:flutter/material.dart';

class ProductsListView extends StatelessWidget {
  const ProductsListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => const SizedBox(
          height: 300,
          width: 180,
          child: Text(""),
          /*BestSellerItem(
              pushRout: () {
                AppRouter.router.pushReplacement(AppRouter.kDetailsView);
              },
            ),*/
        ),
        separatorBuilder: (context, index) => const SizedBox(
          width: 15,
        ),
        itemCount: 15,
      ),
    );
  }
}
