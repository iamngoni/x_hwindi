//
//  merlin_guest
//  date_picker_controller
//
//  Created by Ngonidzashe Mangudya on 04/12/2023.
//  Copyright (c) 2023 ModestNerds, Co
//

import 'package:flutter/material.dart';

class DatePickerController extends ValueNotifier<DateTime?> {
  DatePickerController([super.value]);

  DateTime? get date => value;

  set date(DateTime? date) {
    value = date;
  }

  void clear() {
    value = null;
  }
}
