import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';

class FirebaseService {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  User? user = FirebaseAuth.instance.currentUser;
  bool isDataSet = false;
  bool _isLoginSuccess = false;
//To Write Data to Firestore
  Future<bool> writeDatatoFirebase(Map<String, dynamic> data) async {
    _firebaseFirestore.collection('Users').doc(data['userID']).set(data).then((value) {
      isDataSet = true;
    }).catchError((error) => print("Failed to add user: $error"));
    return isDataSet;
  }

  //Sign In User Functionality

  Future<bool> signIn(String email, String password) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      _isLoginSuccess = true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
        Fluttertoast.showToast(msg: "No user found for that email.");
        _isLoginSuccess = false;
      } else if (e.code == 'wrong-password') {
        Fluttertoast.showToast(msg: "Wrong password provided for that user.");
        _isLoginSuccess = false;
        print('Wrong password provided for that user.');
      }
    }
    return _isLoginSuccess;
  }
}
