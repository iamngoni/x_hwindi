//
//  x_hwindi
//  home
//
//  Created by Ngonidzashe Mangudya on 05/12/2023.
//  Copyright (c) 2023 ModestNerds, Co
//

import 'package:flutter/material.dart';
import 'package:handy_extensions/handy_extensions.dart';
import 'package:relative_scale/relative_scale.dart';

import '../../../core/configs/colors.dart';
import '../../../gen/assets.gen.dart';
import '../widgets/bookmarked_trip.dart';
import '../widgets/filters_list_view.dart';
import '../widgets/hwindi_ride_sharing_ad.dart';
import '../widgets/search_widget.dart';
import '../widgets/welcome_app_bar.dart';

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
              const WelcomeAppBar(),
              SizedBox(
                height: sy(15),
              ),
              const SearchWidget(),
              SizedBox(
                height: sy(7),
              ),
              const FiltersListView(),
              SizedBox(
                height: sy(15),
              ),
              const HwindiRideSharingAd(),
              SizedBox(
                height: sy(10),
              ),
              const BookmarkedTrip(),
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
