import 'package:flutter/material.dart';

extension SizedboxExtention on double {
  SizedBox get height => SizedBox(
        height: this,
      );
  SizedBox get width => SizedBox(
        width: this,
      );
}

extension MediaQueryValues on BuildContext {
  double get mediaQueryHeight => MediaQuery.sizeOf(this).height;
  double get mediaQueryWidth => MediaQuery.sizeOf(this).width;
}
