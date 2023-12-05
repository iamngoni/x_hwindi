//
//  merlin_text_field
//  merlin_guest
//
//  Created by Ngonidzashe Mangudya on 25/7/2023.
//  Copyright (c) 2023 QuickMerlin
//

import 'package:flutter/material.dart';
import 'package:relative_scale/relative_scale.dart';

import '../../configs/colors.dart';

class MerlinTextField extends StatelessWidget {
  const MerlinTextField({
    required this.controller,
    required this.hint,
    this.validator,
    this.keyboardType = TextInputType.text,
    this.readOnly = false,
    this.maxLines = 1,
    this.backgroundColor = MerlinColors.whiteBackground,
    this.borderColor = MerlinColors.border,
    this.borderRadius = 8,
    super.key,
  });

  final TextEditingController controller;
  final String hint;
  final String? Function(String?)? validator;
  final TextInputType keyboardType;
  final bool readOnly;
  final int maxLines;
  final Color backgroundColor;
  final Color? borderColor;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(
      builder: (context, height, width, sy, sx) {
        return Container(
          padding: EdgeInsets.symmetric(
            horizontal: sx(20),
            vertical: sy(3),
          ),
          decoration: BoxDecoration(
            color: backgroundColor,
            border: borderColor != null
                ? Border.all(
                    color: borderColor!,
                    width: sy(1),
                  )
                : null,
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          child: TextFormField(
            style: TextStyle(
              color: MerlinColors.black,
              fontWeight: FontWeight.w400,
              fontSize: sy(9),
            ),
            controller: controller,
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: TextStyle(
                color: MerlinColors.grey,
                fontWeight: FontWeight.w400,
                fontSize: sy(9),
              ),
              border: InputBorder.none,
            ),
            keyboardType: keyboardType,
            readOnly: readOnly,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: validator,
            maxLines: maxLines,
          ),
        );
      },
    );
  }
}
