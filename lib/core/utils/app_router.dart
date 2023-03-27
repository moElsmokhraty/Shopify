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
import 'package:store_app/features/on_boarding/presentation/view_model/on_boarding_cubit/on_boarding_cubit.dart';
import 'package:store_app/features/on_boarding/presentation/views/on_boarding_view.dart';

abstract class AppRouter {
  static final router = GoRouter(routes: [
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
  ]);
}
