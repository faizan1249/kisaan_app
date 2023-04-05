import 'package:flutter/material.dart';
import 'package:kisaan_app/res/colors/strings/colors.dart';
import 'package:kisaan_app/view_models/AuthViewModel.dart';
import 'package:kisaan_app/view_models/HomeScreenViewModel.dart';
import 'package:kisaan_app/view_models/location_modal_sheet_vm.dart';
import 'package:kisaan_app/view_models/userVerificationViewModel.dart';
import 'package:kisaan_app/views/Custom_Splash_View.dart';
import 'package:kisaan_app/views/Home_Screen_View.dart';
import 'package:kisaan_app/views/P_SignUp.dart';
import 'package:kisaan_app/views/P_Sign_In.dart';
import 'package:kisaan_app/views/userVerificationView.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthenticationViewModel()),
        ChangeNotifierProvider(
            create: ((context) => UserVerificationViewModel())),
        ChangeNotifierProvider(create: (context) => HomeScreenViewModel()),
        ChangeNotifierProvider(create: (context) => LocationModalViewModel()),
      ],
      child: MaterialApp(
        themeMode: ThemeMode.light,
        theme: ThemeData(
          fontFamily: 'calibri',
          scaffoldBackgroundColor: AppColors.scaffoldBackgroundColor,
        ),
        home: CustomSplashScreen(),
        routes: {
          HomeScreen.id: ((context) => HomeScreen()),
          SignIn.id: (context) => SignIn(),
          SignUp.id: (context) => SignUp(),
          UserVerification.id: (context) => const UserVerification(),
        },
      ),
    );
    // return ;
  }
}
