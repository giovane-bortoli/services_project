import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:intl/intl.dart';
import 'package:services_project/features/auth/views/login_view.dart';
import 'package:services_project/features/currency/list_currency/models/currency_model.dart';
import 'package:services_project/features/kebab_menu/controller/currency_list_store.dart';
import 'package:services_project/main.dart';
import 'package:services_project/shared/Widgets/status_bar_widget.dart';
import 'package:services_project/shared/utils/app_formaters.dart';
import 'package:services_project/shared/views/empty_state.dart';

class CurrencyListView extends StatefulWidget {
  const CurrencyListView({Key? key}) : super(key: key);

  @override
  State<CurrencyListView> createState() => _CurrencyListViewState();
}

class _CurrencyListViewState extends State<CurrencyListView> {
  //CurrencyListStore currencyListStore = CurrencyListStore();

  final currencyListStore = getIt<CurrencyListStore>();

  @override
  void initState() {
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
      body: content(context),
    );
  }

  Widget content(context) {
    return Observer(builder: (_) {
      return SingleChildScrollView(
        child: Column(
          children: [
            const StatusBarWidget(),
            _listCurrencies(),
          ],
        ),
      );
    });
  }

  Widget _listCurrencies() {
    return ListView.separated(
        physics: const ScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemBuilder: (BuildContext context, int currency) {
          return Row(
            children: [
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.only(left: 50),
                  child: Card(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Atualizado as ' +
                              formatHour(
                                DateTime.parse(currencyListStore
                                    .currencyList[currency]!.createDate!),
                              ),
                        ),
                        Text(currencyListStore.currencyList[currency]!.code!),
                        Text('Cotação atual: R\$' +
                            currencyListStore.currencyList[currency]!.high!)
                      ],
                    ),
                  ),
                ),
              ),
              Flexible(
                  child: Padding(
                padding: const EdgeInsets.only(left: 70),
                child: IconButton(
                  onPressed: () {
                    currencyListStore.saveFavoriteCurrency();
                  },
                  icon: const Icon(Icons.star_border_outlined),
                ),
              ))
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
