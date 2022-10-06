import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:services_project/features/auth/controller/user_information_store.dart';
import 'package:services_project/shared/Widgets/snack_bar.dart';
import 'package:services_project/shared/client/custom_errors/custom_errors.dart';

class HandleError {
  static Future getErrorMessageView(e, BuildContext context) async {
    try {
      throw e;
    } on FirebaseAuthException catch (e) {
      if (e.code == "invalid-email") {
        return CustomSnackBar.errorSnackBar(context,
            message: 'E-mail incorreto!');
      } else if (e.code == "wrong-password") {
        return CustomSnackBar.errorSnackBar(context,
            message: 'E-mail ou senha está incorreto!');
      } else if (e.code == "user-not-found") {
        return CustomSnackBar.errorSnackBar(context,
            message: 'E-mail não encontrado!');
      } else {
        return CustomSnackBar.errorSnackBar(context,
            message: 'Ocorreu um erro, tente novamente!');
      }
    } catch (_) {}
  }
}
