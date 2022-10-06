import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:services_project/features/auth/controller/user_information_store.dart';
import 'package:services_project/features/currency/list_currency/controller/currency_store.dart';
import 'package:services_project/features/currency/list_currency/models/currency_model.dart';

import 'package:services_project/features/currency/list_currency/services/get_currency.dart';
import 'package:services_project/main.dart';
import 'package:services_project/shared/Widgets/custom_text_form_field.dart';

class FavoriteCurrencyView extends StatefulWidget {
  const FavoriteCurrencyView({Key? key}) : super(key: key);
  static const routeName = '/favoriteCurrencyView';

  @override
  State<FavoriteCurrencyView> createState() => _FavoriteCurrencyViewState();
}

class _FavoriteCurrencyViewState extends State<FavoriteCurrencyView> {
  CurrencyStore currencyStore = CurrencyStore();
  UserInformationStore userStore = UserInformationStore();

  final currencyModel = getIt<CurrencyModel>();
  final serviceGetCurrency = getIt<GetCurrency>();

  @override
  initState() {
    setState(() {
      currencyStore.getCurrencyApi();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          PopupMenuButton(
            icon: const Icon(Icons.more_vert),
            itemBuilder: ((context) {
              return [
                PopupMenuItem(
                  child: TextButton(
                    onPressed: () {
                      Navigator.popAndPushNamed(context, '/listCurrencyView');
                    },
                    child: const Text('Currency List'),
                  ),
                ),
                PopupMenuItem(
                  child: TextButton(
                    onPressed: () {
                      userStore.logOut().then(
                            (value) =>
                                Navigator.popAndPushNamed(context, '/login'),
                          );
                    },
                    child: const Text('Sair'),
                  ),
                ),
              ];
            }),
          ),
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
            _addCurrencyText(),
            _buttonTest(),
            _buttonTest2(),
          ],
        ),
      ),
    );
  }

  Widget _cardCurrency() {
    return Card(
      child: Column(
        children: [
          // Text(currencyModel.usdBrl?.code ?? 'teste'),
          // Text(currencyModel.usdBrl?.high ?? 'teste'),
          // Text(currencyModel.usdBrl?.bid ?? 'teste'),
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
        // await currencyStore.currencyDetails.getCurrency();
        // inspect(currencyStore.currencyDetails.getCurrency());
      },
      child: const Text('teste'),
    );
  }

  Widget _buttonTest2() {
    return ElevatedButton(
      onPressed: () async {
        CurrencyModel currencyModelTest =
            await currencyStore.currencyDetails.getCurrency();

        //log(currencyModelTest.usdBrl?.name ?? '');
      },
      child: const Text('teste'),
    );
  }
}
