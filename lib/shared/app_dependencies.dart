import 'package:firebase_auth/firebase_auth.dart';
import 'package:services_project/features/currency/list_currency/controller/currency_store.dart';
import 'package:services_project/features/currency/list_currency/models/currency_model.dart';
import 'package:services_project/features/currency/list_currency/services/get_currency.dart';
import 'package:services_project/features/kebab_menu/controller/currency_list_store.dart';
import 'package:services_project/main.dart';
import 'package:services_project/shared/client/services_project_impl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppDependencies {
  void setup() {
    //Shared Preference
    getIt.registerSingletonAsync<SharedPreferences>(
        () async => await SharedPreferences.getInstance());

    //Firebase
    getIt.registerSingleton<FirebaseAuth>(FirebaseAuth.instance);

    //CurrencyStore
    getIt.registerSingleton<CurrencyStore>(CurrencyStore());

    getIt.registerSingleton<CurrencyListStore>(CurrencyListStore());

    //CurrencyModel
    getIt.registerSingleton<CurrencyModel>(CurrencyModel());

    //service getApi
    getIt.registerSingleton<ServicesProjectsImpl>(ServicesProjectsImpl());

    //get das infos da model
    getIt.registerSingleton<GetCurrency>(GetCurrency());
  }
}
