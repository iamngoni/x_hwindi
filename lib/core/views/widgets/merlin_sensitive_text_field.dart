//
//  merlin_sensitive_text_field
//  merlin_guest
//
//  Created by Ngonidzashe Mangudya on 25/7/2023.
//  Copyright (c) 2023 QuickMerlin
//

import 'package:flutter/material.dart';
import 'package:relative_scale/relative_scale.dart';

import '../../configs/colors.dart';

class MerlinSensitiveTextField extends StatefulWidget {
  const MerlinSensitiveTextField({
    required this.controller,
    required this.hint,
    this.readOnly = false,
    this.validator,
    this.keyboardType = TextInputType.text,
    this.backgroundColor = MerlinColors.whiteBackground,
    this.borderColor = MerlinColors.border,
    this.borderRadius = 8,
    super.key,
  });

  final TextEditingController controller;
  final String hint;
  final String? Function(String?)? validator;
  final bool readOnly;
  final TextInputType keyboardType;
  final Color backgroundColor;
  final Color? borderColor;
  final double borderRadius;

  @override
  State<MerlinSensitiveTextField> createState() =>
      _MerlinSensitiveTextFieldState();
}

class _MerlinSensitiveTextFieldState extends State<MerlinSensitiveTextField> {
  bool obscureText = true;

  void toggleObscureText() {
    setState(() {
      obscureText = !obscureText;
    });
  }

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
            color: widget.backgroundColor,
            border: widget.borderColor != null
                ? Border.all(
                    color: widget.borderColor!,
                    width: sy(1),
                  )
                : null,
            borderRadius: BorderRadius.circular(widget.borderRadius),
          ),
          child: TextFormField(
            controller: widget.controller,
            style: TextStyle(
              color: MerlinColors.black,
              fontWeight: FontWeight.w400,
              fontSize: sy(9),
            ),
            decoration: InputDecoration(
              hintText: widget.hint,
              hintStyle: TextStyle(
                color: MerlinColors.grey,
                fontWeight: FontWeight.w400,
                fontSize: sy(9),
              ),
              border: InputBorder.none,
              suffixIcon: IconButton(
                onPressed: toggleObscureText,
                icon: Icon(
                  obscureText ? Icons.visibility : Icons.visibility_off,
                  color: MerlinColors.grey,
                ),
              ),
            ),
            obscureText: widget.readOnly || obscureText,
            keyboardType: widget.keyboardType,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: widget.validator,
            readOnly: widget.readOnly,
          ),
        );
      },
    );
  }
}
