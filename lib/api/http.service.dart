import 'dart:io';

import 'package:dio/dio.dart';

import '../logger/logger.service.dart';

enum Method { post, get, put, delete, patch }

const baseUrl = "https://50cb4c11-a61a-4c4f-9f61-2de90e402d80.mock.pstmn.io";

class MyHttp {
  Dio? _dio;

  static header() => {"Content-Type": "application/json"};

  MyHttp() {
    _dio = Dio(BaseOptions(baseUrl: baseUrl, headers: header()));
    initInterceptors();
  }

  void initInterceptors() {
    _dio!.interceptors.add(
      InterceptorsWrapper(
        onRequest: (requestOptions, handler) {
          logger.log(
              LogLevel.L_INFO,
              "REQUEST[${requestOptions.method}] => PATH: ${requestOptions.path}"
              "=> REQUEST VALUES: ${requestOptions.queryParameters} => HEADERS: ${requestOptions.headers}");
          return handler.next(requestOptions);
        },
        onResponse: (response, handler) {
          logger.log(LogLevel.L_INFO,
              "RESPONSE[${response.statusCode}] => DATA: ${response.data}");
          return handler.next(response);
        },
        onError: (err, handler) {
          logger.log(LogLevel.L_INFO, "Error[${err.response?.statusCode}]");
          return handler.next(err);
        },
      ),
    );
  }

  Future<Response> request(
      {required String url,
      required Method method,
      Map<String, dynamic>? params}) async {
    Response response;

    // await Future.delayed(const Duration(milliseconds: 300), () {});

    try {
      switch (method) {
        case Method.post:
          response = await _dio!.post(url, data: params);
          break;
        case Method.put:
          response = await _dio!.put(url);
          break;
        case Method.delete:
          response = await _dio!.delete(url);
          break;
        default:
          response = await _dio!.get(url, queryParameters: params);
          break;
      }

      switch (response.statusCode) {
        case HttpStatus.ok:
          return response;
        case HttpStatus.unauthorized:
          throw Exception("Unauthorized");
        case HttpStatus.internalServerError:
          throw Exception("Server Error");
        default:
          throw Exception("Something else wen't wrong");
      }
    } on SocketException catch (e) {
      logger.log(LogLevel.L_ERROR, e.toString());
      throw Exception("Not Internet Connection");
    } on FormatException catch (e) {
      logger.log(LogLevel.L_ERROR, e.toString());
      throw Exception("Bad response format");
    } on DioError catch (e) {
      logger.log(LogLevel.L_ERROR, e.toString());
      throw Exception(e);
    } catch (e) {
      logger.log(LogLevel.L_ERROR, e.toString());
      throw Exception("Something wen't wrong");
    }
  }
}
