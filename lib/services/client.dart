import 'dart:io';

import 'package:client_example/helpers/logger.dart';
import 'package:dio/dio.dart';

// ignore: constant_identifier_names
enum Method { POST, GET, PUT, DELETE, PATCH }

abstract class HttpClient {
  Dio? dio;
  static const baseUrl = "https://fakestoreapi.com/";
  static header() => {"Content-Type": "application/json"};

  HttpClient() {
    dio = Dio(BaseOptions(baseUrl: baseUrl, headers: header()));
    _initInterceptors();
  }

  void _initInterceptors() {
    dio!.interceptors.add(
      InterceptorsWrapper(
        onRequest: (requestOptions, handler) {
          LoggerHelper.logger.i(
              "REQUEST[${requestOptions.method}] => PATH: ${requestOptions.path}"
              "=> REQUEST VALUES: ${requestOptions.queryParameters} => HEADERS: ${requestOptions.headers}");
          return handler.next(requestOptions);
        },
        onResponse: (response, handler) {
          LoggerHelper.logger.i(
              "RESPONSE STATUS CODE[${response.statusCode}] => RESPONSE DATA: ${response.data}");
          return handler.next(response);
        },
        onError: (err, handler) {
          LoggerHelper.logger.i("Error[${err.response?.statusCode}]");
          return handler.next(err);
        },
      ),
    );
  }
}
