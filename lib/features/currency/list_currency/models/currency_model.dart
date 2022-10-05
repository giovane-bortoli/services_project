// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:services_project/features/currency/list_currency/models/aud_brl_model.dart';
import 'package:services_project/features/currency/list_currency/models/cad_brl_model.dart';
import 'package:services_project/features/currency/list_currency/models/cny_brl_model.dart';
import 'package:services_project/features/currency/list_currency/models/eur_brl_model.dart';
import 'package:services_project/features/currency/list_currency/models/gbp_brl_model.dart';
import 'package:services_project/features/currency/list_currency/models/jpy_brl_model.dart';
import 'package:services_project/features/currency/list_currency/models/usd_brl_model.dart';

class CurrencyModel {
  UsdBrlModel? usdBrl;
  JpyBrlModel? jpyBrl;
  GbpBrlModel? gbpBrl;
  EurBrlModel? eurBrl;
  CnyBrlModel? cnyBrl;
  CadBrlModel? cadBrl;
  AudBrlModel? audBrl;
  CurrencyModel({
    this.usdBrl,
    this.jpyBrl,
    this.gbpBrl,
    this.eurBrl,
    this.cnyBrl,
    this.cadBrl,
    this.audBrl,
  });
  factory CurrencyModel.fromJson(Map<String, dynamic> json) {
    return CurrencyModel(
      usdBrl:
          json['USDBRL'] != null ? UsdBrlModel.fromJson(json['USDBRL']) : null,
      jpyBrl:
          json['JPYBRL'] != null ? JpyBrlModel.fromJson(json['JPYBRL']) : null,
      gbpBrl:
          json['GBPBRL'] != null ? GbpBrlModel.fromJson(json['GBPBRL']) : null,
      eurBrl:
          json['EURBRL'] != null ? EurBrlModel.fromJson(json['EURBRL']) : null,
      cnyBrl:
          json['CNYBRL'] != null ? CnyBrlModel.fromJson(json['CNYBRL']) : null,
      cadBrl:
          json['CADBRL'] != null ? CadBrlModel.fromJson(json['CADBRL']) : null,
      audBrl:
          json['AUDBRL'] != null ? AudBrlModel.fromJson(json['AUDBRL']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};

    data['USDBRL'] = usdBrl;
    data['JPYBRL'] = jpyBrl != null ? jpyBrl!.toJson() : null;
    data['GBPBRL'] = gbpBrl != null ? gbpBrl!.toJson() : null;
    data['EURBRL'] = eurBrl != null ? eurBrl!.toJson() : null;
    data['CNYBRL'] = cnyBrl != null ? cnyBrl!.toJson() : null;
    data['CADBRL'] = cadBrl != null ? cadBrl!.toJson() : null;
    data['AUDBRL'] = audBrl != null ? audBrl!.toJson() : null;
    return data;
  }
}
