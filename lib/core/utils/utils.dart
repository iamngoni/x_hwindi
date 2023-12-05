//
//  merlin_guest
//  utils
//
//  Created by Ngonidzashe Mangudya on 27/11/2023.
//  Copyright (c) 2023 QuickMerlin
//

import 'dart:convert';
import 'dart:developer';

import '../configs/constants.dart';

String generateAppJWTToken() {
  final String base64EncodedString = base64.encode(utf8.encode('Guest'));
  final String base64EncodedSiteName =
      base64.encode(utf8.encode(MerlinConstants.siteName));
  final String jwtToken = '$base64EncodedString$base64EncodedSiteName';
  log('jwtToken: $jwtToken');
  return jwtToken;
}
