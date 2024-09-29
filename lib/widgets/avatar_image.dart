import 'package:exam_app/styles/app_colors.dart';
import 'package:flutter/material.dart';

class AvatarImage extends StatelessWidget {
  const AvatarImage({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 100,
      backgroundColor: AppColors.white,
      child: Image.asset("assets/images/Ellipse_1.png"),
    );
  }
}
