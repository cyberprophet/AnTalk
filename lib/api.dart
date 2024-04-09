import 'package:antech/cache.dart';
import 'package:dio/dio.dart';

class ApiProvider {
  Future<dynamic> getAsync(String path) async {
    final response = await Dio(_options).get(path);

    if (200 == response.statusCode) {
      return response.data;
    }
    return response.statusCode;
  }

  Future<dynamic> deleteAsync(String path) async {
    final response = await Dio(_options).delete(path);

    if (200 == response.statusCode) {
      return response.data;
    }
    return response.statusCode;
  }

  Future<dynamic> postAsync(String path, Object body) async {
    final response = await Dio(_options).post(
      path,
      data: body,
    );
    if (200 == response.statusCode) {
      return response.data;
    }
    return response.statusCode;
  }

  final _options = BaseOptions(
    baseUrl: 'https://invest.share.enterprises/',
    contentType: Headers.jsonContentType,
    responseType: ResponseType.json,
    headers: {'Authorization': 'Bearer $bearerToken'},
  );
}
