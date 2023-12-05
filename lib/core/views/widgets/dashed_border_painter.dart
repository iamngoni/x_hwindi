//
//  merlin_guest
//  dashed_border_painter
//
//  Created by Ngonidzashe Mangudya on 29/11/2023.
//  Copyright (c) 2023 ModestNerds, Co
//

import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../../configs/colors.dart';

class DashedBorderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = MerlinColors.black
      ..strokeWidth = 1;

    const int dashCount = 20;
    final double dashWidth = 2 * math.pi * size.width / 2 / dashCount;

    for (int i = 0; i < dashCount; i++) {
      final double x1 = math.cos(2 * math.pi / dashCount * i) * size.width / 2 +
          size.width / 2;
      final double y1 =
          math.sin(2 * math.pi / dashCount * i) * size.height / 2 +
              size.height / 2;
      final double x2 =
          math.cos(2 * math.pi / dashCount * (i + 0.5)) * size.width / 2 +
              size.width / 2;
      final double y2 =
          math.sin(2 * math.pi / dashCount * (i + 0.5)) * size.height / 2 +
              size.height / 2;
      canvas.drawLine(Offset(x1, y1), Offset(x2, y2), paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
