import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app/constants.dart';
import 'package:store_app/core/utils/service_locator.dart';
import 'package:store_app/features/auth/data/repos/login_repo/login_repo_impl.dart';
import 'package:store_app/features/auth/data/repos/register_repo/register_repo_impl.dart';
import 'package:store_app/features/auth/presentation/view_models/cubits/login_cubit/login_cubit.dart';
import 'package:store_app/features/auth/presentation/view_models/cubits/register_cubit/register_cubit.dart';
import 'package:store_app/features/auth/presentation/views/login_view/login_view.dart';
import 'package:store_app/features/auth/presentation/views/register_view/register_view.dart';
import 'package:store_app/features/home/presentation/view/details_view/details_view.dart';
import 'package:store_app/features/home/presentation/view/edit_profile_view/edit_profile_view.dart';
import 'package:store_app/features/home/presentation/view/home_view/home_view.dart';
import 'package:store_app/features/home/presentation/view_models/details_cubit/details_cubit.dart';
import 'package:store_app/features/home/presentation/view_models/home_cubit/home_cubit.dart';
import 'package:store_app/features/on_boarding/presentation/view_model/on_boarding_cubit/on_boarding_cubit.dart';
import 'package:store_app/features/on_boarding/presentation/views/on_boarding_view.dart';

import '../../features/home/data/repos/home_repo/home_repo_impl.dart';

abstract class AppRouter {
  static const kOnBoardingView = '/onboarding';
  static String kLoginView = isLoggedIn == true ? '/login' : '/';
  static String kHomeView = isLoggedIn == true ? '/' : '/home';
  static const kDetailsView = '/details';
  static const kRegisterView = '/reg';
  static const kEditProfileView = '/edit';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: kOnBoardingView,
        builder: (context, state) => BlocProvider(
          create: (context) => OnBoardingCubit(),
          child: const OnBoardingView(),
        ),
      ),
      GoRoute(
        path: kLoginView,
        builder: (context, state) => BlocProvider(
          create: (context) => LoginCubit(getIt.get<LoginRepoImpl>()),
          child: const LoginView(),
        ),
      ),
      GoRoute(
        path: kRegisterView,
        builder: (context, state) => BlocProvider(
          create: (context) => RegisterCubit(getIt.get<RegisterRepoImpl>()),
          child: const RegisterView(),
        ),
      ),
      GoRoute(
        path: kHomeView,
        builder: (context, state) => BlocProvider(
          create: (context) =>
              HomeCubit(getIt.get<HomeRepoImpl>())..getHomeData(),
          child: const HomeView(),
        ),
      ),
      GoRoute(
        path: kDetailsView,
        builder: (context, state) => BlocProvider(
          create: (context) => DetailsCubit(),
          child: const DetailsView(),
        ),
      ),
      GoRoute(
        path: kEditProfileView,
        builder: (context, state) => const EditProfileView(),
      ),
    ],
  );
}
