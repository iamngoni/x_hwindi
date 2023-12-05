//
//  merlin_guest
//  merlin_outline_text_field
//
//  Created by Ngonidzashe Mangudya on 08/11/2023.
//  Copyright (c) 2023 QuickMerlin
//

import 'package:flutter/material.dart';
import 'package:relative_scale/relative_scale.dart';

import '../../configs/colors.dart';

class MerlinOutlineTextField extends StatelessWidget {
  const MerlinOutlineTextField({
    required this.controller,
    required this.hint,
    this.validator,
    this.keyboardType = TextInputType.text,
    this.readOnly = false,
    this.maxLines = 1,
    this.borderColor = MerlinColors.black,
    this.fontFamily,
    super.key,
  });

  final TextEditingController controller;
  final String hint;
  final String? Function(String?)? validator;
  final TextInputType keyboardType;
  final bool readOnly;
  final int maxLines;
  final Color? borderColor;
  final String? fontFamily;

  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(
      builder: (context, height, width, sy, sx) {
        return Container(
          padding: EdgeInsets.symmetric(
            vertical: sy(3),
          ),
          decoration: BoxDecoration(
            border: borderColor != null
                ? Border(
                    bottom: BorderSide(
                      color: borderColor!,
                    ),
                  )
                : null,
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
                color: MerlinColors.black.withOpacity(0.6),
                fontWeight: FontWeight.w400,
                fontSize: sy(9),
                fontFamily: fontFamily,
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
