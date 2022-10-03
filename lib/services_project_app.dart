import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:services_project/features/auth/controller/user_information_store.dart';
import 'package:services_project/features/currency/list_currency/controller/currency_store.dart';
import 'package:services_project/shared/client/services_project_impl.dart';
import 'package:services_project/shared/routes/app_routes.dart';
import 'package:services_project/shared/theme/theme_data.dart';

class ServiceProjectApp extends StatelessWidget {
  const ServiceProjectApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: AppThemeData.materialTheme(context),
        debugShowCheckedModeBanner: false,
        routes: AppRoutes.routes(context),
        initialRoute: '/splash',
      ),
    );
  }

  static List<SingleChildWidget> providers = [
    Provider<UserInformationStore>(create: (_) => UserInformationStore()),
    Provider<CurrencyStore>(create: (_) => CurrencyStore()),
    Provider<ServicesProjectsImpl>(create: (_) => ServicesProjectsImpl()),
  ];
}
