import 'package:flutter/material.dart';
import 'package:flash/flash.dart';

class AppFlash {
  static flashMessage(BuildContext context, String content) {
    showFlash(
      context: context,
      duration: Duration(milliseconds: 500),
      builder: (context, controller) {
        return Flash(
            position: FlashPosition.bottom,
            alignment: Alignment.bottomCenter,
            behavior: FlashBehavior.floating,
            boxShadows: kElevationToShadow[4],
            horizontalDismissDirection: HorizontalDismissDirection.horizontal,
            controller: controller,
            child: FlashBar(
              title: Text(""),
              content: Text(content),
            ));
      },
    );
  }
}
