import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:services_project/features/currency/list_currency/controller/currency_store.dart';
import 'package:services_project/features/currency/list_currency/models/currency_model.dart';
import 'package:services_project/features/currency/list_currency/services/get_currency.dart';
import 'package:services_project/shared/Widgets/custom_text_form_field.dart';

class ListCurrencyView extends StatefulWidget {
  const ListCurrencyView({Key? key}) : super(key: key);

  @override
  State<ListCurrencyView> createState() => _ListCurrencyViewState();
}

class _ListCurrencyViewState extends State<ListCurrencyView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: content(context),
    );
  }

  Widget content(context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _cardCurrencyAdd(),
          _addCurrencyText(),
          buttonTest(),
        ],
      ),
    );
  }

  Widget _cardCurrencyAdd() {
    final currencyStore = Provider.of<CurrencyStore>(context, listen: false);

    return Padding(
      padding: const EdgeInsets.only(top: 100),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Column(
            children: List.from(
              currencyStore.currencyList.map(
                (currency) {
                  return _previousCurrencyField(currency);
                },
              ),
            ),
          ),
          _addCurrencyField(),
        ],
      ),
    );
  }

  Widget _previousCurrencyField(CurrencyModel initialValue) {
    final currencyStore = Provider.of<CurrencyStore>(context, listen: false);
    final currencyModel =
        ModalRoute.of(context)!.settings.arguments as CurrencyModel;
    return Card(
      child: Column(
        children: [
          Card(
            child: Column(
              children: [
                Text(currencyModel.eurBrl!.code),
                Text('550'),
                Text('cotação atual: 5.50'),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _addCurrencyField() {
    final currencyStore = Provider.of<CurrencyStore>(context, listen: false);

    return Card(
      child: Column(
        children: [
          Text('USD'),
          Text('550'),
          Text('cotação atual: 5.50'),
        ],
      ),
    );
  }

  Widget _addCurrencyText() {
    final currencyStore = Provider.of<CurrencyStore>(context, listen: false);

    return Padding(
      padding: const EdgeInsets.only(top: 150),
      child:
          TextButton(onPressed: () {}, child: Text('Adicionar mais uma moeda')),
    );
  }

  Widget buttonTest() {
    return ElevatedButton(
      onPressed: () async {
        inspect(GetCurrency().getCurrency(context));
      },
      child: const Text('teste'),
    );
  }
}
