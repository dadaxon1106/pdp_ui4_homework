import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pdp_ui4_homework/pages/home_page/home_page.dart';
import 'package:pdp_ui4_homework/pages/intro_page/widgets/item_intro_page.dart';
import 'package:pdp_ui4_homework/pages/strings/utils.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  late PageController _pageController;
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            PageView(
              onPageChanged: (int page) {
                setState(() {
                  currentIndex = page;
                });
              },
              controller: _pageController,
              children: [
                ItemIntro(
                    image: "assets/images/image_1.png",
                    title: Strings.stringOneTitle,
                    content: Strings.stringOneContent),
                ItemIntro(
                    image: "assets/images/image_2.png",
                    title: Strings.stringTwoTitle,
                    content: Strings.stringTwoContent),
                ItemIntro(
                    image: "assets/images/image_3.png",
                    title: Strings.stringThreeTitle,
                    content: Strings.stringThreeContent),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                margin: const EdgeInsets.only(bottom: 20),
                child: Stack(
                  alignment: Alignment.centerRight,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: _buildIndicators(),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(context,
                            CupertinoPageRoute(builder: (context) {
                          return HomePage();
                        }));
                      },
                      child: currentIndex == 0 || currentIndex == 1
                          ? const Text("")
                          : const Text(
                              "Skip",
                              style: TextStyle(
                                  fontSize: 20, color: Colors.pinkAccent),
                            ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _indicators(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 700),
      height: 6,
      width: isActive ? 30 : 6,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: Colors.red,
      ),
      curve: Curves.easeInCubic,
    );
  }

  List<Widget> _buildIndicators() {
    List<Widget> indicators = [];
    for (int i = 0; i < 3; i++) {
      if (currentIndex == i) {
        indicators.add(_indicators(true));
      } else {
        indicators.add(_indicators(false));
      }
    }
    return indicators;
  }
}
