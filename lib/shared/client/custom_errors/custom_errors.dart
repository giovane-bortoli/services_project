// class CustomException implements Exception {
//   final dynamic _message;
//   final dynamic _prefix;

//   CustomException([this._message, this._prefix]);

//   String toString() {
//     return "$_prefix$_message";
//   }
// }

// class GenericException extends CustomException {
//   GenericException([String? message]) : super(message, "Erro generico");
// }

// class RegisteredEmailException extends CustomException {
//   RegisteredEmailException([String? message])
//       : super(message, "Este email já foi cadastrado");
// }

// class ConnectivityException extends CustomException {
//   ConnectivityException([String? message])
//       : super(message, "Sem conexão com a internet");
// }

import 'package:firebase_auth/firebase_auth.dart';
import 'package:services_project/shared/Widgets/snack_bar.dart';

class AuthenticationException implements Exception {}

class InvalidEmailException extends AuthenticationException {}

class PasswordExceptions extends AuthenticationException {}

class UserNotFoundException extends AuthenticationException {}

class UncknownAuthException extends AuthenticationException {}
