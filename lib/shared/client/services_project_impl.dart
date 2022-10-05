import 'package:services_project/shared/client/services_api_response.dart';
import 'package:services_project/shared/client/services_client.dart';
import 'package:dio/dio.dart' as dio;
import 'package:dio/dio.dart';

class ServicesProjectsImpl extends ServicesClient {
  final dio.Dio client = Dio();
  @override
  Future<ServicesApiResponse> get(String path,
      {Map<String, String>? headers, Map<String, dynamic>? query}) async {
    final response = await client.get(path,
        queryParameters: query,
        options: dio.Options(
            sendTimeout: 5000,
            receiveTimeout: 5000,
            headers: headers,
            validateStatus: (status) =>
                status != null && (status >= 200 && status <= 499)));

    return ServicesApiResponse.fromDioResponse(response);
  }
}
