import 'package:exam_app/widgets/custom_box.dart';
import 'package:flutter/material.dart';

import '../styles/app_colors.dart';
import '../styles/app_styles.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final arg = ModalRoute.of(context)?.settings.arguments as Map;
    final String name = arg["name"];
    final int correctAnswers = arg["right_answers"];
    final int numberOfQuestions = arg["number_of_questions"];
    return Material(
      color: AppColors.coolGray,
      child: Center(
        child: CustomBox(headerMessage: "CONGRATULATIONS!!!!", children: [
          Text(
            "hello $name your score is\n\n$correctAnswers/$numberOfQuestions",
            textAlign: TextAlign.center,
            style: AppStyles.customBoxMessageTextStyle,
          ),
          const SizedBox(
            height: 15,
          ),
          MaterialButton(
            color: AppColors.lightGreen,
            minWidth: 120,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
            ),
            onPressed: () {
              Navigator.pushReplacementNamed(context, "/");
            },
            child: const Text(
              "FINSH",
              style: AppStyles.customBoxButtonTextStyle,
            ),
          )
        ]),
      ),
    );
  }
}
