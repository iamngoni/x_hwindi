//
//  merlin_guest
//  drawer_button
//
//  Created by Ngonidzashe Mangudya on 23/11/2023.
//  Copyright (c) 2023 QuickMerlin
//

import 'package:flutter/material.dart';
import 'package:relative_scale/relative_scale.dart';

class MerlinDrawerButton extends StatelessWidget {
  const MerlinDrawerButton({
    required this.scaffoldKey,
    super.key,
  });

  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(
      builder: (context, height, width, sy, sx) {
        return IconButton(
          onPressed: () {
            scaffoldKey.currentState?.openDrawer();
          },
          icon: Icon(
            Icons.menu,
            size: sy(20),
          ),
        );
      },
    );
  }
}
