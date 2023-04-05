import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kisaan_app/services/FirebaseService.dart';
import 'package:kisaan_app/services/locationService.dart';
import 'package:kisaan_app/view_models/customSplashViewModel.dart';
import 'package:kisaan_app/views/Home_Screen_View.dart';
import 'package:kisaan_app/views/P_Sign_In.dart';

class CustomSplashScreen extends StatefulWidget {
  const CustomSplashScreen({super.key});

  @override
  State<CustomSplashScreen> createState() => _CustomSplashScreenState();
}

class _CustomSplashScreenState extends State<CustomSplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    LocationService().initLocation();
    CustomSplashViewModel().getLocationPermission();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.80,
              height: MediaQuery.of(context).size.width * 0.60,
              child: SvgPicture.asset('assets/SVGs/wheat.svg'),
            ),
            AnimatedTextKit(
              animatedTexts: [
                TypewriterAnimatedText(
                  "Farmer's Market",
                  textAlign: TextAlign.center,
                  textStyle: TextStyle(fontSize: 21, fontFamily: 'times'),
                  speed: const Duration(milliseconds: 100),
                ),
              ],
              totalRepeatCount: 1,
              onFinished: (() {
                // User? user = FirebaseAuth.instance.currentUser;
                if (CustomSplashViewModel().checkUserLoggedIn()) {
                  Future.delayed(const Duration(microseconds: 50), () {
                    Navigator.pushReplacementNamed(context, HomeScreen.id);
                  });
                } else {
                  Future.delayed(const Duration(microseconds: 50), () {
                    Navigator.pushReplacementNamed(context, SignIn.id);
                  });
                }
              }),
            ),
          ],
        ),
      ),
    );
  }
}
