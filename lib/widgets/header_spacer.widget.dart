import 'package:flutter/material.dart';

class HeaderSpacer extends StatelessWidget {
  const HeaderSpacer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(height: 20);
  }
}

enum WidgetSpacerType { small, medium, large, xLarge }

class WidgetSpacer extends StatelessWidget {
  final WidgetSpacerType type;
  const WidgetSpacer({this.type = WidgetSpacerType.small, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double space = 0;
    switch (type) {
      case WidgetSpacerType.small:
        space = 12;
        break;
      case WidgetSpacerType.medium:
        space = 16;
        break;
      case WidgetSpacerType.large:
        space = 32;
        break;
      case WidgetSpacerType.xLarge:
        space = 48;
        break;
    }
    return SizedBox(height: space);
  }
}
