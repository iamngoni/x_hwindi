//
//  x_hwindi
//  dio_request_interceptor
//
//  Created by Ngonidzashe Mangudya on 05/12/2023.
//  Copyright (c) 2023 ModestNerds, Co
//

import 'dart:developer';

import 'package:dio/dio.dart';

import 'services.dart';

class DioRequestInterceptor extends Interceptor {
  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    try {
      final String? accessToken =
          await $secureStorage.getFromDisk('access_token');
      if (accessToken != null) {
        options.headers.addAll({'Authorization': 'JWT $accessToken'});
      }
    } catch (e, s) {
      log(e.toString(), error: e, stackTrace: s);
    }

    return handler.next(options);
  }
}
