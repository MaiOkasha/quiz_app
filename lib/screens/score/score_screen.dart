import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:quiz_app/controllers/question_controller.dart';

class ScoreScreen extends StatelessWidget {
  final QuestionController _qnController = Get.put(QuestionController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigoAccent,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(flex: 3),
          Center(
            child: Text(
              "Score",
              style: Theme.of(context)
                  .textTheme
                  .headline3
                  ?.copyWith(color: Colors.white),
            ),
          ),
          const Spacer(),
          Text(
            "${_qnController.correctAns * 10}/${_qnController.questions.length * 10}",
            style: Theme.of(context)
                .textTheme
                .headline4
                ?.copyWith(color: Colors.white),
          ),
          const Spacer(flex: 3),
        ],
      ),
    );
  }
}
