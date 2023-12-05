//
//  x_hwindi
//  bookmarked_trip
//
//  Created by Ngonidzashe Mangudya on 05/12/2023.
//  Copyright (c) 2023 ModestNerds, Co
//

import 'package:flutter/material.dart';
import 'package:relative_scale/relative_scale.dart';

import '../../../core/configs/colors.dart';
import '../../../gen/assets.gen.dart';

class BookmarkedTrip extends StatelessWidget {
  const BookmarkedTrip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(
      builder: (context, height, width, sy, sx) {
        return Container(
          padding: EdgeInsets.symmetric(
            horizontal: sx(20),
            vertical: sy(10),
          ),
          decoration: BoxDecoration(
            color: HwindiColors.white,
            border: Border.all(
              color: HwindiColors.border,
              width: sy(2),
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  ImageIcon(
                    AssetImage(Assets.icons.location.path),
                    color: HwindiColors.black,
                    size: sy(10),
                  ),
                  SizedBox(
                    height: sy(23),
                  ),
                  ImageIcon(
                    AssetImage(Assets.icons.destination.path),
                    color: HwindiColors.black,
                    size: sy(10),
                  ),
                ],
              ),
              SizedBox(
                width: sx(10),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Start Location',
                          style: TextStyle(
                            color: HwindiColors.black.withOpacity(0.7),
                            fontWeight: FontWeight.w400,
                            fontSize: sy(7),
                          ),
                        ),
                        Text(
                          'Glenview 3, Harare',
                          style: TextStyle(
                            color: HwindiColors.black,
                            fontWeight: FontWeight.w700,
                            fontSize: sy(9),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: sy(10),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Destination',
                          style: TextStyle(
                            color: HwindiColors.black.withOpacity(0.7),
                            fontWeight: FontWeight.w400,
                            fontSize: sy(7),
                          ),
                        ),
                        Text(
                          'Kuwadzana 5 Extension',
                          style: TextStyle(
                            color: HwindiColors.black,
                            fontWeight: FontWeight.w700,
                            fontSize: sy(9),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.bookmark_border,
                color: HwindiColors.black,
                size: sy(15),
              ),
            ],
          ),
        );
      },
    );
  }
}
