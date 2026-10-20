import 'package:flutter/cupertino.dart';

class SizeProvider extends InheritedWidget{
  final Size designSize;
  final double deviceWidth;
  final double deviceHeight;

  const SizeProvider({
    super.key,
    required this.designSize,
    required this.deviceWidth,
    required this.deviceHeight,
    required super.child,
  });

  // return the already exist sizeProvider not create new one
  static SizeProvider of(BuildContext context) {

    //dependOnInheritedWidgetOfExactType --> record the widgets depends on the size
    // provider to rebuild when there is changes
    return context.dependOnInheritedWidgetOfExactType<SizeProvider>()!;
  }


  // should update the provider or not
  @override
  bool updateShouldNotify(SizeProvider oldWidget) {
    return deviceWidth != oldWidget.deviceWidth ||
        deviceHeight != oldWidget.deviceHeight ||
        designSize != oldWidget.designSize;
  }
}