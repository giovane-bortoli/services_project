import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:services_project/main.dart';
import 'package:services_project/shared/client/custom_errors/handle_error.dart';

class UserAuth {
  final auth = getIt<FirebaseAuth>();

  Future<UserCredential> signIn({
    required String email,
    required String password,
  }) async {
    try {
      return await auth.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw e;
    }
  }

  Future<void> signOut() async {
    try {
      await auth.signOut();
    } on FirebaseAuthException catch (e) {
      throw e;
    }
  }
}
