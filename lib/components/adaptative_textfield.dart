import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class AdaptativeTextField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType keyBoardType;
  final Function(String) onSubmitted;
  final String label;

  AdaptativeTextField({
    this.controller,
    this.keyBoardType = TextInputType.text,
    this.onSubmitted,
    this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? Padding(
            padding: EdgeInsets.only(
              bottom: 10.0,
            ),
            child: CupertinoTextField(
              controller: controller,
              keyboardType: keyBoardType,
              placeholder: label,
              padding: EdgeInsets.symmetric(
                horizontal: 6,
                vertical: 12,
              ),
            ),
          )
        : TextField(
            keyboardType: keyBoardType,
            controller: controller,
            onSubmitted: onSubmitted,
            decoration: InputDecoration(
              labelText: label,
            ),
          );
  }
}
