//
//  x_hwindi
//  search_widget
//
//  Created by Ngonidzashe Mangudya on 05/12/2023.
//  Copyright (c) 2023 ModestNerds, Co
//

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:relative_scale/relative_scale.dart';

import '../../../core/configs/colors.dart';
import '../../../core/utils/extensions.dart';
import '../../../gen/assets.gen.dart';
import '../../state/hwindi/hwindi_bloc.dart';
import '../pages/hwindi_map.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(
      builder: (context, height, width, sy, sx) {
        return GestureDetector(
          onTap: () {
            context
              ..read<HwindiBloc>().add(
                const ResetBlocEvent(),
              )
              ..goTo(
                page: const HwindiMapPage(),
              );
          },
          child: Container(
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
        );
      },
    );
  }
}
