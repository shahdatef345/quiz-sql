import 'package:exam_app/models/question.dart';
import 'package:exam_app/widgets/answer_widget.dart';
import 'package:flutter/material.dart';

import '../styles/app_colors.dart';
import '../styles/app_styles.dart';

class QuestionBox extends StatefulWidget {
  static Map<int, String> userAnswers = {};
  final Question question;
  final String infoQuestions;
  final int idQuestiion;
  final void Function() onPressed;
  const QuestionBox({
    super.key,
    required this.question,
    required this.infoQuestions,
    required this.idQuestiion,
    required this.onPressed,
  });

  @override
  State<QuestionBox> createState() => _QuestionBoxState();
}

class _QuestionBoxState extends State<QuestionBox> {
  List<Color> colorItems = List.generate(4, (index) => AppColors.white);
  String errorMessage = "";

  void init() {
    errorMessage = "";
    colorItems = List.generate(4, (index) => AppColors.white);
    setState(() {});
  }

  void changeColors(int index) {
    if (colorItems[index] == AppColors.deepCrimson) {
      colorItems[index] = AppColors.white;
      setState(() {});
    } else if (colorItems[index] == AppColors.white) {
      for (int i = 0; i < colorItems.length; i++) {
        if (i == index) {
          colorItems[i] = AppColors.deepCrimson;
          setState(() {});
        } else {
          colorItems[i] = AppColors.white;
          setState(() {});
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 305,
      height: 335,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: AppColors.lightGreen),
      child: Column(
        children: [
          ListTile(
            contentPadding: const EdgeInsets.only(left: 0, bottom: 0),
            subtitle: Text(
              widget.question.question,
              style: AppStyles.questionTitleStayle,
            ),
            trailing: Text(
              widget.infoQuestions,
              style: AppStyles.completedQuestionNumberStayle,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 4,
              itemBuilder: (context, index) {
                return AnswerWidget(
                    answer: widget.question.answers[index],
                    color: colorItems[index],
                    onTap: () {
                      QuestionBox.userAnswers[widget.idQuestiion] =
                          widget.question.answers[index];
                      changeColors(index);
                    });
              },
            ),
          ),
          Text(
            errorMessage,
            style: AppStyles.errorMessageTextStyle,
          ),
          MaterialButton(
            color: AppColors.coolGray,
            onPressed: () {
              if (!colorItems.contains(AppColors.deepCrimson)) {
                errorMessage = "Choose answer first";
                setState(() {});
                return;
              }
              init();
              widget.onPressed();
            },
            child: const Text(
              "NEXT",
              style: AppStyles.nextButtonTextStyle,
            ),
          )
        ],
      ),
    );
  }
}
