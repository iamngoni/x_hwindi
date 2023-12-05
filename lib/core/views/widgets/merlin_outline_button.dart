//
//  merlin_guest
//  merlin_outline_button
//
//  Created by Ngonidzashe Mangudya on 29/08/2023.
//  Copyright (c) 2023 QuickMerlin
//

import 'package:flutter/material.dart';
import 'package:relative_scale/relative_scale.dart';

import '../../configs/colors.dart';

class MerlinOutlineButton extends StatelessWidget {
  const MerlinOutlineButton({
    required this.text,
    this.onTap,
    this.color = MerlinColors.winterBlue,
    this.backgroundColor = MerlinColors.white,
    this.borderRadius = 20,
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
              border: Border.all(
                color: color,
              ),
              borderRadius: BorderRadius.circular(borderRadius),
            ),
            child: Text(
              text,
              style: TextStyle(
                color: color,
                fontWeight: FontWeight.w500,
                fontSize: sy(10),
              ),
            ),
          ),
        );
      },
    );
  }
}
