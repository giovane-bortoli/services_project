import 'package:firebase_auth/firebase_auth.dart';
import 'package:services_project/shared/Widgets/snack_bar.dart';

class AuthenticationException implements Exception {}

class InvalidEmailException extends AuthenticationException {}

class PasswordExceptions extends AuthenticationException {}

class UserNotFoundException extends AuthenticationException {}

class UncknownAuthException extends AuthenticationException {}
