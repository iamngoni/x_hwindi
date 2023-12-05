//
//  x_hwindi
//  hwindi_ride_sharing_ad
//
//  Created by Ngonidzashe Mangudya on 05/12/2023.
//  Copyright (c) 2023 ModestNerds, Co
//

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:handy_extensions/handy_extensions.dart';
import 'package:relative_scale/relative_scale.dart';

import '../../../core/configs/colors.dart';
import '../../../gen/assets.gen.dart';

class HwindiRideSharingAd extends StatelessWidget {
  const HwindiRideSharingAd({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(
      builder: (context, height, width, sy, sx) {
        return Container(
          width: context.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              image: AssetImage(Assets.images.car.path),
              fit: BoxFit.cover,
            ),
            boxShadow: [
              BoxShadow(
                color: HwindiColors.black.withOpacity(0.1),
                blurRadius: 3,
                offset: const Offset(0, 1),
              ),
            ],
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 0.5,
              sigmaY: 0.5,
            ),
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: sx(30),
                vertical: sy(15),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: LinearGradient(
                  colors: [
                    HwindiColors.black.withOpacity(0.9),
                    HwindiColors.black.withOpacity(0.65),
                    HwindiColors.black.withOpacity(0.2),
                  ],
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Get Instant\nReward Bonuses',
                    style: TextStyle(
                      color: HwindiColors.white,
                      fontWeight: FontWeight.w900,
                      fontSize: sy(12),
                      height: 1.2,
                    ),
                  ),
                  SizedBox(
                    height: sy(5),
                  ),
                  Text(
                    'Get a little bit more cash in your\npockets and maybe meet a few cool people\nalong the way',
                    style: TextStyle(
                      color: HwindiColors.white.withOpacity(0.7),
                      fontWeight: FontWeight.w500,
                      fontSize: sy(8),
                      height: 1,
                    ),
                  ),
                  SizedBox(
                    height: sy(15),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: sx(20),
                      vertical: sy(5),
                    ),
                    decoration: BoxDecoration(
                      color: HwindiColors.yellow,
                      borderRadius: BorderRadius.circular(7),
                      boxShadow: [
                        BoxShadow(
                          color: HwindiColors.black.withOpacity(0.1),
                          blurRadius: 3,
                          offset: const Offset(0, 1),
                        ),
                      ],
                    ),
                    child: Text(
                      'Get ridesharing',
                      style: TextStyle(
                        color: HwindiColors.black,
                        fontWeight: FontWeight.w700,
                        fontSize: sy(8),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
