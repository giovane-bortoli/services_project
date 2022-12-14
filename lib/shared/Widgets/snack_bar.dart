import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:services_project/shared/utils/app_colors.dart';

class CustomSnackBar {
  static Flushbar successSnackBar(context, {required String message}) =>
      Flushbar(
        flushbarStyle: FlushbarStyle.FLOATING,
        margin: const EdgeInsets.all(8),
        borderRadius: BorderRadius.circular(8),
        boxShadows: const [
          BoxShadow(
              color: AppColors.neutralColorHightDark,
              offset: Offset(0.0, 3.0),
              blurRadius: 2.0)
        ],
        backgroundColor: Colors.white,
        message: message,
        messageColor: AppColors.neutralColorLowDark,
        icon: const Icon(
          Icons.check_circle,
          size: 28.0,
          color: AppColors.successColor,
        ),
        duration: const Duration(seconds: 4),
        leftBarIndicatorColor: AppColors.successColor,
      )..show(context);

  static Flushbar errorSnackBar(context, {required String message}) => Flushbar(
        flushbarStyle: FlushbarStyle.FLOATING,
        margin: const EdgeInsets.all(8),
        boxShadows: const [
          BoxShadow(
              color: AppColors.neutralColorHightDark,
              offset: Offset(0.0, 3.0),
              blurRadius: 2.0)
        ],
        borderRadius: BorderRadius.circular(8),
        backgroundColor: Colors.white,
        message: message,
        messageColor: AppColors.neutralColorLowDark,
        icon: const Icon(
          Icons.close_outlined,
          size: 28.0,
          color: AppColors.errorColor,
        ),
        duration: const Duration(seconds: 4),
        leftBarIndicatorColor: AppColors.errorColor,
      )..show(context);
}
