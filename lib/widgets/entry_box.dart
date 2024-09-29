import 'package:exam_app/styles/app_styles.dart';
import 'package:exam_app/widgets/custom_box.dart';
import 'package:flutter/material.dart';

import '../styles/app_colors.dart';

class EntryBox extends StatefulWidget {
  const EntryBox({super.key});

  @override
  State<EntryBox> createState() => _EntryBoxState();
}

class _EntryBoxState extends State<EntryBox> {
  final TextEditingController nameController = TextEditingController();
  String errorMessage = "";

  @override
  Widget build(BuildContext context) {
    return CustomBox(
      headerMessage: "Welcome",
      children: [
        const Text(
          "Please Enter Your Name",
          style: AppStyles.customBoxMessageTextStyle,
        ),
        const SizedBox(
          height: 5,
        ),
        SizedBox(
          width: 232,
          height: 45,
          child: TextField(
            controller: nameController,
            decoration: InputDecoration(
              filled: true,
              fillColor: AppColors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            style: AppStyles.textFieldStyle,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(errorMessage, style: AppStyles.errorMessageTextStyle),
        MaterialButton(
          color: AppColors.lightGreen,
          onPressed: () {
            if (nameController.text.trim().isEmpty) {
              errorMessage = "Name is required";
              setState(() {});
              return;
            }
            if (!RegExp(r"^[a-zA-Z\s]+$")
                .hasMatch(nameController.text.trim())) {
              errorMessage = "Name allows only alphabet characters";
              setState(() {});
              return;
            }
            setState(() {
              errorMessage = "";
            });
            Navigator.pushReplacementNamed(context, "quiz_screen",
                arguments: nameController.text.trim().toLowerCase());
          },
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
          child: const Text("SUBMIT"),
        )
      ],
    );
  }
}
