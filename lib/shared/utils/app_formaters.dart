import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:services_project/features/currency/list_currency/models/currency_model.dart';
import 'package:services_project/features/kebab_menu/controller/currency_list_store.dart';
import 'package:services_project/main.dart';

final currencyListStore = getIt<CurrencyListStore>();

String formatHour(DateTime now) {
  return DateFormat('kk:mm').format(now);
}

String formatCurrency(int currency) {
  var result = currencyListStore.currencyList[currency]!.high!;
  return result = double.parse(result).toString();
}
