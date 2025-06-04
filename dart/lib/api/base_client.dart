import 'dart:convert';

import 'package:result_dart/result_dart.dart';
import 'package:dio/dio.dart';

typedef FormDataType = FormData;

class ApiError {
  const ApiError(this.type, this.code, this.message);

  final String type;
  final int code;
  final String message;
}

class NoBody {}

class RequestOptions {
  Map<String, dynamic>? headers;
  Map<String, dynamic>? query;

  RequestOptions({this.query, this.headers});
}

String createUrl(String baseUrl, String path) {
  return baseUrl + path;
}

class BaseApiClient {
  BaseApiClient({this.baseUrl = ""}) {
    _dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        validateStatus: (status) {
          return true;
        },
      ),
    );

    headers = <String, String>{};
  }

  String baseUrl;
  late Dio _dio;
  late Map<String, String> headers;

  AsyncResultDart<Map<String, dynamic>, ApiError> request(
    String method,
    String path, {
    RequestOptions? options,
    Map<String, dynamic>? body,
  }) async {
    final headers = <String, dynamic>{...this.headers};
    headers["Content-Type"] = "application/json";

    if (options?.headers != null) {
      headers.addAll(options!.headers!);
    }

    final res = await _dio.request(
      path,
      options: Options(method: method, headers: headers),
      queryParameters: options?.query,
      data: body != null ? jsonEncode(body) : null,
    );

    final data = res.data as Map<String, dynamic>;

    final success = data["success"] as bool;

    if (!success) {
      final error = data["error"] as Map<String, dynamic>;
      return Failure(
        ApiError(
          error["type"] as String,
          error["code"] as int,
          error["message"] as String,
        ),
      );
    }

    return Success(data["data"]);
  }

  AsyncResultDart<Map<String, dynamic>, ApiError> requestForm(
    String method,
    String path, {
    RequestOptions? options,
    FormData? body,
  }) async {
    final headers = <String, dynamic>{...this.headers};
    headers["Content-Type"] = "multipart/form-data";

    if (options?.headers != null) {
      headers.addAll(options!.headers!);
    }

    final res = await _dio.request(
      path,
      options: Options(method: method, headers: headers),
      queryParameters: options?.query,
      data: body,
    );

    final data = res.data as Map<String, dynamic>;

    final success = data["success"] as bool;

    if (!success) {
      final error = data["error"] as Map<String, dynamic>;
      return Failure(
        ApiError(
          error["type"] as String,
          error["code"] as int,
          error["message"] as String,
        ),
      );
    }

    return Success(data["data"]);
  }
}
