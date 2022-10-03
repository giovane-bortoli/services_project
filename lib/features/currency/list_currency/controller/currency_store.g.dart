// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'currency_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CurrencyStore on _CurrencyStoreBase, Store {
  late final _$dolarAtom =
      Atom(name: '_CurrencyStoreBase.dolar', context: context);

  @override
  double get dolar {
    _$dolarAtom.reportRead();
    return super.dolar;
  }

  @override
  set dolar(double value) {
    _$dolarAtom.reportWrite(value, super.dolar, () {
      super.dolar = value;
    });
  }

  late final _$dolarControllerAtom =
      Atom(name: '_CurrencyStoreBase.dolarController', context: context);

  @override
  TextEditingController get dolarController {
    _$dolarControllerAtom.reportRead();
    return super.dolarController;
  }

  @override
  set dolarController(TextEditingController value) {
    _$dolarControllerAtom.reportWrite(value, super.dolarController, () {
      super.dolarController = value;
    });
  }

  late final _$euroControllerAtom =
      Atom(name: '_CurrencyStoreBase.euroController', context: context);

  @override
  TextEditingController get euroController {
    _$euroControllerAtom.reportRead();
    return super.euroController;
  }

  @override
  set euroController(TextEditingController value) {
    _$euroControllerAtom.reportWrite(value, super.euroController, () {
      super.euroController = value;
    });
  }

  late final _$currentAmoutControllerAtom =
      Atom(name: '_CurrencyStoreBase.currentAmoutController', context: context);

  @override
  TextEditingController get currentAmoutController {
    _$currentAmoutControllerAtom.reportRead();
    return super.currentAmoutController;
  }

  @override
  set currentAmoutController(TextEditingController value) {
    _$currentAmoutControllerAtom
        .reportWrite(value, super.currentAmoutController, () {
      super.currentAmoutController = value;
    });
  }

  late final _$currencyListAtom =
      Atom(name: '_CurrencyStoreBase.currencyList', context: context);

  @override
  ObservableList<CurrencyModel> get currencyList {
    _$currencyListAtom.reportRead();
    return super.currencyList;
  }

  @override
  set currencyList(ObservableList<CurrencyModel> value) {
    _$currencyListAtom.reportWrite(value, super.currencyList, () {
      super.currencyList = value;
    });
  }

  late final _$_CurrencyStoreBaseActionController =
      ActionController(name: '_CurrencyStoreBase', context: context);

  @override
  void realChanged(String text) {
    final _$actionInfo = _$_CurrencyStoreBaseActionController.startAction(
        name: '_CurrencyStoreBase.realChanged');
    try {
      return super.realChanged(text);
    } finally {
      _$_CurrencyStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void dolarChanged(String text) {
    final _$actionInfo = _$_CurrencyStoreBaseActionController.startAction(
        name: '_CurrencyStoreBase.dolarChanged');
    try {
      return super.dolarChanged(text);
    } finally {
      _$_CurrencyStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
dolar: ${dolar},
dolarController: ${dolarController},
euroController: ${euroController},
currentAmoutController: ${currentAmoutController},
currencyList: ${currencyList}
    ''';
  }
}
