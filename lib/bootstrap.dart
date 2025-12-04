import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handy_extensions/handy_extensions.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:x_hwindi/providers.dart';

import 'core/services/notifications.dart';
import 'core/services/storage.dart';
import 'core/utils/welcome.dart';
import 'injection.dart';

class AppBlocObserver extends BlocObserver {
  const AppBlocObserver();

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    log('onChange(${bloc.runtimeType}, $change)');
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    log('onError(${bloc.runtimeType}, $error, $stackTrace)');
    super.onError(bloc, error, stackTrace);
  }
}

Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);
  log('Setting preferred orientations ✅');

  configureInjection();

  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
    Sentry.captureException(details.exception, stackTrace: details.stack);
  };

  Bloc.observer = const AppBlocObserver();

  await getIt<PushNotifications>().init();

  if (getIt<StorageService>().getFromDisk('first_time') == null) {
    final String title = $welcomeTitles.randomItem();
    final String body = $welcomeBodies.randomItem();
    await getIt<PushNotifications>().showNotification(title, body);
    getIt<StorageService>().saveToDisk('first_time', true);
  }

  runApp(
    MultiBlocProvider(
      providers: providers,
      child: SentryScreenshotWidget(
        child: await builder(),
      ),
    ),
  );
}
