//
//  extensions
//  merlin_guest
//
//  Created by Ngonidzashe Mangudya on 25/7/2023.
//  Copyright (c) 2023 QuickMerlin
//

import 'package:flutter/material.dart';
import 'package:handy_extensions/handy_extensions.dart';

import '../configs/colors.dart';

extension ContextExtensions<T> on BuildContext {
  Future<T?> goTo({required Widget page}) => Navigator.of(this).push(
        MaterialPageRoute(builder: (_) => page),
      );

  Future<T?> goToAndReplace({required Widget page}) =>
      Navigator.of(this).pushReplacement(
        MaterialPageRoute(builder: (_) => page),
      );

  Future<T?> goToAndRemoveUntil({required Widget page}) =>
      Navigator.of(this).pushAndRemoveUntil(
        MaterialPageRoute(builder: (_) => page),
        (route) => false,
      );

  void goBack({dynamic value}) => Navigator.of(this).pop(value);

  // notify
  void notify(String message, {bool isError = false}) =>
      ScaffoldMessenger.of(this).showSnackBar(
        SnackBar(
          content: Text(
            message,
            style: const TextStyle(
              color: MerlinColors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
          duration: 3.seconds,
          backgroundColor: isError ? MerlinColors.red : MerlinColors.winterBlue,
        ),
      );
}
