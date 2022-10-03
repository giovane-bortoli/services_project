import 'dart:developer';

import 'package:provider/provider.dart';
import 'package:services_project/features/currency/list_currency/models/currency_model.dart';
import 'package:services_project/shared/client/services_project_impl.dart';
import 'package:services_project/shared/utils/app_configs.dart';

class GetCurrency {
  Future<CurrencyModel> getCurrency(
    context,
  ) async {
    final client = Provider.of<ServicesProjectsImpl>(context, listen: false);
    final response = await client.get('${AppConfigs.baseUrl}');
    if (response.statusCode == 200) {
      inspect(response);
      return CurrencyModel.fromJson(response.data);
    } else {
      throw Exception();
    }
  }
}
