import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/bloc_observer.dart';
import 'package:store_app/core/utils/app_router.dart';
import 'package:store_app/core/utils/service_locator.dart';
import 'package:store_app/features/home/presentation/view/home_view/widgets/custom_app_bar.dart';
import 'package:store_app/features/home/presentation/view_models/details_cubit/details_cubit.dart';
import 'package:store_app/features/home/presentation/view_models/search_cubit/search_cubit.dart';
import 'package:store_app/features/on_boarding/presentation/view_model/on_boarding_cubit/on_boarding_cubit.dart';
import 'package:store_app/features/on_boarding/presentation/views/on_boarding_view.dart';
import 'features/auth/data/repos/login_repo/login_repo_impl.dart';
import 'features/auth/data/repos/register_repo/register_repo_impl.dart';
import 'features/auth/presentation/view_models/cubits/login_cubit/login_cubit.dart';
import 'features/auth/presentation/view_models/cubits/register_cubit/register_cubit.dart';
import 'features/auth/presentation/views/login_view/login_view.dart';
import 'features/auth/presentation/views/register_view/register_view.dart';
import 'features/home/presentation/view/home_view/home_view.dart';
import 'features/home/presentation/view_models/home_cubits/home_cubit.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupServiceLocator();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.dark,
      statusBarColor: Colors.transparent,
    ),
  );
  // Bloc.observer = MyBlocObserver();
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
          create: (context) => OnBoardingCubit(),
          child: const OnBoardingView(),
        ),
        BlocProvider(
          create: (context) => LoginCubit(getIt.get<LoginRepoImpl>()),
          child: const LoginView(),
        ),
        BlocProvider(
          create: (context) => RegisterCubit(getIt.get<RegisterRepoImpl>()),
          child: const RegisterView(),
        ),
        BlocProvider(
          create: (context) => HomeCubit(),
          child: const HomeView(),
        ),
        BlocProvider(
          create: (context) => SearchCubit(),
          child: const CustomAppBar(),
        ),
        BlocProvider(create: (context) => DetailsCubit(),),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            /* appBarTheme: const AppBarTheme(
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
              statusBarBrightness: Brightness.dark,
            ),
          ),*/
            ),
      ),
    );
  }
}
