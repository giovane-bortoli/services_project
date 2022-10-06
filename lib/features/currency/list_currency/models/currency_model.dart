class CurrencyModel {
  USDBRL? uSDBRL;
  USDBRL? aUDBRL;
  USDBRL? cADBRL;
  USDBRL? eURBRL;
  USDBRL? jPYBRL;
  USDBRL? gBPBRL;
  USDBRL? cNYBRL;

  CurrencyModel(
      {this.uSDBRL,
      this.aUDBRL,
      this.cADBRL,
      this.eURBRL,
      this.jPYBRL,
      this.gBPBRL,
      this.cNYBRL});

  CurrencyModel.fromJson(Map<String, dynamic> json) {
    uSDBRL = json['USDBRL'] != null ? USDBRL.fromJson(json['USDBRL']) : null;
    aUDBRL = json['AUDBRL'] != null ? USDBRL.fromJson(json['AUDBRL']) : null;
    cADBRL = json['CADBRL'] != null ? USDBRL.fromJson(json['CADBRL']) : null;
    eURBRL = json['EURBRL'] != null ? USDBRL.fromJson(json['EURBRL']) : null;
    jPYBRL = json['JPYBRL'] != null ? USDBRL.fromJson(json['JPYBRL']) : null;
    gBPBRL = json['GBPBRL'] != null ? USDBRL.fromJson(json['GBPBRL']) : null;
    cNYBRL = json['CNYBRL'] != null ? USDBRL.fromJson(json['CNYBRL']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (uSDBRL != null) {
      data['USDBRL'] = uSDBRL!.toJson();
    }
    if (aUDBRL != null) {
      data['AUDBRL'] = aUDBRL!.toJson();
    }
    if (cADBRL != null) {
      data['CADBRL'] = cADBRL!.toJson();
    }
    if (eURBRL != null) {
      data['EURBRL'] = eURBRL!.toJson();
    }
    if (jPYBRL != null) {
      data['JPYBRL'] = jPYBRL!.toJson();
    }
    if (gBPBRL != null) {
      data['GBPBRL'] = gBPBRL!.toJson();
    }
    if (cNYBRL != null) {
      data['CNYBRL'] = cNYBRL!.toJson();
    }
    return data;
  }
}

class USDBRL {
  String? code;
  String? codein;
  String? name;
  String? high;
  String? low;
  String? varBid;
  String? pctChange;
  String? bid;
  String? ask;
  String? timestamp;
  String? createDate;

  USDBRL(
      {this.code,
      this.codein,
      this.name,
      this.high,
      this.low,
      this.varBid,
      this.pctChange,
      this.bid,
      this.ask,
      this.timestamp,
      this.createDate});

  USDBRL.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    codein = json['codein'];
    name = json['name'];
    high = json['high'];
    low = json['low'];
    varBid = json['varBid'];
    pctChange = json['pctChange'];
    bid = json['bid'];
    ask = json['ask'];
    timestamp = json['timestamp'];
    createDate = json['create_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['codein'] = codein;
    data['name'] = name;
    data['high'] = high;
    data['low'] = low;
    data['varBid'] = varBid;
    data['pctChange'] = pctChange;
    data['bid'] = bid;
    data['ask'] = ask;
    data['timestamp'] = timestamp;
    data['create_date'] = createDate;
    return data;
  }
}
