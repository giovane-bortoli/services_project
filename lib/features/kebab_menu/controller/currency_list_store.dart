import 'dart:convert';
import 'dart:developer';

import 'package:mobx/mobx.dart';
import 'package:services_project/features/currency/list_currency/models/currency_model.dart';
import 'package:services_project/features/currency/list_currency/services/get_currency.dart';
import 'package:services_project/features/currency/list_currency/services/save_currency.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'currency_list_store.g.dart';

class CurrencyListStore = _CurrencyListStoreBase with _$CurrencyListStore;

abstract class _CurrencyListStoreBase with Store {
  final currencyDetails = GetCurrency();
  final saveCurrency = SaveFavoriteCurrency();
  final currencyModel = CurrencyModel();

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

  @observable
  List<USDBRL?> currencyList = [];

  @action
  // void setCurrencyList(List<CurrencyModel> value) => currencyList = value;

  @action
  Future<void> initialLoad() async {
    final result = await currencyDetails.getCurrency();
    inspect(result);
  }

  @action
  Future<void> loadCurrencyList() async {
    final currencyDetailsList = await currencyDetails.getCurrency();
    currencyList.add(currencyDetailsList.uSDBRL);
    currencyList.add(currencyDetailsList.aUDBRL);
    currencyList.add(currencyDetailsList.cADBRL);
    currencyList.add(currencyDetailsList.cNYBRL);
    currencyList.add(currencyDetailsList.eURBRL);
    currencyList.add(currencyDetailsList.gBPBRL);
    currencyList.add(currencyDetailsList.jPYBRL);

    inspect(currencyList);
  }

  //
  void saveFavoriteCurrency() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final result = await currencyDetails.getCurrency();

    String json = jsonEncode(currencyList);
    prefs.setString('currency', json);

    log(json);
  }

  // @action
  // Future<void> saveFavoriteCurrency({required USDBRL currency}) async {
  //   initialStateLoading();
  //   try {
  //     final result = saveCurrency.saveFavoriteCurrency(currency: currency);
  //     inspect(result);
  //     endStateLoading();
  //   } catch (_) {
  //     setIsError(true);
  //   }
  // }
}
