import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/screens/quiz/quiz_screen.dart';

import '../../constants.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
          child: ListView(

            children: [
              Image.asset('images/6343845.jpg',
              ),
              //const Spacer(flex: 2),
              Text('Let\'s Play Quiz,',
                  style: GoogleFonts.cairo(
                    textStyle: const TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.bold
                    )
                  )
                 ),
              const Text("Enter your informations below",
                  style: TextStyle(
                      color: Colors.grey, fontWeight: FontWeight.w500)),
              const SizedBox(
                height: 40,
              ),
               TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey[300],
                  hintText: "Full Name",

                  suffixIcon: Icon(Icons.perm_identity,
                  color: Colors.black,
                  ),
                  hintStyle: TextStyle(color: Colors.black),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.all(Radius.circular(12),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 80,
              ),
              InkWell(
                onTap: () => Get.to(const QuizScreen()),
                child: Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(kDefaultPadding * 0.75),
                  // 15
                  decoration: const BoxDecoration(
                    gradient: kPrimaryGradient,
                    borderRadius: BorderRadius.all(Radius.circular(12),

                    ),
                  ),
                  child: Text(
                    "Lets Start Quiz",
                    style: Theme.of(context)
                        .textTheme
                        .button
                        ?.copyWith(color: Colors.white,
                    fontWeight: FontWeight.bold,
                      fontSize: 18,

                    ),
                  ),
                ),
              ),
              const Spacer(
                flex: 2,
              )
            ],
          ),
        ),
      ),
    );
  }
}
