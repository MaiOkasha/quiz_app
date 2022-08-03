import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class OutBoardingContent extends StatelessWidget {
  const OutBoardingContent(
      {Key? key,
      required this.title,
      required this.subTitle,
      required this.image})
      : super(key: key);

  final String title;
  final String subTitle;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Lottie.asset(
          image,
        ),
        const SizedBox(
          height: 20,
        ),
        Text(title,
            style: GoogleFonts.lato(
              textStyle: const TextStyle(
                  color: Color(0xFF23203F),
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            )),
        const SizedBox(height: 10),
        Text(subTitle,
            textAlign: TextAlign.center,
            style: GoogleFonts.lato(
                textStyle: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 17,
                    fontWeight: FontWeight.w400))),
      ],
    );
  }
}
