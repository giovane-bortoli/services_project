import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:services_project/shared/theme/font_theme.dart';
import 'package:services_project/shared/utils/app_files.dart';

class EmptyStateView extends StatelessWidget {
  const EmptyStateView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: content(context),
    );
  }

  Widget content(context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            AppImages.emptyState,
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width * 25,
            height: MediaQuery.of(context).size.height * 25,
          ),
          Text(
            'Nenhuma moeda Listada!',
            style: CustomTextTheme.textTheme.subtitle2,
          )
        ],
      ),
    );
  }
}
