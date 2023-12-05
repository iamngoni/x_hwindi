//
//  merlin_guest
//  confirm_action_with_pin
//
//  Created by Ngonidzashe Mangudya on 08/08/2023.
//  Copyright (c) 2023 QuickMerlin
//

import 'package:flutter/material.dart';
import 'package:relative_scale/relative_scale.dart';

import '../configs/colors.dart';
import '../utils/extensions.dart';
import '../views/widgets/merlin_sensitive_text_field.dart';

Future<(String, bool)?> showConfirmActionWithPinDialog(
  String message, {
  required BuildContext context,
  String? title,
}) {
  final TextEditingController pinController = TextEditingController();
  return showDialog<(String, bool)>(
    context: context,
    builder: (context) => AlertDialog(
      backgroundColor: MerlinColors.lightBackground,
      title: title != null ? Text(title) : null,
      content: RelativeBuilder(
        builder: (context, height, width, sy, sx) {
          return SizedBox(
            height: sy(80),
            child: Column(
              children: [
                Text(message),
                MerlinSensitiveTextField(
                  controller: pinController,
                  hint: 'Enter PIN',
                  keyboardType: TextInputType.number,
                ),
              ],
            ),
          );
        },
      ),
      actions: [
        TextButton(
          onPressed: () => context.goBack(value: ('', false)),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () => context.goBack(value: (pinController.text, true)),
          child: const Text('Continue'),
        ),
      ],
    ),
  );
}
