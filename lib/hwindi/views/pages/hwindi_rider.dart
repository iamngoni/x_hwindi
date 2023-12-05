//
//  x_hwindi
//  hwindi_rider
//
//  Created by Ngonidzashe Mangudya on 05/12/2023.
//  Copyright (c) 2023 ModestNerds, Co
//

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handy_extensions/handy_extensions.dart';
import 'package:relative_scale/relative_scale.dart';

import '../../../core/configs/colors.dart';
import '../../../core/state/navigation/navigation_bloc.dart';
import '../../../gen/assets.gen.dart';
import 'account.dart';
import 'bookmark.dart';
import 'home.dart';
import 'inbox.dart';
import 'trips.dart';

class HwindiRiderApp extends StatefulWidget {
  const HwindiRiderApp({super.key});

  @override
  State<HwindiRiderApp> createState() => _HwindiRiderAppState();
}

class _HwindiRiderAppState extends State<HwindiRiderApp> {
  final PageController pageController = PageController();

  final List<Widget> pages = [
    const HomePage(),
    const BookmarksPage(),
    const InboxPage(),
    const TripsPage(),
    const AccountPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(
      builder: (context, height, width, sy, sx) {
        return BlocConsumer<NavigationBloc, int>(
          listener: (context, state) {
            pageController.animateToPage(
              state,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
          },
          builder: (context, state) {
            return Scaffold(
              body: SafeArea(
                child: SizedBox(
                  height: context.height,
                  width: context.width,
                  child: PageView(
                    controller: pageController,
                    physics: const NeverScrollableScrollPhysics(),
                    children: pages,
                  ),
                ),
              ),
              bottomNavigationBar: Container(
                padding: EdgeInsets.symmetric(
                  vertical: sy(5),
                ),
                decoration: BoxDecoration(
                  color: HwindiColors.white,
                  border: Border(
                    top: BorderSide(
                      color: HwindiColors.border,
                      width: sy(1),
                    ),
                  ),
                ),
                child: BottomNavigationBar(
                  elevation: 0,
                  type: BottomNavigationBarType.fixed,
                  selectedLabelStyle: TextStyle(
                    color: HwindiColors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: sy(8),
                  ),
                  unselectedLabelStyle: TextStyle(
                    color: HwindiColors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: sy(8),
                  ),
                  selectedItemColor: HwindiColors.black,
                  unselectedItemColor: HwindiColors.black.withOpacity(0.7),
                  currentIndex: state,
                  items: [
                    BottomNavigationBarItem(
                      icon: ImageIcon(
                        AssetImage(Assets.icons.home.path),
                      ),
                      label: 'Home',
                    ),
                    BottomNavigationBarItem(
                      icon: ImageIcon(
                        AssetImage(Assets.icons.bookmark.path),
                      ),
                      label: 'Bookmarks',
                    ),
                    BottomNavigationBarItem(
                      icon: ImageIcon(
                        AssetImage(Assets.icons.messages.path),
                      ),
                      label: 'Inbox',
                    ),
                    BottomNavigationBarItem(
                      icon: ImageIcon(
                        AssetImage(Assets.icons.trips.path),
                      ),
                      label: 'Trips',
                    ),
                    BottomNavigationBarItem(
                      icon: ImageIcon(
                        AssetImage(Assets.icons.account.path),
                      ),
                      label: 'Account',
                    ),
                  ],
                  onTap: (index) {
                    context.read<NavigationBloc>().add(NavigationAction(index));
                  },
                ),
              ),
            );
          },
        );
      },
    );
  }
}
