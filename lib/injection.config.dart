// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:x_hwindi/core/services/network.dart' as _i6;
import 'package:x_hwindi/core/services/notifications.dart' as _i7;
import 'package:x_hwindi/core/services/secure_storage.dart' as _i8;
import 'package:x_hwindi/core/services/storage.dart' as _i9;
import 'package:x_hwindi/core/state/connectivity_status/connectivity_status_bloc.dart'
    as _i3;
import 'package:x_hwindi/core/state/locale/locale_bloc.dart' as _i4;
import 'package:x_hwindi/core/state/navigation/navigation_bloc.dart' as _i5;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i3.ConnectivityStatusBloc>(() => _i3.ConnectivityStatusBloc());
    gh.factory<_i4.LocaleBloc>(() => _i4.LocaleBloc());
    gh.factory<_i5.NavigationBloc>(() => _i5.NavigationBloc());
    gh.lazySingletonAsync<_i6.NetworkService>(
        () => _i6.NetworkService.getInstance());
    gh.singleton<_i7.PushNotifications>(_i7.PushNotifications());
    gh.singletonAsync<_i8.SecureStorageService>(
        () => _i8.SecureStorageService.getInstance());
    gh.singletonAsync<_i9.StorageService>(
        () => _i9.StorageService.getInstance());
    return this;
  }
}
