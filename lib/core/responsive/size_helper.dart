import 'dart:math';
import 'package:flowery_e_commerce/core/responsive/size_provider.dart';
import 'package:flutter/material.dart';

extension SizeHelperExtension on BuildContext {

  bool get isLandscape =>
      MediaQuery.of(this).orientation == Orientation.landscape;

  double get screenWidth =>
      MediaQuery.of(this).size.width;

  double get screenHeight =>
      MediaQuery.of(this).size.height;

  SizeProvider get sizeProvider =>
      SizeProvider.of(this);

  double get designWidth =>
      sizeProvider.designSize.width;

  double get designHeight =>
      sizeProvider.designSize.height;

  double get scaleWidth =>
      sizeProvider.deviceWidth / designWidth;

  double get scaleHeight =>
      sizeProvider.deviceHeight / designHeight;

  double setWidth(num width) {
    return width * scaleWidth;
  }

  double setHeight(num height) {
    return height * scaleHeight;
  }

  double setSp(num fontSize) {
    return fontSize * min(scaleWidth, scaleHeight);
  }

  double setRadius(num radius) {
    return radius * min(scaleWidth, scaleHeight);
  }

  double setMinSize(num size) {
    return size * min(scaleWidth, scaleHeight);
  }
}