import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:services_project/features/currency/list_currency/models/currency_model.dart';
import 'package:services_project/features/currency/list_currency/services/get_currency.dart';
part 'currency_store.g.dart';

class CurrencyStore = _CurrencyStoreBase with _$CurrencyStore;

abstract class _CurrencyStoreBase with Store {
  final currencyDetails = GetCurrency();

  @observable
  double dolar = 5.17;
  double euro = 5.08;

  @observable
  TextEditingController dolarController = TextEditingController();
  @observable
  TextEditingController euroController = TextEditingController();
  @observable
  TextEditingController currentAmoutController = TextEditingController();

  @action
  void realChanged(String text) {
    double real = double.parse(text);
    dolarController.text = (real / dolar).toStringAsFixed(2);
  }

  @action
  void dolarChanged(String text) {
    double real = double.parse(text);
    dolarController.text = (dolar * dolar).toStringAsFixed(2);
  }

  @observable
  var currencyList = ObservableList<CurrencyModel>.of([]);

  // @action
  // void addCurrency(String value) => currencyList.add(CurrencyModel(usdBrlModel: ));
}
