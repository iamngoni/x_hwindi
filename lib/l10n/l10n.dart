import 'package:flutter/widgets.dart';
import 'package:x_hwindi/l10n/generated/app_localizations.dart';

export 'package:x_hwindi/l10n/generated/app_localizations.dart';

extension AppLocalizationsX on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this);
}
