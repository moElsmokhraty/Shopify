import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/constants.dart';
import 'package:store_app/core/utils/app_router.dart';
import 'package:store_app/core/utils/service_locator.dart';
import 'package:store_app/features/home/presentation/views/home_view/widgets/custom_app_bar.dart';
import 'package:store_app/features/home/presentation/view_models/search_cubit/search_cubit.dart';
import 'bloc_observer.dart';
import 'core/utils/cache_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupServiceLocator();
  Bloc.observer = MyBlocObserver();
  await CacheHelper.init();
  token = CacheHelper.getData(key: kToken);
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
          child: const CustomAppBar(),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
