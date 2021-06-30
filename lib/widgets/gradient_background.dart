import 'package:cable_vasool/config/app_colors.dart';
import 'package:flutter/material.dart';

class GradientBackground extends StatelessWidget {
  const GradientBackground({Key? key, required this.children})
      : super(key: key);

  final Widget children;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(gradient: AppColors.scaffoldBgGradient),
        ),
        SafeArea(
          top: true,
          bottom: true,
          child: Container(
              width: double.infinity,
              height: double.infinity,
              child: children),
        )
      ],
    );
  }
}
