//
//  x_hwindi
//  hwindi_floating_back_button
//
//  Created by Ngonidzashe Mangudya on 05/12/2023.
//  Copyright (c) 2023 ModestNerds, Co
//

import 'package:flutter/material.dart';
import 'package:relative_scale/relative_scale.dart';

import '../../../core/configs/colors.dart';
import '../../../core/utils/extensions.dart';

class HwindiFloatingBackButton extends StatelessWidget {
  const HwindiFloatingBackButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(
      builder: (context, height, width, sy, sx) {
        return GestureDetector(
          onTap: () => context.goBack(),
          child: Container(
            height: sy(30),
            width: sy(30),
            decoration: BoxDecoration(
              color: HwindiColors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: HwindiColors.white.withOpacity(0.1),
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            alignment: Alignment.center,
            child: Icon(
              Icons.arrow_back_rounded,
              color: HwindiColors.black,
              size: sy(15),
            ),
          ),
        );
      },
    );
  }
}
