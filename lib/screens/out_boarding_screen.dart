import 'package:flutter/material.dart';
import 'package:quiz_app/widgets/out_boarding_content.dart';
import 'package:quiz_app/widgets/out_boarding_indicator.dart';

class OutBoardingScreen extends StatefulWidget {
  const OutBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OutBoardingScreen> createState() => _OutBoardingScreenState();
}

class _OutBoardingScreenState extends State<OutBoardingScreen> {
  late PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Align(
              alignment: AlignmentDirectional.topEnd,
              child: Visibility(
                visible: _currentPage < 2,
                child: TextButton(
                  onPressed: () {
                    _pageController.animateToPage(2,
                        duration: const Duration(seconds: 1),
                        curve: Curves.easeInCirc);
                  },
                  child: const Text(
                    'SKIP',
                    style: TextStyle(
                        color: Colors.indigoAccent,
                        fontWeight: FontWeight.w600,
                        fontSize: 18),
                  ),
                ),
                replacement: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/login_screen');
                  },
                  child: const Text(
                    'START',
                    style: TextStyle(
                        color: Colors.indigoAccent,
                        fontWeight: FontWeight.w600,
                        fontSize: 18),
                  ),
                ),
              ),
            ),
            Expanded(
                flex: 3,
                child: PageView(
                  controller: _pageController,
                  scrollDirection: Axis.horizontal,
                  onPageChanged: (int page) {
                    setState(() {
                      _currentPage = page;
                    });
                  },
                  children: const [
                    OutBoardingContent(
                        title: 'Welcome!',
                        subTitle:
                            'Before a question is ask ,weannounce \n the time of is its publishing with a . ',
                        image: 'images/81107-welcome.json'),
                    OutBoardingContent(
                        title: 'Solve Questions ',
                        subTitle:
                            'The Question is publised liveand lefi \n open for a specific amount of time.',
                        image: 'images/112900-checklist.json'),
                    OutBoardingContent(
                        title: 'Hit a High Score',
                        subTitle:
                            'The right answer is publish and the \n winner\'s name is announced . ',
                        image: 'images/111843-winner.json')
                  ],
                )),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OutBoardingIndicator(
                  marginEnd: 14,
                  selected: _currentPage == 0,
                ),
                OutBoardingIndicator(
                  marginEnd: 14,
                  selected: _currentPage == 1,
                ),
                OutBoardingIndicator(
                  selected: _currentPage == 2,
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Visibility(
                  visible: _currentPage != 0,
                  maintainAnimation: true,
                  maintainSize: true,
                  maintainState: true,
                  child: IconButton(
                    onPressed: () {
                      _pageController.previousPage(
                          duration: Duration(seconds: 1),
                          curve: Curves.easeInCirc);
                    },
                    icon: Icon(
                      Icons.arrow_back_ios_rounded,
                      color: Colors.indigoAccent,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    _pageController.nextPage(
                        duration: Duration(seconds: 1),
                        curve: Curves.easeInCirc);
                  },
                  icon: Icon(Icons.arrow_forward_ios_rounded),
                  color:
                      _currentPage == 2 ? Colors.indigoAccent : Colors.indigo,
                )
              ],
            ),
            const SizedBox(height: 20),
            Visibility(
              visible: _currentPage == 2,
              maintainAnimation: true,
              maintainState: true,
              maintainSize: true,
              child: ElevatedButton(
                onPressed: () =>
                    Navigator.pushReplacementNamed(context, '/login_screen'),
                child: Text(
                  'Get Started',
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.normal),
                ),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(300, 40),
                  primary: Colors.indigoAccent,
                ),
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
