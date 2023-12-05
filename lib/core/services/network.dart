//
//  merlin_guest
//  network
//
//  Created by Ngonidzashe Mangudya on 3/8/2023.
//  Copyright (c) 2023 QuickMerlin
//

import 'package:injectable/injectable.dart';
import 'package:network_info_plus/network_info_plus.dart';

@LazySingleton()
class NetworkService {
  static NetworkService? _instance;
  static NetworkInfo? _networkInfo;

  @factoryMethod
  static Future<NetworkService> getInstance() async {
    _instance ??= NetworkService();

    _networkInfo ??= NetworkInfo();

    return _instance!;
  }

  Future<String> getIpAddress() async {
    final String? ipAddress = await _networkInfo?.getWifiIP();
    return ipAddress ?? '';
  }
}
