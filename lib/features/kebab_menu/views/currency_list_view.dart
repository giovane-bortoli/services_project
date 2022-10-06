import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:services_project/features/currency/list_currency/models/currency_model.dart';
import 'package:services_project/features/kebab_menu/controller/currency_list_store.dart';
import 'package:services_project/main.dart';
import 'package:services_project/shared/Widgets/status_bar_widget.dart';
import 'package:services_project/shared/views/empty_state.dart';

class CurrencyListView extends StatefulWidget {
  const CurrencyListView({Key? key}) : super(key: key);

  @override
  State<CurrencyListView> createState() => _CurrencyListViewState();
}

class _CurrencyListViewState extends State<CurrencyListView> {
  //CurrencyListStore currencyListStore = CurrencyListStore();
  final currencyListStoreTest = getIt<CurrencyListStore>();
  final currencyListStore = getIt<CurrencyListStore>();

  @override
  void initState() {
    currencyListStoreTest.initialLoad();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.only(right: 60, left: 75),
          child: Text('My Currencies', textAlign: TextAlign.center),
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.popAndPushNamed(context, '/favoriteCurrencyView');
            },
            icon: const Icon(Icons.chevron_left)),
      ),
      body: SingleChildScrollView(
        child: content(context),
      ),
    );
  }

  Widget content(context) {
    return Observer(builder: (_) {
      return Column(
        children: [
          const StatusBarWidget(),
          _listCurrencies(),
        ],
      );
    });
  }

  Widget _listCurrencies() {
    return ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemBuilder: (BuildContext context, int currency) {
          return Row(
            children: [
              Flexible(
                child: ListTile(
                  leading: const Icon(Icons.attach_money_sharp),
                  title: Text(currencyListStore.currencyList[currency]!.code!),
                  trailing: Text(
                      currencyListStore.currencyList[currency]!.bid.toString()),
                ),
              ),
            ],
          );
        },
        separatorBuilder: (_, __) => const Divider(),
        itemCount: currencyListStore.currencyList.length);
  }

  Widget _buttonTest() {
    return ElevatedButton(onPressed: () {}, child: Text('teste'));
  }
}
