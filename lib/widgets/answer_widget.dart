
import 'package:flutter/material.dart';

import '../styles/app_styles.dart';

class AnswerWidget extends StatefulWidget {
  final String answer;
  Color color;
  final void Function() onTap;
   AnswerWidget(
      {super.key,
      required this.answer,
      required this.color,
      required this.onTap});

  @override
  State<AnswerWidget> createState() => _AnswerWidgetState();
}

class _AnswerWidgetState extends State<AnswerWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        padding: const EdgeInsets.all(5),
        margin: const EdgeInsets.symmetric(vertical: 10),
        width: 280,
        height: 26,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: widget.color,
        ),
        child: Text(
          widget.answer,
          style: AppStyles.answerTextStyle,
        ),
      ),
    );
  }
}
