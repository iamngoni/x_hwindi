//
//  merlin_dropdown_button
//  merlin_guest
//
//  Created by Ngonidzashe Mangudya on 25/7/2023.
//  Copyright (c) 2023 QuickMerlin
//

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:handy_extensions/handy_extensions.dart';
import 'package:relative_scale/relative_scale.dart';

import '../../configs/colors.dart';

class MerlinDropdownButton<T> extends StatelessWidget {
  const MerlinDropdownButton({
    required this.hint,
    required this.items,
    required this.onChanged,
    this.value,
    this.validator,
    this.backgroundColor = MerlinColors.whiteBackground,
    this.borderColor = MerlinColors.border,
    this.borderRadius = 8,
    super.key,
  });

  final T? value;
  final List<T> items;
  final String hint;
  final String? Function(T?)? validator;
  final void Function(T?) onChanged;
  final Color backgroundColor;
  final Color? borderColor;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(
      builder: (context, height, width, sy, sx) {
        return Container(
          width: context.width,
          padding: EdgeInsets.symmetric(
            horizontal: sx(20),
            vertical: sy(3),
          ),
          decoration: BoxDecoration(
            color: backgroundColor,
            border: borderColor != null
                ? Border.all(
                    color: borderColor!,
                    width: sy(1),
                  )
                : null,
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
              color: MerlinColors.grey,
              size: sy(12),
            ),
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: validator,
          ),
        );
      },
    );
  }
}
