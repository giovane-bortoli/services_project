import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:services_project/shared/Widgets/snack_bar.dart';

class HandleError {
  static Future getErrorMessageView(e, BuildContext context) async {
    log('Exception: $e');
    try {
      throw e;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return CustomSnackBar.errorSnackBar(context,
            message: 'Usuário não encontrado!');
      } else if (e.code == 'wrong-password') {
        return CustomSnackBar.errorSnackBar(context,
            message: 'Senha incorreta!');
      } else if (e.code == 'invalid-email') {
        return CustomSnackBar.errorSnackBar(context,
            message: 'E-mail inválido!');
      } else {
        return CustomSnackBar.errorSnackBar(context,
            message: 'Ocorreu um erro, tente novamente');
      }
    }
  }
}
