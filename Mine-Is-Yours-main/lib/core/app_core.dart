import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mus_app/routes/routes.dart';

import '../components/custom_icon.dart';
import '../helpers/app_text_styles.dart';
import 'app_notification.dart';

abstract class AppCore{
  static showSnackBar({required AppNotification notification}) {
    Timer(Duration(milliseconds: 400), () {
      RouterGenerator.scaffoldState.currentState!.showSnackBar(
        SnackBar(
          behavior: notification.isFloating
              ? SnackBarBehavior.floating
              : SnackBarBehavior.fixed,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(notification.radius),
              side: BorderSide(width: 1, color: notification.borderColor)),
          margin: notification.isFloating ? EdgeInsets.all(24) : null,
          content: SizedBox(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  if (notification.iconName != null)
                    customImageIconSVG(
                        imageName: notification.iconName, color: Colors.white),
                  if (notification.iconName != null) SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      notification.message,
                      style: AppTextStyles.w600.copyWith(fontSize: 13),
                    ),
                  ),
                ],
              ),
            ),
          ),
          backgroundColor: notification.backgroundColor,
        ),
      );
    });
  }
}