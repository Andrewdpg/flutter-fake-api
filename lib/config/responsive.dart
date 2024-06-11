import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  final Widget mobile;
  final Widget desktop;

  const Responsive({
    super.key,
    required this.mobile,
    required this.desktop,
  });

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 790;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 790;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= 790) {
          return desktop;
        } else {
          return mobile;
        }
      },
    );
  }
}
