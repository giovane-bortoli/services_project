import 'package:dio/dio.dart' as dio;

class ServicesApiResponse {
  final int? statusCode;
  final dynamic data;
  ServicesApiResponse({
    this.statusCode,
    required this.data,
  });

  factory ServicesApiResponse.fromDioResponse(dio.Response response) {
    return ServicesApiResponse(
        data: response.data, statusCode: response.statusCode);
  }
}
