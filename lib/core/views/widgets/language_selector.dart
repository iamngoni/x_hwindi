//
//  merlin_guest
//  language_selector
//
//  Created by Ngonidzashe Mangudya on 23/10/2023.
//  Copyright (c) 2023 QuickMerlin
//

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handy_extensions/handy_extensions.dart';
import 'package:relative_scale/relative_scale.dart';

import '../../configs/colors.dart';
import '../../models/data/language.dart';
import '../../state/locale/locale_bloc.dart';

class LanguageSelector extends StatefulWidget {
  const LanguageSelector({
    this.iconColor = MerlinColors.winterBlue,
    this.textColor = MerlinColors.winterBlue,
    this.backgroundColor = MerlinColors.white,
    this.isOnAppBar = false,
    super.key,
  });

  final Color iconColor;
  final Color textColor;
  final Color backgroundColor;
  final bool isOnAppBar;

  @override
  State<LanguageSelector> createState() => _LanguageSelectorState();
}

class _LanguageSelectorState extends State<LanguageSelector> {
  final GlobalKey _popupMenuKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(
      builder: (context, height, width, sy, sx) {
        return BlocBuilder<LocaleBloc, Language>(
          builder: (context, state) {
            return Stack(
              alignment: Alignment.center,
              clipBehavior: Clip.none,
              children: [
                PopupMenuButton(
                  key: _popupMenuKey,
                  itemBuilder: (context) {
                    return Language.values.map((l) {
                      return PopupMenuItem(
                        value: l,
                        child: Row(
                          children: [
                            Expanded(
                              child: Row(
                                children: [
                                  Text(
                                    l.countryCode.countryEmoji,
                                    style: TextStyle(
                                      fontSize: sy(10),
                                    ),
                                  ),
                                  Text(
                                    l.name,
                                    style: TextStyle(
                                      fontSize: sy(10),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            if (l == state)
                              Icon(
                                Icons.check,
                                color: MerlinColors.winterBlue,
                                size: sy(10),
                              ),
                          ],
                        ),
                        onTap: () {
                          context.read<LocaleBloc>().add(SwitchLocale(l));
                        },
                      );
                    }).toList();
                  },
                  child: Icon(
                    Icons.language,
                    size: sy(17),
                    color: widget.iconColor,
                  ),
                ),
                Positioned(
                  top: widget.isOnAppBar ? sy(5) : sy(0),
                  right: -sx(10),
                  child: InkWell(
                    onTap: () {
                      (_popupMenuKey.currentState!
                              as PopupMenuButtonState<Language>)
                          .showButtonMenu();
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: sx(5),
                      ),
                      decoration: BoxDecoration(
                        color: widget.backgroundColor,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Text(
                        state.code.toUpperCase(),
                        style: TextStyle(
                          color: widget.textColor,
                          fontWeight: FontWeight.w700,
                          fontSize: sy(7),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
