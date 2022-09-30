// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_information_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$UserInformationStore on _UserInformationStoreBase, Store {
  late final _$emailAtom =
      Atom(name: '_UserInformationStoreBase.email', context: context);

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  late final _$passwordAtom =
      Atom(name: '_UserInformationStoreBase.password', context: context);

  @override
  String get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  late final _$textEditingControllerAtom = Atom(
      name: '_UserInformationStoreBase.textEditingController',
      context: context);

  @override
  TextEditingController get textEditingController {
    _$textEditingControllerAtom.reportRead();
    return super.textEditingController;
  }

  @override
  set textEditingController(TextEditingController value) {
    _$textEditingControllerAtom.reportWrite(value, super.textEditingController,
        () {
      super.textEditingController = value;
    });
  }

  late final _$errorFirebaseAtom =
      Atom(name: '_UserInformationStoreBase.errorFirebase', context: context);

  @override
  bool get errorFirebase {
    _$errorFirebaseAtom.reportRead();
    return super.errorFirebase;
  }

  @override
  set errorFirebase(bool value) {
    _$errorFirebaseAtom.reportWrite(value, super.errorFirebase, () {
      super.errorFirebase = value;
    });
  }

  late final _$messageFirebaseErrorAtom = Atom(
      name: '_UserInformationStoreBase.messageFirebaseError', context: context);

  @override
  String get messageFirebaseError {
    _$messageFirebaseErrorAtom.reportRead();
    return super.messageFirebaseError;
  }

  @override
  set messageFirebaseError(String value) {
    _$messageFirebaseErrorAtom.reportWrite(value, super.messageFirebaseError,
        () {
      super.messageFirebaseError = value;
    });
  }

  late final _$hasErrorEmailAtom =
      Atom(name: '_UserInformationStoreBase.hasErrorEmail', context: context);

  @override
  bool get hasErrorEmail {
    _$hasErrorEmailAtom.reportRead();
    return super.hasErrorEmail;
  }

  @override
  set hasErrorEmail(bool value) {
    _$hasErrorEmailAtom.reportWrite(value, super.hasErrorEmail, () {
      super.hasErrorEmail = value;
    });
  }

  late final _$loginUserAsyncAction =
      AsyncAction('_UserInformationStoreBase.loginUser', context: context);

  @override
  Future<void> loginUser({required String email, required String password}) {
    return _$loginUserAsyncAction
        .run(() => super.loginUser(email: email, password: password));
  }

  late final _$_UserInformationStoreBaseActionController =
      ActionController(name: '_UserInformationStoreBase', context: context);

  @override
  void setEmail(String value) {
    final _$actionInfo = _$_UserInformationStoreBaseActionController
        .startAction(name: '_UserInformationStoreBase.setEmail');
    try {
      return super.setEmail(value);
    } finally {
      _$_UserInformationStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPassword(String value) {
    final _$actionInfo = _$_UserInformationStoreBaseActionController
        .startAction(name: '_UserInformationStoreBase.setPassword');
    try {
      return super.setPassword(value);
    } finally {
      _$_UserInformationStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setErrorFirebase(bool value) {
    final _$actionInfo = _$_UserInformationStoreBaseActionController
        .startAction(name: '_UserInformationStoreBase.setErrorFirebase');
    try {
      return super.setErrorFirebase(value);
    } finally {
      _$_UserInformationStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setMessageFirebaseError(String value) {
    final _$actionInfo = _$_UserInformationStoreBaseActionController
        .startAction(name: '_UserInformationStoreBase.setMessageFirebaseError');
    try {
      return super.setMessageFirebaseError(value);
    } finally {
      _$_UserInformationStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setHasErrorEmail(bool value) {
    final _$actionInfo = _$_UserInformationStoreBaseActionController
        .startAction(name: '_UserInformationStoreBase.setHasErrorEmail');
    try {
      return super.setHasErrorEmail(value);
    } finally {
      _$_UserInformationStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateFields() {
    final _$actionInfo = _$_UserInformationStoreBaseActionController
        .startAction(name: '_UserInformationStoreBase.validateFields');
    try {
      return super.validateFields();
    } finally {
      _$_UserInformationStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
email: ${email},
password: ${password},
textEditingController: ${textEditingController},
errorFirebase: ${errorFirebase},
messageFirebaseError: ${messageFirebaseError},
hasErrorEmail: ${hasErrorEmail}
    ''';
  }
}