import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:services_project/features/auth/controller/user_information_store.dart';
import 'package:services_project/shared/Widgets/snack_bar.dart';
import 'package:services_project/shared/client/custom_errors/custom_errors.dart';

class HandleError {
  static Future getErrorMessageView(e, BuildContext context) async {
    dynamic _timer;
    print("Exception: $e");
    try {
      throw e;
    } on FirebaseAuthException catch (e) {
      if (e.code == "network-request-failed") {
        return const SnackBar(
            content: Text('Sem conexão com a internet, tente novamente'));
      } else if (e.code == "user-not-found") {
        return const SnackBar(content: Text('Usuário não encontrado!'));
      } else if (e.code == "wrong-password") {
        const SnackBar(content: Text('Senha incorreta, tente novamente!'));
      } else if (e.code == "too-many-requests") {
        const SnackBar(content: Text('Muitas requisições, tente novamente!'));
      }
    } catch (_) {
      const SnackBar(content: Text('Ocorreu um erro, tente novamente'));
    }
  }
}

// import 'dart:developer';

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:services_project/shared/Widgets/snack_bar.dart';

// class HandleError {
//   static Future getErrorMessageView(e, BuildContext context) async {
//     log('Exception: $e');
//     try {
//       throw e;
//     } on FirebaseAuthException catch (e) {
//       if (e.code == 'user-not-found') {
//         return CustomSnackBar.errorSnackBar(context,
//             message: 'Usuário não encontrado!');
//       } else if (e.code == 'wrong-password') {
//         return CustomSnackBar.errorSnackBar(context,
//             message: 'Senha incorreta!');
//       } else if (e.code == 'invalid-email') {
//         return CustomSnackBar.errorSnackBar(context,
//             message: 'E-mail inválido!');
//       } else {
//         return CustomSnackBar.errorSnackBar(context,
//             message: 'Ocorreu um erro, tente novamente');
//       }
//     }
//   }
// }
