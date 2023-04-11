import 'package:flutter/material.dart';
import 'package:store_app/features/home/presentation/view/details_view/widgets/details_view_body.dart';

class DetailsView extends StatelessWidget {
  const DetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: DetailsViewBody(),
      ),
    );
  }
}
