import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kisaan_app/services/FirebaseService.dart';
import 'package:kisaan_app/view_models/AuthViewModel.dart';
import 'package:kisaan_app/views/Home_Screen_View.dart';
import 'package:kisaan_app/views/P_SignUp.dart';
import 'package:kisaan_app/views/userVerificationView.dart';
import 'package:provider/provider.dart';

class SignIn extends StatelessWidget {
  static const String id = 'signin';
  TextEditingController loginEmailController = TextEditingController();
  TextEditingController loginPasswordController = TextEditingController();

  SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    AuthenticationViewModel AuthviewModel =
        Provider.of<AuthenticationViewModel>(context);
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            child: Container(
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(0))),
                        width: MediaQuery.of(context).size.width * 0.35,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black),
                          onPressed: () {
                            print("Sign Up");
                            Navigator.pushNamed(context, SignUp.id);
                          },
                          child: const Text(
                            "Sign Up",
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.09),
                      width: MediaQuery.of(context).size.width * 0.80,
                      height: MediaQuery.of(context).size.width * 0.60,
                      child: SvgPicture.asset('assets/SVGs/wheat.svg')),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Farmer's Market",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16, fontFamily: 'times'),
                  ),
                  // Container(
                  //   child: Column(
                  //     children: <Widget>[
                  //       // CustomTextField(
                  //       //   obsecureVal: false,
                  //       //   hintTxt: "example@abc.com",
                  //       //   fieldFillColor: textFieldFillColor,
                  //       //   prefixIcon: Icons.mail,
                  //       //   onChanged: (value)
                  //       //   {
                  //       //     print(value);
                  //       //   },
                  //       // ),
                  //       SizedBox(
                  //         height: 20,
                  //       ),
                  //       // CustomTextField(
                  //       //   obsecureVal: true,
                  //       //   hintTxt: "●●●●●●●●●",
                  //       //   fieldFillColor: textFieldFillColor,
                  //       //   prefixIcon: Icons.security,
                  //       //   onChanged: (value)
                  //       //   {
                  //       //     print(value);
                  //       //   },
                  //       // ),
                  //     ],
                  //   ),
                  // ),

                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        TextFormField(
                          controller: loginEmailController,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                style: BorderStyle.solid,
                                color: Colors.black,
                              )),
                              focusedBorder: OutlineInputBorder(),
                              hintText: "Enter Email"),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller: loginPasswordController,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                style: BorderStyle.solid,
                                color: Colors.black,
                              )),
                              focusedBorder: OutlineInputBorder(),
                              hintText: "Enter Password"),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Text(
                              "Forgot Password",
                              style: TextStyle(
                                color: Colors.black.withOpacity(0.4),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(0))),
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black),
                      onPressed: () async {
                        String email =
                            loginEmailController.value.text.toString().trim();
                        String password = loginPasswordController.value.text
                            .toString()
                            .trim();
                        if (FirebaseAuth.instance.currentUser != null) {
                          Navigator.pushReplacementNamed(
                              (context), UserVerification.id);
                        } else {
                          // bool isLogin =false;
                            // isLogin =
                            await AuthviewModel.checkSignIn(email, password,context);
                        }
                        // await AuthviewModel.
                        print("Sign In");
                      },
                      child: const Text(
                        "Sign In",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  // Text("Are you a New User?"),

                  // Padding(
                  //   padding: const EdgeInsets.symmetric(horizontal: 20),
                  //   child: Row(
                  //     children: const [
                  //       Expanded(
                  //         child: Divider(),
                  //       ),
                  //       Padding(
                  //         padding: EdgeInsets.symmetric(horizontal: 10),
                  //         child: Text("New to Farmer's Market? "),
                  //       ),
                  //       Expanded(
                  //         child: Divider(),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
