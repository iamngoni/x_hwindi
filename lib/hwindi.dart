//
//  x_hwindi
//  hwindi
//
//  Created by Ngonidzashe Mangudya on 05/12/2023.
//  Copyright (c) 2023 ModestNerds, Co
//

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/configs/colors.dart';
import 'core/models/data/language.dart';
import 'core/state/connectivity_status/connectivity_status_bloc.dart';
import 'core/state/locale/locale_bloc.dart';
import 'core/utils/dismiss_keyboard.dart';
import 'core/views/widgets/device_offline_page.dart';
import 'core/views/widgets/loader_widget.dart';
import 'hwindi/views/pages/hwindi_rider.dart';
import 'l10n/l10n.dart';

class HwindiApp extends StatelessWidget {
  const HwindiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocaleBloc, Language>(
      builder: (context, state) {
        return MaterialApp(
          title: 'Merlin Guest',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: HwindiColors.materialYellow,
            scaffoldBackgroundColor: HwindiColors.white,
            fontFamily: 'Inter',
            appBarTheme: const AppBarTheme(
              color: HwindiColors.white,
              elevation: 0,
              iconTheme: IconThemeData(
                color: HwindiColors.black,
              ),
            ),
            bottomNavigationBarTheme: const BottomNavigationBarThemeData(
              backgroundColor: HwindiColors.white,
            ),
          ),
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          locale: Locale(state.code),
          builder: (context, child) {
            return GestureDetector(
              onTap: () => dismissKeyboard(context),
              child: child,
            );
          },
          home: BlocBuilder<ConnectivityStatusBloc, ConnectivityStatusState>(
            builder: (context, state) {
              if (state is Idle) {
                return const ColoredBox(
                  color: HwindiColors.white,
                  child: Center(
                    child: LoaderWidget(),
                  ),
                );
              }

              if (state is Idle) {
                return const DeviceOfflinePage();
              }

              if (state is Connected) {
                return const HwindiRiderApp();
              }

              return const SizedBox.shrink();
            },
          ),
        );
      },
    );
  }
}
