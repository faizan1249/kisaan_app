import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kisaan_app/view_models/userVerificationViewModel.dart';
import 'package:kisaan_app/views/Home_Screen_View.dart';
import 'package:provider/provider.dart';

class UserVerification extends StatefulWidget {
  static String id = "user_verification";
  const UserVerification({super.key});

  @override
  State<UserVerification> createState() => _UserVerificationState();
}

class _UserVerificationState extends State<UserVerification> {
  bool isEmailVerified = false;
  Timer? timer;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      UserVerificationViewModel _viewModel =
          Provider.of<UserVerificationViewModel>(context, listen: false);
      _viewModel.isEmailVerified =
          FirebaseAuth.instance.currentUser!.emailVerified;
      if (!_viewModel.isEmailVerified) {
        _viewModel.sendEmailVerification();
        Fluttertoast.showToast(msg: "Email Verification Sent");
        timer = Timer.periodic(const Duration(seconds: 3),
            (_) => _viewModel.checkEmailVerified(timer!));
      }
      // setState(() {
      //   isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
      // });
    });
    // TODO: implement initState

    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    UserVerificationViewModel _viewModel =
        Provider.of<UserVerificationViewModel>(context);
    return _viewModel.isEmailVerified == true
        ? const HomeScreen()
        : Scaffold(
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  "An Email has been sent to your Email Address",
                  style: TextStyle(fontSize: 24, color: Colors.white),
                ),
              ],
            ),
          );
  }
}
