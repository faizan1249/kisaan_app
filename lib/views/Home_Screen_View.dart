import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kisaan_app/services/FirebaseService.dart';
import 'package:kisaan_app/services/locationService.dart';
import 'package:kisaan_app/view_models/AuthViewModel.dart';
import 'package:kisaan_app/view_models/HomeScreenViewModel.dart';
import 'package:kisaan_app/views/P_Sign_In.dart';
import 'package:kisaan_app/widgets/manualLocationModalSheet.dart';
import 'package:location/location.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const id = '/home-screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  User? user = FirebaseAuth.instance.currentUser;
  @override
  void initState() {
    // checkCurrentUser();
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      HomeScreenViewModel _viewModel =
          Provider.of<HomeScreenViewModel>(context, listen: false);
      _viewModel.getLocation();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AuthenticationViewModel _viewModel =
        Provider.of<AuthenticationViewModel>(context);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Text("This is Home Screen"),
          Center(
            child: Image.asset('assets/location.png'),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "Where to want to Buy/sell your products?",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 28,
                  fontFamily: 'calibri',
                  fontWeight: FontWeight.w500),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 70),
            child: Text(
              "To Enjoy the things that we have to offer you, We need to know your location",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontFamily: 'calibri',
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.6,
            height: MediaQuery.of(context).size.height * 0.05,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
                onPressed: () async {
                  final user = FirebaseAuth.instance.currentUser;
                  // await user!.sendEmailVerification();
                  print(user!.emailVerified);
                  // await FirebaseU
                  // if()
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.location_on_outlined),
                    Text("Around Me"),
                  ],
                )),
          ),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: GestureDetector(
              onTap: () {
                print("Location Manually");
                showModalBottomSheet<void>(
                  isScrollControlled: true,
                  context: context,
                  builder: (BuildContext context) {
                    return Container(
                        padding: EdgeInsets.only(
                            top: MediaQueryData.fromWindow(
                                    WidgetsBinding.instance.window)
                                .padding
                                .top),
                        child: CustomModalSheet());
                  },
                );
              },
              child: const Text(
                "Set Location Manually",
                textAlign: TextAlign.center,
                style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: Colors.black,
                    fontSize: 19,
                    fontFamily: 'calibri',
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),

          // ElevatedButton(
          //     onPressed: () async {
          //       await _viewModel.signOut().then((_) {
          //         Navigator.of(context).pushAndRemoveUntil(
          //             MaterialPageRoute(builder: (context) => SignIn()),
          //             (Route<dynamic> route) => false);
          //       });
          //       // ignore: use_build_context_synchronously
          //     },
          //     child: Text("Sign Out")),
          // ElevatedButton(
          //     onPressed: () async {
          //       final user = FirebaseAuth.instance.currentUser;
          //       // await user!.sendEmailVerification();
          //       print(user!.emailVerified);
          //       // await FirebaseU
          //       // if()
          //     },
          //     child: Text("Check User"))
        ],
      ),
    );
  }
}
