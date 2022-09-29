import 'package:firebase_auth/firebase_auth.dart';
import 'package:services_project/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppDependencies {
  void setup() {
    //Shared Preference
    getIt.registerSingletonAsync<SharedPreferences>(
        () async => await SharedPreferences.getInstance());

    //Firebase
    getIt.registerSingleton<FirebaseAuth>(FirebaseAuth.instance);
  }
}
