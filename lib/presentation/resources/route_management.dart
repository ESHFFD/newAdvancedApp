import 'package:adv_app/presentation/forget_pasword/forget_password.dart';
import 'package:adv_app/presentation/login/login.dart';
import 'package:adv_app/presentation/main/main.dart';
import 'package:adv_app/presentation/onBoarding/onboarding.dart';
import 'package:adv_app/presentation/register/register.dart';
import 'package:adv_app/presentation/resources/string_management.dart';
import 'package:adv_app/presentation/splash/spash.dart';
import 'package:adv_app/presentation/store_detail/store_detail.dart';
import 'package:flutter/material.dart';

class Routes {
  static const String splashRoute = '/';
  static const String onBoardingRoute = '/onBoarding';
  static const String loginRoute = '/login';
  static const String registerRoute = '/register';
  static const String forgetPasswordRoute = '/forgetPassword';
  static const String mainRoute = '/main';
  static const String storeDetailRoute = '/storeDetail';
}

class RouteGenerator {
  static Route getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => SplashView());
      case Routes.loginRoute:
        return MaterialPageRoute(builder: (_) => LoginView());
      case Routes.onBoardingRoute:
        return MaterialPageRoute(builder: (_) => OnBoardingView());
      case Routes.registerRoute:
        return MaterialPageRoute(builder: (_) => RegisterView());
      case Routes.mainRoute:
        return MaterialPageRoute(builder: (_) => MainView());
      case Routes.forgetPasswordRoute:
        return MaterialPageRoute(builder: (_) => ForgetPasswordView());
      case Routes.storeDetailRoute:
        return MaterialPageRoute(builder: (_) => StoreDetailView());

      default:
        return undefindeRoute();
    }
  }

  static Route undefindeRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(title: const Text(AppString.unfounded)),
              body: const Center(child: Text(AppString.unfounded)),
            ));
  }
}
