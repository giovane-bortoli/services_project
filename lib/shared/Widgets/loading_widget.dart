import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:progress_indicators/progress_indicators.dart';
import 'package:services_project/shared/utils/app_colors.dart';

class LoadingOverlay {
  static final loading = JumpingDotsProgressIndicator(
    milliseconds: 2000,
    color: AppColors.neutralColorHightPure,
    fontSize: 40,
  );
}
