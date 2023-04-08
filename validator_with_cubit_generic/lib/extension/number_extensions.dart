import 'package:flutter/material.dart';

extension NumberExtension on num {
  /// Creates an empty SizedBox with height as the given number.
  ///
  SizedBox get heightSizedBox => SizedBox(height: toDouble());

  /// Creates an empty SizedBox with width as the given number.
  ///
  SizedBox get widthSizedBox => SizedBox(width: toDouble());
}