//
//  x_hwindi
//  filters_list_view
//
//  Created by Ngonidzashe Mangudya on 05/12/2023.
//  Copyright (c) 2023 ModestNerds, Co
//

import 'package:flutter/cupertino.dart';
import 'package:handy_extensions/handy_extensions.dart';
import 'package:relative_scale/relative_scale.dart';

import '../../../core/configs/colors.dart';
import '../../../gen/assets.gen.dart';

class FiltersListView extends StatelessWidget {
  const FiltersListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(
      builder: (context, height, width, sy, sx) {
        return SizedBox(
          height: sy(20),
          width: context.width,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: sx(10),
                  vertical: sy(2),
                ),
                decoration: BoxDecoration(
                  color: HwindiColors.border.withOpacity(0.3),
                  border: Border.all(
                    color: HwindiColors.border,
                    width: sy(1),
                  ),
                  borderRadius: BorderRadius.circular(7),
                ),
                child: Row(
                  children: [
                    Icon(
                      CupertinoIcons.sort_down,
                      color: HwindiColors.black.withOpacity(0.8),
                      size: sy(13),
                    ),
                    SizedBox(
                      width: sx(5),
                    ),
                    Text(
                      'Sort',
                      style: TextStyle(
                        color: HwindiColors.black.withOpacity(0.8),
                        fontWeight: FontWeight.w600,
                        fontSize: sy(9),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: sx(20),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: sx(10),
                  vertical: sy(2),
                ),
                decoration: BoxDecoration(
                  color: HwindiColors.border.withOpacity(0.3),
                  border: Border.all(
                    color: HwindiColors.border,
                    width: sy(1),
                  ),
                  borderRadius: BorderRadius.circular(7),
                ),
                child: Row(
                  children: [
                    ImageIcon(
                      AssetImage(Assets.icons.distance.path),
                      color: HwindiColors.black.withOpacity(0.8),
                      size: sy(12),
                    ),
                    SizedBox(
                      width: sx(10),
                    ),
                    Text(
                      'Distance Away',
                      style: TextStyle(
                        color: HwindiColors.black.withOpacity(0.8),
                        fontWeight: FontWeight.w600,
                        fontSize: sy(9),
                      ),
                    ),
                    SizedBox(
                      width: sx(10),
                    ),
                    Icon(
                      CupertinoIcons.chevron_down,
                      color: HwindiColors.black.withOpacity(0.8),
                      size: sy(12),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: sx(20),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: sx(10),
                  vertical: sy(2),
                ),
                decoration: BoxDecoration(
                  color: HwindiColors.border.withOpacity(0.3),
                  border: Border.all(
                    color: HwindiColors.border,
                    width: sy(1),
                  ),
                  borderRadius: BorderRadius.circular(7),
                ),
                child: Row(
                  children: [
                    ImageIcon(
                      AssetImage(Assets.icons.trips.path),
                      color: HwindiColors.black.withOpacity(0.8),
                      size: sy(12),
                    ),
                    SizedBox(
                      width: sx(10),
                    ),
                    Text(
                      'Activity',
                      style: TextStyle(
                        color: HwindiColors.black.withOpacity(0.8),
                        fontWeight: FontWeight.w600,
                        fontSize: sy(9),
                      ),
                    ),
                    SizedBox(
                      width: sx(10),
                    ),
                    Icon(
                      CupertinoIcons.chevron_down,
                      color: HwindiColors.black.withOpacity(0.8),
                      size: sy(12),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
