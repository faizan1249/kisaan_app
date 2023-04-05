import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kisaan_app/enums/enums.dart';
import 'package:kisaan_app/view_models/AuthViewModel.dart';
import 'package:kisaan_app/views/Home_Screen_View.dart';
import 'package:kisaan_app/views/P_Sign_In.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SignUp extends StatelessWidget {
  static const String id = 'signup';
  TextEditingController signUpEmailController = TextEditingController();
  TextEditingController signUpPasswordController = TextEditingController();
  TextEditingController signUpNameController = TextEditingController();

  SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    AuthenticationViewModel _viewModel =
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
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.end,
                  //   children: [
                  //     Container(
                  //       decoration: BoxDecoration(
                  //           borderRadius: BorderRadius.all(Radius.circular(0))),
                  //       width: MediaQuery.of(context).size.width * 0.35,
                  //       child: ElevatedButton(
                  //         style: ElevatedButton.styleFrom(
                  //             backgroundColor: Colors.black),
                  //         onPressed: () {
                  //           print("Sign In");
                  //           Navigator.pushReplacementNamed(context, SignIn.id);
                  //         },
                  //         child: const Text(
                  //           "Sign In",
                  //           style: TextStyle(color: Colors.white, fontSize: 16),
                  //         ),
                  //       ),
                  //     ),
                  //   ],
                  // ),

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
                          controller: signUpNameController,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                style: BorderStyle.solid,
                                color: Colors.black,
                              )),
                              focusedBorder: OutlineInputBorder(),
                              hintText: "Enter Full Name"),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller: signUpEmailController,
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
                          controller: signUpPasswordController,
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
                        TextFormField(
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                style: BorderStyle.solid,
                                color: Colors.black,
                              )),
                              focusedBorder: OutlineInputBorder(),
                              hintText: "Confirm Passord"),
                        ),
                        const SizedBox(
                          height: 10,
                        ),

                        // const SizedBox(
                        //   height: 30,
                        // ),
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
                        final SharedPreferences prefs =
                            await SharedPreferences.getInstance();
                        print(
                            signUpEmailController.value.text.toString().trim());
                        print(signUpPasswordController.value.text
                            .toString()
                            .trim());
                        bool isSignUp = await _viewModel.registerNewUser(
                            signUpEmailController.value.text.toString().trim(),
                            signUpPasswordController.value.text
                                .toString()
                                .trim(),
                            signUpNameController.value.text.toString());

                        if (isSignUp == true) {
                          // await prefs.setBool('isUserLogin', true);

                          Navigator.pushReplacementNamed((context), SignIn.id);
                          Fluttertoast.showToast(
                              msg: "Account Has been Created");
                        } else {
                          // await prefs.setBool('isUserLogin', false);
                        }

                        print("Sign Up");
                      },
                      child: const Text(
                        "Sign Up",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const <Widget>[
                      Text(
                        "Already Have an Account?",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "Login Here",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  _viewModel.getAppStatus == AppStatus.LOADING
                      ? CircularProgressIndicator(
                          color: Colors.black,
                        )
                      : Container()
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
