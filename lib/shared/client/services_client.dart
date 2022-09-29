import 'package:services_project/shared/client/services_api_response.dart';

abstract class ServicesClient {
  Future<ServicesApiResponse> get(String path,
      {Map<String, String>? headers, Map<String, dynamic>? query});

  Future<ServicesApiResponse> post(String path,
      {Map<String, String>? headers, Map<String, dynamic>? query});
}
