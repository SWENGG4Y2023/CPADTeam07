import 'package:assignment/utils/global_data.dart';
import 'package:assignment/view/main_tab/main_tab_view.dart';
import 'package:assignment/view/onboarding/onboarding.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:assignment/view/home/home_view.dart';
import 'package:assignment/view/login/sign_in_view.dart';

import '../../common/color_extension.dart';
import '../../common_widget/primary_button.dart';
import '../../common_widget/round_textfield.dart';
import '../../common_widget/secondary_boutton.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtPassword = TextEditingController();

  Future<void> _showMyDialog(String errorMessage, BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: const Text('Error'),
          content: SingleChildScrollView(
            child: Text(errorMessage),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Okay'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: TColor.gray,
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minWidth: MediaQuery.of(context).size.width,
            minHeight: MediaQuery.of(context).size.height,
          ),
          child: IntrinsicHeight(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset("assets/img/app_logo.png",
                      width: media.width * 0.5, fit: BoxFit.contain),
                  const Spacer(),
                  RoundTextField(
                    title: "E-mail address",
                    controller: txtEmail,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  RoundTextField(
                    title: "Password",
                    controller: txtPassword,
                    obscureText: true,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 5,
                          margin: const EdgeInsets.symmetric(horizontal: 1),
                          decoration: BoxDecoration(
                            color: TColor.gray70,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 5,
                          margin: const EdgeInsets.symmetric(horizontal: 1),
                          decoration: BoxDecoration(
                            color: TColor.gray70,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 5,
                          margin: const EdgeInsets.symmetric(horizontal: 1),
                          decoration: BoxDecoration(
                            color: TColor.gray70,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 5,
                          margin: const EdgeInsets.symmetric(horizontal: 1),
                          decoration: BoxDecoration(
                            color: TColor.gray70,
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Use 8 or more characters with a mix of letters,\nnumbers & symbols.",
                        style: TextStyle(color: TColor.gray50, fontSize: 12),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  PrimaryButton(
                    title: "Get started, it's free!",
                    onPressed: () {
                      // validate user and password fields
                      if (txtEmail.text == "" || txtPassword.text == "") {
                        // AlertDialog(
                        //   backgroundColor: Colors.white,
                        //   content: Text(
                        //     "Please fill in all fields",
                        //     style: TextStyle(color: Colors.white),
                        //   ),
                        // );
                        _showMyDialog("Please fill in all fields", context);
                        return;
                      }
                      // Create user
                      UserCredential userCredential = FirebaseAuth.instance
                          .createUserWithEmailAndPassword(
                              email: txtEmail.text, password: txtPassword.text)
                          .then((value) {
                        // Set global params
                        GlobalData.email = txtEmail.text;
                        GlobalData.userId = value.user?.uid;
                        const SnackBar(
                          content: Text("User signed up successfully"),
                        );
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const OnboardingView(),
                          ),
                        );
                      }).onError((error, stackTrace) {
                        _showMyDialog(error.toString(), context);
                      }) as UserCredential;
                    },
                  ),
                  const Spacer(),
                  Text(
                    "Do you have already an account?",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: TColor.white, fontSize: 14),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SecondaryButton(
                    title: "Sign in",
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignInView(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
