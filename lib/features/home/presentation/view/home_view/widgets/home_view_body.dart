import 'package:flutter/material.dart';
import 'package:store_app/features/home/presentation/view/home_view/widgets/custom_app_bar.dart';
import 'package:store_app/features/home/presentation/view/home_view/widgets/custom_banners.dart';
import 'package:store_app/features/home/presentation/view/home_view/widgets/custom_list_view.dart';

class HomeBodyView extends StatelessWidget {
  const HomeBodyView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        SizedBox(
          height: 12,
        ),
        CustomAppBar(),
        SizedBox(
          height: 5,
        ),
        Expanded(child: CustomListView()),
      ],
    );
  }
}
