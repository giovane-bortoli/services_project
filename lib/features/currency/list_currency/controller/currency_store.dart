import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:services_project/features/currency/list_currency/models/currency_model.dart';
import 'package:services_project/features/currency/list_currency/services/get_currency.dart';
part 'currency_store.g.dart';

class CurrencyStore = _CurrencyStoreBase with _$CurrencyStore;

abstract class _CurrencyStoreBase with Store {
  final currencyDetails = GetCurrency();

  @observable
  TextEditingController dolarController = TextEditingController();
  @observable
  TextEditingController euroController = TextEditingController();
  @observable
  TextEditingController currentAmoutController = TextEditingController();

  @observable
  var currencyList = ObservableList<CurrencyModel>.of([]);

  //State Loading
  @observable
  bool isLoading = false;
  @action
  void setIsLoading(bool value) => isLoading = value;

//State Error
  @observable
  bool isError = false;
  @action
  void setIsError(bool value) => isError = value;

  //States get events
  @action
  void initialStateLoading() {
    setIsError(false);
    setIsLoading(true);
  }

  @action
  void endStateLoading() {
    setIsLoading(false);
    setIsError(false);
  }

  @action
  Future<void> getCurrencyApi() async {
    try {
      initialStateLoading();
      await currencyDetails.getCurrency();
      inspect(currencyDetails.getCurrency());
      endStateLoading();
    } catch (e) {
      setIsLoading(false);
      setIsError(true);
    }
  }
}
