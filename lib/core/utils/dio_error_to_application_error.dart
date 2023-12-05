//
//  x_hwindi
//  dio_error_to_application_error
//
//  Created by Ngonidzashe Mangudya on 05/12/2023.
//  Copyright (c) 2023 ModestNerds, Co
//

import 'dart:developer';

import 'package:dio/dio.dart';

import '../models/data/application_error.dart';

ApplicationError dioErrorToApplicationError(DioException error) {
  late ApplicationError exception;
  switch (error.type) {
    case DioExceptionType.connectionTimeout:
      exception = ApplicationError(
        "Sorry it's taking too long to communicate with the remote resources "
        'at the moment, please check your internet connection and try connecting again.',
        title: 'Unable to connect',
      );
    case DioExceptionType.sendTimeout:
      exception = ApplicationError(
        "Sorry it's taking too long to communicate with the remote resources "
        'at the moment, please check your internet connection and try connecting again.',
        title: 'Unable to connect',
      );
    case DioExceptionType.receiveTimeout:
      exception = ApplicationError(
        "Sorry it's taking too long to communicate with the remote resources "
        'at the moment, please check your internet connection and try connecting again.',
        title: 'Unable to connect',
      );
    case DioExceptionType.badResponse:
      log('Bad Response: ${error.response}');
      if (error.response != null) {
        String? message;

        if (error.response?.data is Map<String, dynamic>) {
          // pick the first value in the map if it's a String
          message = error.response?.data.values.firstWhere(
            (dynamic value) => value is String,
            orElse: () => 'Sorry app could not process your request',
          ) as String;
        } else if (error.response?.data is String) {
          message = error.response?.data as String;
        } else {
          message = 'Sorry app could not process your request';
        }

        try {
          exception = ApplicationError(
            message,
            title: 'Unable to process request',
          );
        } catch (_) {
          exception = ApplicationError(
            'Sorry app could not process your request',
            title: 'Unable to process request',
          );
        }
      } else {
        exception = ApplicationError(
          'Sorry app is unable to communicate with the remote resources at '
          'the moment, please check your internet connection 📡 and retry.',
          title: 'Unable to process request',
        );
      }

    case DioExceptionType.unknown:
      exception = ApplicationError(
        "Sorry it's taking too long to communicate with the remote resources "
        'at the moment, please check your internet connection and try connecting again.',
        title: 'Unable to connect',
      );
    case DioExceptionType.cancel:
      exception = ApplicationError(
        "Sorry it's taking too long to communicate with the remote resources "
        'at the moment, please check your internet connection and try connecting again.',
        title: 'Request was cancelled',
      );
    case DioExceptionType.badCertificate:
      exception = ApplicationError(
        "Sorry it's taking too long to communicate with the remote resources "
        'at the moment, please check your internet connection and try connecting again.',
        title: 'Unable to connect',
      );
    case DioExceptionType.connectionError:
      exception = ApplicationError(
        "Sorry it's taking too long to communicate with the remote resources "
        'at the moment, please check your internet connection and try connecting again.',
        title: 'Unable to connect',
      );
  }

  return exception;
}
