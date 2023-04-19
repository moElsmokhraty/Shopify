import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/features/home/presentation/views/home_view/widgets/custom_nav_bar.dart';
import 'package:store_app/features/home/presentation/view_models/home_cubit/home_cubit.dart';
import 'package:store_app/features/home/presentation/view_models/home_cubit/home_state.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<HomeCubit>(context);
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: cubit.screens[cubit.navBarIndex],
          ),
          bottomNavigationBar: CustomNavBar(cubit: cubit),
        );
      },
    );
  }
}
