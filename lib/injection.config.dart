// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:x_hwindi/core/services/network.dart' as _i8;
import 'package:x_hwindi/core/services/notifications.dart' as _i9;
import 'package:x_hwindi/core/services/secure_storage.dart' as _i10;
import 'package:x_hwindi/core/services/storage.dart' as _i11;
import 'package:x_hwindi/core/state/connectivity_status/connectivity_status_bloc.dart'
    as _i3;
import 'package:x_hwindi/core/state/locale/locale_bloc.dart' as _i4;
import 'package:x_hwindi/core/state/navigation/navigation_bloc.dart' as _i7;
import 'package:x_hwindi/hwindi/models/repos/abs/locations_repository.dart'
    as _i5;
import 'package:x_hwindi/hwindi/models/repos/impl/native_locations_repository.dart'
    as _i6;
import 'package:x_hwindi/hwindi/state/hwindi/hwindi_bloc.dart' as _i12;

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
    gh.lazySingleton<_i5.LocationsRepository>(
        () => _i6.NativeLocationsRepository());
    gh.factory<_i7.NavigationBloc>(() => _i7.NavigationBloc());
    gh.lazySingletonAsync<_i8.NetworkService>(
        () => _i8.NetworkService.getInstance());
    gh.singleton<_i9.PushNotifications>(_i9.PushNotifications());
    gh.singletonAsync<_i10.SecureStorageService>(
        () => _i10.SecureStorageService.getInstance());
    gh.singletonAsync<_i11.StorageService>(
        () => _i11.StorageService.getInstance());
    gh.factory<_i12.HwindiBloc>(
        () => _i12.HwindiBloc(repository: gh<_i5.LocationsRepository>()));
    return this;
  }
}
