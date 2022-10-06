// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'currency_list_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CurrencyListStore on _CurrencyListStoreBase, Store {
  late final _$isLoadingAtom =
      Atom(name: '_CurrencyListStoreBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$isErrorAtom =
      Atom(name: '_CurrencyListStoreBase.isError', context: context);

  @override
  bool get isError {
    _$isErrorAtom.reportRead();
    return super.isError;
  }

  @override
  set isError(bool value) {
    _$isErrorAtom.reportWrite(value, super.isError, () {
      super.isError = value;
    });
  }

  late final _$currencyListAtom =
      Atom(name: '_CurrencyListStoreBase.currencyList', context: context);

  @override
  List<USDBRL?> get currencyList {
    _$currencyListAtom.reportRead();
    return super.currencyList;
  }

  @override
  set currencyList(List<USDBRL?> value) {
    _$currencyListAtom.reportWrite(value, super.currencyList, () {
      super.currencyList = value;
    });
  }

  late final _$initialLoadAsyncAction =
      AsyncAction('_CurrencyListStoreBase.initialLoad', context: context);

  @override
  Future<void> initialLoad() {
    return _$initialLoadAsyncAction.run(() => super.initialLoad());
  }

  late final _$loadCurrencyListAsyncAction =
      AsyncAction('_CurrencyListStoreBase.loadCurrencyList', context: context);

  @override
  Future<void> loadCurrencyList() {
    return _$loadCurrencyListAsyncAction.run(() => super.loadCurrencyList());
  }

  late final _$_CurrencyListStoreBaseActionController =
      ActionController(name: '_CurrencyListStoreBase', context: context);

  @override
  void setIsLoading(bool value) {
    final _$actionInfo = _$_CurrencyListStoreBaseActionController.startAction(
        name: '_CurrencyListStoreBase.setIsLoading');
    try {
      return super.setIsLoading(value);
    } finally {
      _$_CurrencyListStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setIsError(bool value) {
    final _$actionInfo = _$_CurrencyListStoreBaseActionController.startAction(
        name: '_CurrencyListStoreBase.setIsError');
    try {
      return super.setIsError(value);
    } finally {
      _$_CurrencyListStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void initialStateLoading() {
    final _$actionInfo = _$_CurrencyListStoreBaseActionController.startAction(
        name: '_CurrencyListStoreBase.initialStateLoading');
    try {
      return super.initialStateLoading();
    } finally {
      _$_CurrencyListStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void endStateLoading() {
    final _$actionInfo = _$_CurrencyListStoreBaseActionController.startAction(
        name: '_CurrencyListStoreBase.endStateLoading');
    try {
      return super.endStateLoading();
    } finally {
      _$_CurrencyListStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
isError: ${isError},
currencyList: ${currencyList}
    ''';
  }
}
