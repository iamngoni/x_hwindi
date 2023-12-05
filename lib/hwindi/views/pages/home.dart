//
//  x_hwindi
//  home
//
//  Created by Ngonidzashe Mangudya on 05/12/2023.
//  Copyright (c) 2023 ModestNerds, Co
//

import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:handy_extensions/handy_extensions.dart';
import 'package:relative_scale/relative_scale.dart';

import '../../../core/configs/colors.dart';
import '../../../gen/assets.gen.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(
      builder: (context, height, width, sy, sx) {
        return Container(
          height: context.height,
          width: context.width,
          padding: EdgeInsets.symmetric(
            horizontal: sx(20),
            vertical: sy(10),
          ),
          child: ListView(
            children: [
              Row(
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
                  color: HwindiColors.white,
                  border: Border.all(
                    color: HwindiColors.border,
                    width: sy(2),
                  ),
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: HwindiColors.black.withOpacity(0.1),
                      blurRadius: 3,
                      offset: const Offset(0, 1),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    ImageIcon(
                      AssetImage(Assets.icons.search.path),
                      color: HwindiColors.black,
                      size: sy(15),
                    ),
                    SizedBox(
                      width: sx(20),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Where to?',
                            style: TextStyle(
                              color: HwindiColors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: sy(9),
                            ),
                          ),
                          Text(
                            'Add people or favourite locations',
                            style: TextStyle(
                              color: HwindiColors.black,
                              fontWeight: FontWeight.w400,
                              fontSize: sy(7),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: sx(20),
                    ),
                    Container(
                      height: sy(25),
                      width: sy(25),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: HwindiColors.yellow.withOpacity(0.2),
                        shape: BoxShape.circle,
                      ),
                      child: ImageIcon(
                        AssetImage(Assets.icons.settings.path),
                        color: HwindiColors.black,
                        size: sy(12),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: sy(7),
              ),
              SizedBox(
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
              ),
              SizedBox(
                height: sy(15),
              ),
              Container(
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
              ),
              SizedBox(
                height: sy(10),
              ),
              Container(
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
              ),
              SizedBox(
                height: sy(15),
              ),
              Text(
                'Available Options',
                style: TextStyle(
                  color: HwindiColors.black,
                  fontWeight: FontWeight.w700,
                  fontSize: sy(9),
                ),
              ),
              SizedBox(
                height: sy(10),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: sx(20),
                  vertical: sy(10),
                ),
                decoration: BoxDecoration(
                  color: HwindiColors.white,
                  border: Border.all(
                    color: HwindiColors.yellow,
                    width: sy(2),
                  ),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: HwindiColors.black.withOpacity(0.1),
                      blurRadius: 3,
                      offset: const Offset(0, 1),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Image(
                      image: AssetImage(Assets.images.carWhite.path),
                      height: sy(30),
                      width: sx(100),
                      fit: BoxFit.cover,
                    ),
                    SizedBox(
                      width: sx(20),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Hwindi Affordable',
                            style: TextStyle(
                              color: HwindiColors.black,
                              fontWeight: FontWeight.w700,
                              fontSize: sy(8),
                            ),
                          ),
                          Text(
                            '2019 Honda Civic 2.0T · White',
                            style: TextStyle(
                              color: HwindiColors.black.withOpacity(0.7),
                              fontWeight: FontWeight.w700,
                              fontSize: sy(7),
                            ),
                          ),
                          SizedBox(
                            height: sy(7),
                          ),
                          Text(
                            'ETA · 24 Mins',
                            style: TextStyle(
                              color: HwindiColors.black.withOpacity(0.7),
                              fontWeight: FontWeight.w700,
                              fontSize: sy(7),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      r'$5.00',
                      style: TextStyle(
                        color: HwindiColors.black,
                        fontWeight: FontWeight.w900,
                        fontSize: sy(10),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: sy(10),
              ),
              Container(
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
                  boxShadow: [
                    BoxShadow(
                      color: HwindiColors.black.withOpacity(0.1),
                      blurRadius: 3,
                      offset: const Offset(0, 1),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Image(
                      image: AssetImage(Assets.images.carWhite.path),
                      height: sy(30),
                      width: sx(100),
                      fit: BoxFit.cover,
                    ),
                    SizedBox(
                      width: sx(20),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Hwindi Premium',
                            style: TextStyle(
                              color: HwindiColors.black,
                              fontWeight: FontWeight.w700,
                              fontSize: sy(8),
                            ),
                          ),
                          Text(
                            '2023 Honda Civic 2.0T · White',
                            style: TextStyle(
                              color: HwindiColors.black.withOpacity(0.7),
                              fontWeight: FontWeight.w700,
                              fontSize: sy(7),
                            ),
                          ),
                          SizedBox(
                            height: sy(7),
                          ),
                          Text(
                            'ETA · 3 Mins',
                            style: TextStyle(
                              color: HwindiColors.black.withOpacity(0.7),
                              fontWeight: FontWeight.w700,
                              fontSize: sy(7),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      r'$8.00',
                      style: TextStyle(
                        color: HwindiColors.black,
                        fontWeight: FontWeight.w900,
                        fontSize: sy(10),
                      ),
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
