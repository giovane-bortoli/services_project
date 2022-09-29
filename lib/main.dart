import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:services_project/services_project_app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:services_project/shared/app_dependencies.dart';

GetIt getIt = GetIt.instance;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLibraries();
  runApp(const ServiceProjectApp());
}

Future<void> setupLibraries() async {
  //firebase service
  await Firebase.initializeApp();

  //Dependências
  AppDependencies().setup();

  //variavéis de ambiente
  // await dotenv.load(fileName: ".env");
}
