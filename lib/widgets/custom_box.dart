import 'package:flutter/material.dart';

import '../styles/app_colors.dart';
import '../styles/app_styles.dart';

class CustomBox extends StatelessWidget {
  final String headerMessage;
  final List<Widget> children;
  const CustomBox(
      {super.key, required this.headerMessage, required this.children});

  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.center, children: [
      Container(
        width: 306,
        height: 210,
        padding: const EdgeInsets.only(top: 10),
        decoration: BoxDecoration(
            color: AppColors.coolGray, borderRadius: BorderRadius.circular(10)),
        child: Container(
          decoration: BoxDecoration(
              color: AppColors.pastelGreenGray,
              borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: children,
            ),
          ),
        ),
      ),
      Positioned(
        top: 0,
        child: Container(
          width: 170,
          height: 25,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColors.lightGreen),
          child: Text(headerMessage,
              textAlign: TextAlign.center, style: AppStyles.welcomeWordStayle),
        ),
      ),
    ]);
  }
}
