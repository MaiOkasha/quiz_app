import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/constants.dart';
import 'package:quiz_app/controllers/question_controller.dart';
import 'package:flutter_svg/svg.dart';
import 'progress_bar.dart';
import 'question_card.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    QuestionController _questionController = Get.put(QuestionController());
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
            child: ProgressBar(),
          ),
          const SizedBox(height: kDefaultPadding),
          Padding(
            padding:
            const EdgeInsets.symmetric(horizontal: kDefaultPadding),
            child: Obx(
                  () => Text.rich(
                TextSpan(
                  text:
                  "Question ${_questionController.questionNumber.value}",
                  style:GoogleFonts.lato(
    textStyle:  Theme.of(context)
        .textTheme
        .headline4
        ?.copyWith(color: Colors.indigo),
    ),

                  children: [
                    TextSpan(
                      text: "/${_questionController.questions.length}",
                      style: Theme.of(context)
                          .textTheme
                          .headline5
                          ?.copyWith(color: Colors.indigo),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Divider(thickness: 1.5,
          color: Colors.indigo,
            endIndent: 20,
            indent: 20,
          ),
          const SizedBox(height: kDefaultPadding),
          Expanded(
            child: PageView.builder(
              // Block swipe to next qn
              physics: const NeverScrollableScrollPhysics(),
              controller: _questionController.pageController,
              onPageChanged: _questionController.updateTheQnNum,
              itemCount: _questionController.questions.length,
              itemBuilder: (context, index) => QuestionCard(
                  question: _questionController.questions[index]),
            ),
          ),
        ],
      ),
    );
  }
}
