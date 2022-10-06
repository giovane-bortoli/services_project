import 'dart:convert';

import 'package:mobx/mobx.dart';
import 'package:services_project/features/currency/list_currency/models/currency_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'save_currency.g.dart';

class SaveFavoriteCurrency = _SaveFavoriteCurrencyBase
    with _$SaveFavoriteCurrency;

abstract class _SaveFavoriteCurrencyBase with Store {
  Future<void> saveFavoriteCurrency({required USDBRL currency}) async {
    try {
      final instance = await SharedPreferences.getInstance();
      List<String> currencyList = [];

      if (instance.containsKey('currency')) {
        currencyList = instance.getStringList('currency')!;
        currencyList.add(jsonEncode(currency.toJson()));
        instance.setStringList('currency', currencyList);
      } else {
        currencyList.add(jsonEncode(currency.toJson()));
        instance.setStringList('currency', currencyList);
      }
    } catch (_) {
      throw Exception();
    }
  }
}
