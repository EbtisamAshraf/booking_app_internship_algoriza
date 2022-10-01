import 'dart:convert';
import 'dart:io';
import 'package:booking_app_internship_algoriza/core/api/api_consumer.dart';
import 'package:booking_app_internship_algoriza/core/api/app_interceptors%20.dart';
import 'package:booking_app_internship_algoriza/core/api/end_points.dart';
import 'package:booking_app_internship_algoriza/core/api/status_code.dart';
import 'package:booking_app_internship_algoriza/core/error/exceptions.dart';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:booking_app_internship_algoriza/injection_container.dart' as di;

class DioConsumer implements ApiConsumer {
  final Dio dio;

  DioConsumer({required this.dio}) {
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };
    dio.options
      ..baseUrl = EndPoints.baseUrl
      ..responseType = ResponseType.plain
      ..followRedirects = false
      ..validateStatus = ((status) {
        return status! < StatusCode.internalServerError;
      });

    // dio.interceptors.add(di.sl<AppInterceptors>());
    if (kDebugMode) {
      dio.interceptors.add(di.sl<LogInterceptor>());
    }
  }
  @override
  Future get(String path, {Map<String, dynamic>? queryParameters, Map<String, dynamic>? header,bool isMultipart = false,}) async {
    try {
      final response = await dio.get(path, queryParameters: queryParameters,options:Options(contentType: isMultipart? 'multipart/form-data':'application/json' ,headers: header));
      return jsonDecode(response.data.toString());
    } on DioError catch (error) {
      _handleDioError(error);
    }
  }

  @override
  Future post(String path,
      { dynamic body,
      Map<String, dynamic>? queryParameters, Map<String, dynamic>? header,bool isMultipart = false,}) async {
    try {
      final response =
          await dio.post(path, data: body, queryParameters: queryParameters,options:Options(contentType: isMultipart ? 'multipart/form-data':'application/json' ,headers: header));
      return jsonDecode(response.data.toString());
    } on DioError catch (error) {
      _handleDioError(error);
    }
  }

  @override
  Future put(String path,
      {Map<String, dynamic>? body,
      Map<String, dynamic>? queryParameters, Map<String, dynamic>? header,bool isMultipart = false,}) async {
    try {
      final response =
          await dio.put(path, data: body, queryParameters: queryParameters,options:Options(contentType: isMultipart? 'multipart/form-data' : 'application/json' ,headers: header));
      return jsonDecode(response.data.toString());
    } on DioError catch (error) {
      _handleDioError(error);
    }
  }

  dynamic _handleDioError(DioError error) {
    switch (error.type) {
      case DioErrorType.connectTimeout:
      case DioErrorType.sendTimeout:
      case DioErrorType.receiveTimeout:
        throw const FetchDataException();
      case DioErrorType.response:
        switch (error.response?.statusCode) {
          case StatusCode.badRequest:
            throw const BadRequestException();
          case StatusCode.unauthorized:
          case StatusCode.forbidden:
            throw const UnauthorizedException();
          case StatusCode.notFound:
            throw const NotFoundException();
          case StatusCode.conflict:
            throw const ConflictException();
          case StatusCode.internalServerError:
            throw const InternalServerErrorException();
        }
        break;
      case DioErrorType.cancel:
        break;
      case DioErrorType.other:
        throw const NoInternetConnectionException();
    }
  }
}
