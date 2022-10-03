// ignore_for_file: public_member_api_docs, sort_constructors_first
class JpyBrlModel {
  final String code;
  final String? codein;
  final String? name;
  final String high;
  final String? low;
  final String? varBid;
  final String? pctChange;
  final String? bid;
  final String? ask;
  final String? timestamp;
  final String? createDate;
  JpyBrlModel({
    required this.code,
    this.codein,
    this.name,
    required this.high,
    this.low,
    this.varBid,
    this.pctChange,
    this.bid,
    this.ask,
    this.timestamp,
    this.createDate,
  });

  factory JpyBrlModel.fromJson(Map<String, dynamic> json) {
    return JpyBrlModel(
      code: json['code'],
      codein: json['codein'],
      name: json['name'],
      high: json['high'],
      low: json['low'],
      varBid: json['varBid'],
      pctChange: json['pctChange'],
      bid: json['bid'],
      ask: json['ask'],
      timestamp: json['timestamp'],
      createDate: json['createDate'],
    );
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
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
    data['createDate'] = createDate;
    return data;
  }
}
