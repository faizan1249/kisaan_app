import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:kisaan_app/enums/enums.dart';
import 'package:kisaan_app/services/FirebaseService.dart';
import 'package:kisaan_app/views/Home_Screen_View.dart';
import 'package:kisaan_app/views/P_Sign_In.dart';
import 'package:kisaan_app/views/userVerificationView.dart';
import 'package:provider/provider.dart';

class AuthenticationViewModel with ChangeNotifier {
  bool _isLoginSuccess = false;
  bool _isRegisterSuccess = false;
  AppStatus? _appStatus;
  final FirebaseService _firebaseService = FirebaseService();

  set setIsLoginSucess(bool newVal) {
    _isLoginSuccess = newVal;
    notifyListeners();
  }

  bool get getIsLoginSuccess => _isLoginSuccess;

  set setIsRegisterSucess(bool newVal) {
    _isRegisterSuccess = newVal;
    notifyListeners();
  }

  bool get getIRegisterSuccess => _isLoginSuccess;

  set setAppStatus(AppStatus newAppStatus) {
    _appStatus = newAppStatus;
    notifyListeners();
  }

  AppStatus? get getAppStatus => _appStatus;

  Future<bool> registerNewUser(
      String Useremail, String Userpassword, String userFullName,
      {showLoading = true}) async {
    try {
      if (showLoading) {
        setAppStatus = AppStatus.LOADING;
      }
      try {
        final credential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: Useremail,
          password: Userpassword,
        );
        Map<String, dynamic> _data = {
          'FullName': userFullName,
          'email': Useremail,
          'password': Userpassword,
          'userID': credential.user!.uid,
        };
        bool isDataUpload = await _firebaseService.writeDatatoFirebase(_data);
        setAppStatus = AppStatus.IDLE;
        //setIsLoginSucess=true;
        setIsRegisterSucess = true;
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          print('The password provided is too weak.');
          setIsRegisterSucess = false;
          setAppStatus = AppStatus.IDLE;
        } else if (e.code == 'email-already-in-use') {
          print('The account already exists for that email.');
          setIsRegisterSucess = false;
          setAppStatus = AppStatus.IDLE;
        }
      } catch (e) {
        print(e);
      }
    } catch (e) {}
    return _isRegisterSuccess;

    //Sign In User
  }

  Future<bool> checkSignIn(String userEmail, String password,BuildContext context,
      {showLoading = true}) async {
    try {
      if (showLoading) {
        setAppStatus = AppStatus.LOADING;
      }
      bool isLoginSuccess = await _firebaseService.signIn(userEmail, password);
      if (isLoginSuccess) {
        setAppStatus = AppStatus.IDLE;
        setIsLoginSucess = true;
        Navigator.pushReplacementNamed(
            (context), UserVerification.id);
      }
    } catch (e) {}
    return getIsLoginSuccess;
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
    // notifyListeners();
    // return SignIn();
  }
}
