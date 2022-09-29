import 'package:flutter/widgets.dart';
import 'package:services_project/features/auth/views/login_view.dart';
import 'package:services_project/features/splash/splash_screen.dart';
import 'package:services_project/views/home.dart';

class AppRoutes {
  static Map<String, WidgetBuilder> routes(context) {
    return {
      '/splash': (context) => const SplashScreen(),
      '/login': (context) => LoginView(),
      '/home': (context) => const MyHomePage(),
    };
  }
}
