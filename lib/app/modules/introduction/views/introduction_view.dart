import 'package:chatify/app/modules/introduction/widgets/navigator_button.dart';
import 'package:chatify/app/routes/app_pages.dart';
import 'package:chatify/app/utils/color_list.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:lottie/lottie.dart';

import '../controllers/introduction_controller.dart';

class IntroductionView extends GetView<IntroductionController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroductionScreen(
        pages: [
          PageViewModel(
            titleWidget: Text(
              'Introducing Chatify.',
              style: GoogleFonts.poppins(
                  textStyle:
                      TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
            ),
            bodyWidget: Text(
              "Welcome to Chatify, your new destination for seamless and engaging conversations! We're thrilled to have you on board. With Chatify, you'll experience a whole new level of communication, designed to make your chats more enjoyable and productive.",
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(
                  textStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey)),
            ),
            image: Container(
              width: 250,
              height: 250,
              child: Center(
                child: Lottie.asset('assets/lottie/login.json'),
              ),
            ),
          ),
          PageViewModel(
            titleWidget: Text(
              'Experience Messaging Excellence',
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                  textStyle:
                      TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
            ),
            bodyWidget: Text(
              "Welcome to a new era of messaging, where your conversations take the spotlight, and communication reaches unprecedented heights. Get ready to unleash the incredible potential of our platform.",
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(
                  textStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey)),
            ),
            image: Container(
              width: 250,
              height: 250,
              child: Center(
                child: Lottie.asset('assets/lottie/intro-1.json'),
              ),
            ),
          ),
          PageViewModel(
            titleWidget: Text(
              'Unleash the Power of Messaging',
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                  textStyle:
                      TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
            ),
            bodyWidget: Text(
              "Step into a messaging experience that's unlike any other, where every conversation is a masterpiece and communication becomes an art form. Prepare to unlock the full potential of this platform.",
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(
                  textStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey)),
            ),
            image: ListView(
              children: [
                SizedBox(
                  height: 50,
                ),
                Container(
                  width: 300,
                  height: 300,
                  child: Center(
                    child: Lottie.asset('assets/lottie/intro-2.json'),
                  ),
                ),
              ],
            ),
          )
        ],
        showSkipButton: true,
        skip: Text(
          'Skip',
          style: GoogleFonts.inter(
              textStyle:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.grey)),
        ),
        next: NavigatorButton(label: 'Next'),
        done: NavigatorButton(label: 'Done'),
        onDone: () => Get.offAllNamed(Routes.LOGIN),
        dotsDecorator: DotsDecorator(
          size: const Size.square(10.0),
          activeSize: const Size(20.0, 10.0),
          activeColor: ColorList.primaryColor,
          color: Colors.black26,
          spacing: const EdgeInsets.symmetric(horizontal: 3.0),
          activeShape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
        ),
      ),
    );
  }
}
