import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/features/home/presentation/view_models/favourite_cubit/favourite_cubit.dart';
import 'package:store_app/features/home/presentation/views/favourite_view/widgets/favourite_item.dart';

class FavouriteList extends StatelessWidget {
  const FavouriteList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavouriteCubit, FavouriteState>(
      builder:(context, state) =>  ListView.separated(
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) => const FavouriteItem(),
        separatorBuilder: (context, index) => const Divider(),
        itemCount: 5,
      ),
    );
  }
}
