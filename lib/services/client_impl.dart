import 'dart:io';

import '../helpers/logger.dart';
import 'package:client_example/services/client.dart';
import 'package:dio/dio.dart';

/// Implementation of HttpClient class
class HttpClientImpl extends HttpClient {

  /// General request method to handle all request from one place
  /// Handles all exceptions
  Future<dynamic> request(
      {required String url,
      required Method method,
      Map<String, dynamic>? params}) async {
    Response response;

    try {
      if (method == Method.POST) {
        response = await dio!.post(url, data: params);
      } else if (method == Method.DELETE) {
        response = await dio!.delete(url);
      } else if (method == Method.PATCH) {
        response = await dio!.patch(url);
      } else {
        response = await dio!.get(url, queryParameters: params);
      }

      if (response.statusCode == 200) {
        return response;
      } else if (response.statusCode == 401) {
        throw Exception("Unauthorized");
      } else if (response.statusCode == 500) {
        throw Exception("Server Error");
      } else {
        throw Exception("Something does wen't wrong");
      }
    } on SocketException catch (e) {
      LoggerHelper.logger.e(e);
      throw Exception("Not Internet Connection");
    } on FormatException catch (e) {
      LoggerHelper.logger.e(e);
      throw Exception("Bad response format");
    } on DioError catch (e) {
      LoggerHelper.logger.e(e);
      throw Exception(e);
    } catch (e) {
      LoggerHelper.logger.e(e);
      throw Exception("Something wen't wrong");
    }
  }
}
