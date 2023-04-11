import 'package:go_router/go_router.dart';
import 'package:store_app/constants.dart';
import 'package:store_app/features/auth/presentation/views/login_view/login_view.dart';
import 'package:store_app/features/auth/presentation/views/register_view/register_view.dart';
import 'package:store_app/features/home/presentation/view/details_view/details_view.dart';
import 'package:store_app/features/home/presentation/view/home_view/home_view.dart';
import 'package:store_app/features/on_boarding/presentation/views/on_boarding_view.dart';

abstract class AppRouter {
  static const kOnBoardingView = '/';
  static const kLoginView = '/log';
  static const kHomeView = '/home';
  static const kDetailsView = '/details';
  static const kRegisterView = '/reg';
  static final router = GoRouter(
    routes: [
      GoRoute(
          path: kOnBoardingView,
          builder: (context, state) => const OnBoardingView()),
      GoRoute(
        path: kLoginView,
        builder: (context, state) => const LoginView(),
      ),
      GoRoute(
        path: kRegisterView,
        builder: (context, state) => const RegisterView(),
      ),
      GoRoute(
        path: kHomeView,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: kDetailsView,
        builder: (context, state) => const DetailsView(),
      ),
    ],
  );
}
