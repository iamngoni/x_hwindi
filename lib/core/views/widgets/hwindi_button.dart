//
//  x_hwindi
//  hwindi_button
//
//  Created by Ngonidzashe Mangudya on 05/12/2023.
//  Copyright (c) 2023 ModestNerds, Co
//

import 'package:flutter/material.dart';
import 'package:relative_scale/relative_scale.dart';

import '../../configs/colors.dart';

class HwindiButton extends StatelessWidget {
  const HwindiButton({
    required this.text,
    this.onTap,
    this.color = HwindiColors.white,
    this.backgroundColor = HwindiColors.yellow,
    this.borderRadius = 12,
    this.verticalPadding = 8,
    this.fontFamily,
    this.fontSize = 10,
    this.fontWeight = FontWeight.w500,
    super.key,
  });

  final String text;
  final VoidCallback? onTap;
  final Color color;
  final Color backgroundColor;
  final double borderRadius;
  final double verticalPadding;
  final String? fontFamily;
  final double fontSize;
  final FontWeight fontWeight;

  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(
      builder: (context, height, width, sy, sx) {
        return GestureDetector(
          onTap: onTap,
          child: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(
              horizontal: sx(20),
              vertical: sy(verticalPadding),
            ),
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(borderRadius),
            ),
            child: Text(
              text,
              style: TextStyle(
                color: color,
                fontWeight: fontWeight,
                fontSize: sy(fontSize),
                fontFamily: fontFamily,
              ),
            ),
          ),
        );
      },
    );
  }
}
