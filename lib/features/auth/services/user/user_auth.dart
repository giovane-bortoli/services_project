import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:services_project/main.dart';
import 'package:services_project/shared/client/custom_errors/handle_error.dart';

class UserAuth {
  final auth = getIt<FirebaseAuth>();

  Future<void> signIn(String email, String password) async {
    try {
      final result = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      inspect(result);
    } on FirebaseAuthException {
      throw FirebaseAuthException;
    } on Exception catch (e) {
      log(e.toString());
    }
  }

  Future<void> signOut() async {
    auth.signOut();
  }
}
