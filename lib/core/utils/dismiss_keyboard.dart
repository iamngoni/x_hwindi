//
//  dismiss_keyboard
//  merlin_guest
//
//  Created by Ngonidzashe Mangudya on 25/7/2023.
//  Copyright (c) 2023 QuickMerlin
//

import 'package:flutter/material.dart';

void dismissKeyboard(BuildContext context) {
  if (MediaQuery.of(context).viewInsets.bottom > 0) {
    FocusScope.of(context).requestFocus(FocusNode());
  }
}
