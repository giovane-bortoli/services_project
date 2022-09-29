import 'package:firebase_auth/firebase_auth.dart';
import 'package:services_project/main.dart';

class UserAuth {
  final auth = getIt<FirebaseAuth>();

  Future<void> signIn(String? email, String? password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email!, password: password!);
    } on Exception catch (e) {
      throw e;
    }
  }
}
