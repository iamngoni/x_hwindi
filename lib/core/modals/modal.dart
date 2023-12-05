//
//  x_hwindi
//  modal
//
//  Created by Ngonidzashe Mangudya on 05/12/2023.
//  Copyright (c) 2023 ModestNerds, Co
//

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:handy_extensions/handy_extensions.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../configs/colors.dart';

dynamic $showModal(
  BuildContext context, {
  Widget? child,
  double? maxHeight,
}) async {
  if (Platform.isIOS) {
    await _showCupertinoModal(context, child: child, maxHeight: maxHeight);
  } else {
    await _showMaterialModal(context, child: child, maxHeight: maxHeight);
  }
}

SizedBox _buildSizedBox(
  BuildContext context,
  Widget? child,
  double? maxHeight,
) {
  return SizedBox(
    width: context.width,
    height: maxHeight ?? context.height,
    child: child,
  );
}

Future<void> _showMaterialModal(
  BuildContext context, {
  Widget? child,
  double? maxHeight,
}) async {
  return showMaterialModalBottomSheet(
    context: context,
    barrierColor: HwindiColors.yellow.withOpacity(0.2),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(20),
      ),
    ),
    builder: (context) {
      return _buildSizedBox(context, child, maxHeight);
    },
  );
}

Future<void> _showCupertinoModal(
  BuildContext context, {
  Widget? child,
  double? maxHeight,
}) async {
  return showCupertinoModalBottomSheet(
    context: context,
    topRadius: const Radius.circular(20),
    barrierColor: HwindiColors.yellow.withOpacity(0.2),
    builder: (context) {
      return Material(
        child: _buildSizedBox(
          context,
          child,
          maxHeight,
        ),
      );
    },
  );
}
