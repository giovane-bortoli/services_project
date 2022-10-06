import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:mobx/mobx.dart';
import 'package:services_project/features/auth/services/user/user_auth.dart';
import 'package:services_project/shared/client/custom_errors/custom_errors.dart';
import 'package:services_project/shared/client/custom_errors/handle_error.dart';
import 'package:services_project/shared/utils/field_validator.dart';
part 'user_information_store.g.dart';

class UserInformationStore = _UserInformationStoreBase
    with _$UserInformationStore;

abstract class _UserInformationStoreBase with Store {
  final clientAuth = UserAuth();

//User Data
  @observable
  String email = '';

  @action
  void setEmail(String value) => email = value;

  @observable
  String password = '';

  @action
  void setPassword(String value) => password = value;

  @observable
  String errorMessage = '';

  @observable
  TextEditingController textEditingController = TextEditingController();

  //Firebase Methods
  @observable
  bool errorFirebase = false;
  @action
  void setErrorFirebase(bool value) => errorFirebase = value;

  @observable
  String? messageFirebaseError = '';
  @action
  void setMessageFirebaseError(String value) => messageFirebaseError = value;

  @observable
  bool passwordVisible = false;
  @action
  void setPasswordVisible(bool value) => passwordVisible = value;

  @action
  Future<void> loginUser(
      {required String email, required String password}) async {
    try {
      setErrorFirebase(false);
      setMessageFirebaseError('');
      await clientAuth.signIn(email, password);
    } on FirebaseAuthException catch (e) {
      setErrorFirebase(true);
      if (e.code == 'user-not-found') {
        setMessageFirebaseError('Usuário não encontrado');
      } else if (e.code == 'wrong-password') {
        setMessageFirebaseError('Senha inválida!');
      } else if (e.code == 'invalid-email') {
        setMessageFirebaseError('Email inválido');
      } else {
        setMessageFirebaseError('Ocorreu um erro, tente novamente!');
      }
    }
  }

  @action
  Future<void> logOut() async {
    await clientAuth.signOut();
  }

  @observable
  bool hasErrorEmail = false;
  @action
  void setHasErrorEmail(bool value) => hasErrorEmail = value;

  @action
  void validateFields() {
    if (!emailValid(email)) {
      setHasErrorEmail(true);
    }
  }
}
