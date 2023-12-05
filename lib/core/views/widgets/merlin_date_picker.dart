//
//  merlin_guest
//  merlin_date_picker
//
//  Created by Ngonidzashe Mangudya on 04/12/2023.
//  Copyright (c) 2023 ModestNerds, Co
//

import 'package:flutter/material.dart';
import 'package:handy_extensions/handy_extensions.dart';
import 'package:relative_scale/relative_scale.dart';

import '../../configs/colors.dart';
import 'date_picker_controller.dart';

class MerlinDatePicker extends StatelessWidget {
  const MerlinDatePicker({
    required this.hint,
    required this.controller,
    this.validator,
    super.key,
  });

  final String hint;
  final String? Function(DateTime?)? validator;
  final DatePickerController controller;

  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(
      builder: (context, height, width, sy, sx) {
        return FormField<DateTime>(
          initialValue: controller.value,
          validator: validator,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          builder: (FormFieldState<DateTime> state) {
            return Container(
              padding: EdgeInsets.symmetric(
                horizontal: sx(20),
                vertical: sy(10),
              ),
              decoration: BoxDecoration(
                color: MerlinColors.whiteBackground,
                border: Border.all(
                  color: MerlinColors.border,
                  width: sy(1),
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          controller.value != null
                              ? controller.value!.readableDate
                              : hint,
                          style: TextStyle(
                            color: controller.value != null
                                ? MerlinColors.black
                                : MerlinColors.grey,
                            fontWeight: FontWeight.w400,
                            fontSize: sy(9),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: sx(10),
                      ),
                      InkWell(
                        onTap: () async {
                          final DateTime? date = await showDatePicker(
                            context: context,
                            initialDate: controller.value ?? DateTime.now(),
                            firstDate: DateTime(1900),
                            lastDate: DateTime.now(),
                          );
                          if (date != null) {
                            controller.value = date;
                            state.didChange(date);
                          }
                        },
                        child: Icon(
                          Icons.calendar_month,
                          color: MerlinColors.grey,
                          size: sy(15),
                        ),
                      ),
                    ],
                  ),
                  AnimatedSwitcher(
                    duration: 300.milliseconds,
                    child: state.hasError
                        ? Padding(
                            padding: EdgeInsets.only(
                              top: sy(5),
                            ),
                            child: Text(
                              state.errorText!,
                              style: TextStyle(
                                color: const Color(0xFFB00020),
                                fontWeight: FontWeight.w400,
                                fontSize: sy(7),
                              ),
                            ),
                          )
                        : const SizedBox.shrink(),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
