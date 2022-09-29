import 'package:flutter/widgets.dart';
import 'package:mobx/mobx.dart';
import 'package:services_project/features/auth/services/user/user_auth.dart';
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
  TextEditingController textEditingController = TextEditingController();

  //Firebase Methods
  @observable
  bool errorFirebase = false;
  @action
  void setErrorFirebase(bool value) => errorFirebase = value;

  @observable
  String messageFirebaseError = '';
  @action
  void setMessageFirebaseError(String value) => messageFirebaseError = value;

  @action
  Future<void> loginUser(
      {required String email, required String password}) async {
    try {
      setErrorFirebase(false);
      setMessageFirebaseError('');
      await clientAuth.signIn(email, password);
    } on Exception catch (e) {
      if (e == 'user-not-found') {
        setErrorFirebase(true);
        setMessageFirebaseError('Usuário não encontrado');
      } else if (e == 'wrong-password') {
        setErrorFirebase(true);
        setMessageFirebaseError('Senha inválida!');
      } else if (e == 'invalid-email') {
        setErrorFirebase(true);
        setMessageFirebaseError('Email inválido');
      } else {
        setErrorFirebase(true);
        setMessageFirebaseError('Ocorreu um erro, tente novamente!');
      }
    }
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
