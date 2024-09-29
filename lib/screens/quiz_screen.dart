import "package:exam_app/models/question.dart";
import "package:exam_app/styles/app_styles.dart";
import "package:exam_app/widgets/avatar_image.dart";
import "package:exam_app/widgets/question_box.dart";
import "package:flutter/material.dart";

import "../styles/app_colors.dart";

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  final List<Question> questions = [
    const Question(
        question: " The World Largest desert is ? ",
        answers: ["Thar", "Kalahari", "Sahara", "Sonoran"],
        rightAnswer: "Sahara"),
    const Question(
        question: "The metal whose salts are sensitive to light is ? ",
        answers: ["Zinc", "Silver", "Copper", "Aluminium"],
        rightAnswer: "Silver"),
    const Question(
        question: "The Central Rice Research Station is situated in ?",
        answers: [
          "Programming Language",
          "JDk",
          "Open Source Software",
          "None of the above"
        ],
        rightAnswer: "None of the above")
  ];
  int qustionNumber = 0;
  int rightAnswers = 0;
  @override
  Widget build(BuildContext context) {
    final name = ModalRoute.of(context)?.settings.arguments as String;
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.coolGray,
        title: const Text(
          "Quiz",
          style: AppStyles.appBarTitleTextStyle,
        ),
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const AvatarImage(),
            QuestionBox(
              idQuestiion: qustionNumber,
              question: questions[qustionNumber],
              infoQuestions: "${qustionNumber + 1}/${questions.length}",
              onPressed: () {
                if (qustionNumber == questions.length - 1) {
                  for (Question q in questions) {
                    if (q.rightAnswer ==
                        QuestionBox.userAnswers[questions.indexOf(q)]) {
                      rightAnswers++;
                      setState(() {});
                    }
                  }
                  Navigator.pushReplacementNamed(context, "result_screen",
                      arguments: {
                        "name": name,
                        "right_answers": rightAnswers,
                        "number_of_questions": questions.length
                      });
                } else {
                  qustionNumber++;
                  setState(() {});
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
