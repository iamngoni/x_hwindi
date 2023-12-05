//
//  x_hwindi
//  welcome_app_bar
//
//  Created by Ngonidzashe Mangudya on 05/12/2023.
//  Copyright (c) 2023 ModestNerds, Co
//

import 'package:flutter/cupertino.dart';
import 'package:relative_scale/relative_scale.dart';

import '../../../core/configs/colors.dart';
import '../../../gen/assets.gen.dart';

class WelcomeAppBar extends StatelessWidget {
  const WelcomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(
      builder: (context, height, width, sy, sx) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  height: sy(25),
                  width: sy(25),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: HwindiColors.yellow.withOpacity(0.2),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    CupertinoIcons.line_horizontal_3,
                    color: HwindiColors.black,
                    size: sy(15),
                  ),
                ),
                SizedBox(
                  width: sx(10),
                ),
                Text(
                  'Welcome Ngonidzashe',
                  style: TextStyle(
                    color: HwindiColors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: sy(9),
                  ),
                ),
              ],
            ),
            Container(
              height: sy(25),
              width: sy(25),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage(Assets.images.me.path),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
