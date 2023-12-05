//
//  merlin_guest
//  merlin_otp_text_field
//
//  Created by Ngonidzashe Mangudya on 09/11/2023.
//  Copyright (c) 2023 QuickMerlin
//

import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:relative_scale/relative_scale.dart';

import '../../configs/colors.dart';

class MerlinOTPTextField extends StatelessWidget {
  const MerlinOTPTextField({
    required this.controller,
    super.key,
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(
      builder: (context, height, width, sy, sx) {
        return Pinput(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          controller: controller,
          length: 6,
          defaultPinTheme: PinTheme(
            textStyle: TextStyle(
              color: MerlinColors.black,
              fontWeight: FontWeight.w700,
              fontSize: sy(10),
            ),
            padding: EdgeInsets.symmetric(
              vertical: sy(12),
              horizontal: sx(5),
            ),
            margin: EdgeInsets.symmetric(
              horizontal: sx(5),
            ),
            decoration: BoxDecoration(
              color: MerlinColors.blue.withOpacity(0.15),
              border: Border.all(
                color: MerlinColors.blue,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        );
      },
    );
  }
}
