import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/constants.dart';
import 'package:store_app/core/utils/app_router.dart';
import 'package:store_app/core/utils/service_locator.dart';
import 'package:store_app/features/auth/presentation/view_models/cubits/login_cubit/login_cubit.dart';
import 'package:store_app/features/cart/presentation/view_models/cart_cubit/cart_cubit.dart';
import 'package:store_app/features/favourites/presentation/view_models/favourites_cubit/favourites_cubit.dart';
import 'package:store_app/features/home/data/repos/home_repo/home_repo_impl.dart';
import 'package:store_app/features/home/presentation/views/home_view/home_view.dart';
import 'package:store_app/features/home/presentation/views/home_view/widgets/cart_button.dart';
import 'package:store_app/features/home/presentation/views/home_view/widgets/home_app_bar.dart';
import 'package:store_app/features/home/presentation/view_models/search_cubit/search_cubit.dart';
import 'bloc_observer.dart';
import 'core/utils/cache_helper.dart';
import 'features/auth/data/repos/login_repo/login_repo_impl.dart';
import 'features/auth/presentation/views/login_view/login_view.dart';
import 'features/cart/data/repos/cart_repo/cart_repo_impl.dart';
import 'features/favourites/data/repos/favourite_repo/favourites_repo_impl.dart';
import 'features/favourites/presentation/views/favourite_view/favourite_view.dart';
import 'features/home/presentation/view_models/home_cubit/home_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupServiceLocator();
  Bloc.observer = MyBlocObserver();
  await CacheHelper.init();
  token = await CacheHelper.getData(key: kToken);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SearchCubit(),
          child: const HomeAppBar(),
        ),
        BlocProvider(
          create: (context) => LoginCubit(
            getIt.get<LoginRepoImpl>(),
          ),
          child: const LoginView(),
        ),
        BlocProvider(
          create: (context) => CartCubit(
            getIt.get<CartRepoImpl>(),
          )..getCart(),
          child: const CartButton(),
        ),
        BlocProvider(
          create: (context) => FavouritesCubit(
            getIt.get<FavouritesRepoImpl>(),
          )..getFavourites(),
          child: const FavouritesView(),
        ),
        BlocProvider(
          create: (context) => HomeCubit(
            getIt.get<HomeRepoImpl>(),
          )..getHomeData(),
          child: const HomeView(),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
