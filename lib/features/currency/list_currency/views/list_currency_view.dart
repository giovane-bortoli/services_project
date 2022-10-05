import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:services_project/features/currency/list_currency/controller/currency_store.dart';
import 'package:services_project/features/currency/list_currency/models/currency_model.dart';
import 'package:services_project/features/currency/list_currency/models/usd_brl_model.dart';
import 'package:services_project/features/currency/list_currency/services/get_currency.dart';
import 'package:services_project/main.dart';
import 'package:services_project/shared/Widgets/custom_text_form_field.dart';

class ListCurrencyView extends StatefulWidget {
  const ListCurrencyView({Key? key}) : super(key: key);
  static const routeName = '/listCurrencyView';

  @override
  State<ListCurrencyView> createState() => _ListCurrencyViewState();
}

class _ListCurrencyViewState extends State<ListCurrencyView> {
  final currencyStore = getIt<CurrencyStore>();
  final currencyModel = getIt<CurrencyModel>();
  @override
  void initState() {
    currencyStore.getCurrencyApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert),
          )
        ],
      ),
      body: content(context),
    );
  }

  Widget content(context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _cardCurrency(),
            //_cardCurrencyAdd(),
            _addCurrencyText(),
            _buttonTest(),
            _buttonTest2(),
          ],
        ),
      ),
    );
  }

  // Widget _cardCurrencyAdd() {
  //   final currencyStore = Provider.of<CurrencyStore>(context, listen: false);

  //   return Padding(
  //     padding: const EdgeInsets.only(top: 100),
  //     child: Column(
  //       crossAxisAlignment: CrossAxisAlignment.center,
  //       mainAxisAlignment: MainAxisAlignment.center,
  //       mainAxisSize: MainAxisSize.min,
  //       children: [
  //         Column(
  //           children: List.from(
  //             currencyStore.currencyList.map(
  //               (currency) {
  //                 return _previousCurrencyField(currency);
  //               },
  //             ),
  //           ),
  //         ),
  //         _addCurrencyField(),
  //       ],
  //     ),
  //   );
  // }

  // Widget _previousCurrencyField(CurrencyModel initialValue) {
  //   final currencyModel = Provider.of<CurrencyModel>(context, listen: false);

  //   final currencyModelTeste = CurrencyModel();
  //   return Card(
  //     child: Column(
  //       children: [
  //         Card(
  //           child: Column(
  //             children: [
  //               Text(currencyModel.eurBrl!.code.toString()),
  //               Text('550'),
  //               Text('cotação atual: 5.50'),
  //             ],
  //           ),
  //         )
  //       ],
  //     ),
  //   );
  // }

  // Widget _addCurrencyField() {
  //   // final currencyModel =
  //   //     ModalRoute.of(context)!.settings.arguments as CurrencyModel;
  //   // final currencyModel = Provider.of<CurrencyModel>(context, listen: false);
  //   final currencyModel = getIt<CurrencyModel>();
  //   return Card(
  //     child: Column(
  //       children: [
  //         Text(currencyModel.usdBrl?.high ?? 'teste'),
  //         Text('550'),
  //         Text('cotação atual: 5.50'),
  //       ],
  //     ),
  //   );
  // }

  Widget _cardCurrency() {
    return Card(
      child: Column(
        children: [
          Text(currencyModel.usdBrl?.code ?? 'teste'),
          Text(currencyModel.usdBrl?.high ?? 'teste'),
          Text(currencyModel.usdBrl?.bid ?? 'teste'),
          const Text('dado do card'),
        ],
      ),
    );
  }

  Widget _addCurrencyText() {
    return Padding(
      padding: const EdgeInsets.only(top: 150),
      child:
          TextButton(onPressed: () {}, child: Text('Adicionar mais uma moeda')),
    );
  }

  Widget _buttonTest() {
    return ElevatedButton(
      onPressed: () async {
        await currencyStore.currencyDetails.getCurrency();
        inspect(currencyStore.currencyDetails.getCurrency());
      },
      child: const Text('teste'),
    );
  }

  Widget _buttonTest2() {
    return ElevatedButton(
      onPressed: () async {
        CurrencyModel currencyModelTest =
            await currencyStore.currencyDetails.getCurrency();

        log(currencyModelTest.usdBrl?.high ?? '');
      },
      child: const Text('teste'),
    );
  }
}
