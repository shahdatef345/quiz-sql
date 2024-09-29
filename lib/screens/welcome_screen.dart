import "package:exam_app/styles/app_colors.dart";
import "package:exam_app/styles/app_styles.dart";
import "package:exam_app/widgets/avatar_image.dart";
import "package:exam_app/widgets/entry_box.dart";
import "package:flutter/material.dart";

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Material(
      color: AppColors.coolGray,
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "QUIZ",
              style: AppStyles.quizWordStayle,
            ),
            SizedBox(
              height: 15,
            ),
            AvatarImage(),
            SizedBox(
              height: 40,
            ),
            EntryBox(),
          ],
        ),
      ),
    );
  }
}
