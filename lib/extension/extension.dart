import 'package:flutter/material.dart';

extension Ms on int {
  SizedBox get h => SizedBox(
        height: toDouble(),
      );
  SizedBox get w => SizedBox(
        width: toDouble(),
      );
}
