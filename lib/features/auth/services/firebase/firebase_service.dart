// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:services_project/main.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class FirebaseService {
//   final prefs = getIt<SharedPreferences>();
//   final auth = getIt<FirebaseAuth>();

//   Future<void> signOut() async {
//     try {
//       await auth.signOut().catchError((e) => throw e);
//     } on Exception catch (e) {
//       throw e;
//     }
//   }
// }
