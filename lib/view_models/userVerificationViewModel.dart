import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserVerificationViewModel with ChangeNotifier {
  bool _isEmailVerified = false;

  bool get isEmailVerified => _isEmailVerified;
  late Function setStateHandler;

  set isEmailVerified(bool isEmailVerified) {
    _isEmailVerified = isEmailVerified;
    notifyListeners();
  }

  Future sendEmailVerification() async {
    final user = FirebaseAuth.instance.currentUser!;
    await user.sendEmailVerification();
  }

  Future checkEmailVerified(Timer timer) async {
    await FirebaseAuth.instance.currentUser!.reload();
    isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    if (isEmailVerified) timer.cancel();
  }
}
