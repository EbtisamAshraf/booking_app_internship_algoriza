abstract class ApiConsumer {
  Future<dynamic> get(String path, {Map<String, dynamic>? queryParameters, Map<String, dynamic>? header,bool isMultipart = false,});
  Future<dynamic> post(String path, {dynamic body, Map<String, dynamic>? queryParameters,Map<String, dynamic>? header,bool isMultipart = false,});
  Future<dynamic> put(String path, {Map<String, dynamic>? body, Map<String, dynamic>? queryParameters,Map<String, dynamic>? header,bool isMultipart = false,});
}
