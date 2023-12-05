//
//  merlin_guest
//  merlin_dropdown_outline_button
//
//  Created by Ngonidzashe Mangudya on 29/08/2023.
//  Copyright (c) 2023 QuickMerlin
//

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:handy_extensions/handy_extensions.dart';
import 'package:relative_scale/relative_scale.dart';

import '../../configs/colors.dart';

class MerlinDropdownOutlineButton<T> extends StatelessWidget {
  const MerlinDropdownOutlineButton({
    required this.label,
    required this.hint,
    required this.items,
    required this.onChanged,
    this.value,
    this.validator,
    this.borderRadius = 0,
    super.key,
  });

  final T? value;
  final List<T> items;
  final String label;
  final String hint;
  final String? Function(T?)? validator;
  final void Function(T?) onChanged;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(
      builder: (context, height, width, sy, sx) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: TextStyle(
                color: MerlinColors.black,
                fontWeight: FontWeight.w400,
                fontSize: sy(10),
              ),
            ),
            SizedBox(
              height: sy(5),
            ),
            Container(
              width: context.width,
              padding: EdgeInsets.symmetric(
                horizontal: sx(20),
                vertical: sy(3),
              ),
              decoration: BoxDecoration(
                border: Border.all(
                  color: MerlinColors.grey,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(borderRadius),
              ),
              child: DropdownButtonFormField<T>(
                isExpanded: true,
                value: value,
                decoration: InputDecoration(
                  hintText: hint,
                  hintStyle: TextStyle(
                    color: MerlinColors.grey,
                    fontWeight: FontWeight.w400,
                    fontSize: sy(9),
                  ),
                  border: InputBorder.none,
                ),
                items: items.map((T e) {
                  return DropdownMenuItem<T>(
                    value: e,
                    child: Text(
                      e.toString(),
                      style: TextStyle(
                        color: MerlinColors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: sy(9),
                      ),
                    ),
                  );
                }).toList(),
                onChanged: onChanged,
                selectedItemBuilder: (BuildContext context) {
                  return items.map<Widget>((T item) {
                    return Text(
                      item.toString(),
                      style: TextStyle(
                        color: MerlinColors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: sy(9),
                      ),
                    );
                  }).toList();
                },
                icon: Icon(
                  CupertinoIcons.chevron_down,
                  color: MerlinColors.black,
                  size: sy(12),
                ),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: validator,
              ),
            ),
          ],
        );
      },
    );
  }
}
