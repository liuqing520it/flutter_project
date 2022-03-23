import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import '/utils/networking/network_config.dart';
import '../configuration/configuration.dart';
import 'dart:developer';
import 'dart:convert';

class LQNetworking {
  ///基础配置  baseUrl  连接超时时间  接收超时时间
  static final BaseOptions _options = BaseOptions(
    baseUrl: Configuration.baseUrl,
    connectTimeout: 10000,
    receiveTimeout: 20000,
  );

  ///创建dio对象
  static final Dio _dio = Dio(_options);

  ///post 请求
  /// uri 请求地址
  /// params 请求参数
  /// interceptor 拦截器
  static Future<T> postUri<T>(
    String uri, {
    Map<String, dynamic>? params,
    Interceptor? interceptor,
  }) async {
    return _request(uri, method: 'post', params: params);
  }

  ///请求类封装
  /// uri 请求地址
  /// method 请求方法 post/get/ put/ delete
  static Future<T> _request<T>(
    String uri, {
    String method = 'post',
    Map<String, dynamic>? params,
    Interceptor? interceptor,
  }) async {
    String seqID = NetworkingConfig.configSequenceId();
    int timeStamp = NetworkingConfig.getCurrentTimeString();
    Map<String, dynamic> newParams = {
      "path": uri,
      "seqID": seqID,
      "equipment": Platform.isAndroid ? 'android' : 'iOS'
    };
    if (params != null) {
      params.addAll(newParams);
    }
    if (kDebugMode) {
      log("\n请求参数: $params\n");
    }

    ///请求头
    Map<String, dynamic> header = {
      "Content-Type": Headers.formUrlEncodedContentType,

      ///"application/x-www-form-urlencoded;charset=UTF-8",
      "Accept": Headers.jsonContentType,
      "seqID": seqID,
      "path": uri,
      "checksum": NetworkingConfig.configCheckSum(seqID),
      "Sign": NetworkingConfig.configSignString(timeStamp),
      "Timestamp": timeStamp.toString(),
      "iTag": NetworkingConfig.getITagString(),
      "token": "",
    };

    if (kDebugMode) {
      log("\n请求头: $header\n");
    }
    // 请求的单独配置
    final options = Options(method: method, headers: header);

    ///拦截器
    Interceptor dInter = InterceptorsWrapper(
        onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
      // 1.在进行任何网络请求的时候, 可以添加一个loading显示
      // 2.很多页面的访问必须要求携带Token,那么就可以在这里判断是有Token
      // 3.对参数进行一些处理,比如序列化处理等
      return handler.next(options);
    }, onResponse: (
      Response response,
      ResponseInterceptorHandler handler,
    ) {
      // 如果你想终止请求并触发一个错误,你可以 reject 一个`DioError`对象,如`handler.reject(error)`，
      // 这样请求将被中止并触发异常，上层catchError会被调用。
      if (kDebugMode && response.statusCode == 200) {
        // printJson(response.data.toString());
        log(response.data.toString());
      }
      return handler.next(response);
    }, onError: (DioError e, ErrorInterceptorHandler handler) {
      // 如果你想完成请求并返回一些自定义数据，可以resolve 一个`Response`,如`handler.resolve(response)`。
      // 这样请求将会被终止，上层then会被调用，then中返回的数据将是你的自定义response.
      return handler.next(e);
    });

    ///添加拦截器
    List<Interceptor> inters = [dInter];
    if (interceptor != null) {
      inters.add(interceptor);
    }
    _dio.interceptors.addAll(inters);

    try {
      Response response =
          await _dio.request(uri, queryParameters: params, options: options);
      return response.data;
    } on DioError catch (e) {
      return Future.error(e);
    }
  }

  static printJson(String input) {
    const JsonDecoder decoder = JsonDecoder();
    const JsonEncoder encoder = JsonEncoder.withIndent('  ');
    final dynamic object = decoder.convert(input);
    final dynamic prettyString = encoder.convert(object);
    log(prettyString);
    // prettyString.split('\n').forEach((dynamic element) => {
    //   log(element)
    // });
  }
}
