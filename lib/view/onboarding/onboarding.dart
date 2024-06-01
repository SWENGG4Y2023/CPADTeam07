import 'dart:ffi';
import 'dart:math';

import 'package:assignment/models/subscription_model.dart';
import 'package:assignment/models/user_data.dart';
import 'package:assignment/service/database_service.dart';
import 'package:assignment/utils/global_data.dart';
import 'package:assignment/view/main_tab/main_tab_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:assignment/view/home/home_view.dart';
import 'package:assignment/view/login/sign_in_view.dart';
import 'package:uuid/uuid.dart';

import '../../common/color_extension.dart';
import '../../common_widget/primary_button.dart';
import '../../common_widget/round_textfield.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => OnboardingViewState();
}

class OnboardingViewState extends State<OnboardingView> {
  DatabaseService databaseService = DatabaseService();

  Future<void> _showMyDialog(String errorMessage, BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: const Text('Error'),
          content: Text(errorMessage),
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

  TextEditingController txtName = TextEditingController();
  TextEditingController txtBankName = TextEditingController();
  TextEditingController txtPhoneNumber = TextEditingController();
  TextEditingController txtDOB = TextEditingController();
  TextEditingController txtAccountNumber = TextEditingController();
  bool checkboxValue = false;

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: TColor.gray,
      body: SingleChildScrollView(
        // physics: NeverScrollableScrollPhysics(),
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minWidth: MediaQuery.of(context).size.width,
            minHeight: MediaQuery.of(context).size.height,
          ),
          child: IntrinsicHeight(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset("assets/img/app_logo.png",
                      width: media.width * 0.5, fit: BoxFit.contain),
                  const Spacer(),
                  RoundTextField(
                    title: "Name",
                    controller: txtName,
                    keyboardType: TextInputType.name,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  RoundTextField(
                    title: "Date of Birth",
                    controller: txtDOB,
                    keyboardType: TextInputType.datetime,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  RoundTextField(
                    title: "Phone Number",
                    controller: txtPhoneNumber,
                    keyboardType: TextInputType.phone,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  RoundTextField(
                    title: "Bank Name",
                    controller: txtBankName,
                    keyboardType: TextInputType.text,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  RoundTextField(
                    title: "Account Number",
                    controller: txtAccountNumber,
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  CheckboxListTile(
                    value: checkboxValue,
                    onChanged: (val) {
                      setState(() {
                        checkboxValue = !checkboxValue;
                      });
                    },
                    title: const Text(
                      'I allow the application to fetch my bank account details for further operations.',
                      style: TextStyle(fontSize: 14.0, color: Colors.white),
                    ),
                    controlAffinity: ListTileControlAffinity.leading,
                    activeColor: Colors.green,
                  ),
                  const Spacer(),
                  PrimaryButton(
                    title: "Submit",
                    onPressed: () {
                      // validate all fields are filled.
                      if (txtName.text == "" ||
                          txtPhoneNumber.text == "" ||
                          txtDOB.text == "" ||
                          txtBankName.text == "" ||
                          txtAccountNumber.text == "" ||
                          checkboxValue == false) {
                        _showMyDialog("Please fill in all fields", context);
                        return;
                      }

                      // Setup global data
                      GlobalData.fullName = txtName.text;

                      Random random = Random();
                      int randomNumber = random.nextInt(60000) + 60000;

                      SubscriptionModel subscriptionModel = SubscriptionModel(
                          subId: const Uuid().toString(),
                          userId: GlobalData.userId!,
                          name: "MonEye",
                          description: "Manage subscriptions",
                          category: "Finance",
                          firstPayment: DateTime.now().toString(),
                          currency: 99,
                          subImage: "assets/img/app_logo.png");

                      // List<SubscriptionModel> subsList = [subscriptionModel];

                      UserData userData = UserData(
                          userId: GlobalData.userId!,
                          fullName: txtName.text,
                          emailId: GlobalData.email!,
                          phone: txtPhoneNumber.text,
                          bank: txtBankName.text,
                          accountNumber: txtAccountNumber.text,
                          accountBalance: randomNumber);
                      // subscriptionModel: subsList);

                      databaseService.addUser(GlobalData.userId!, userData);
                      databaseService.addSubscriptionToUser(subscriptionModel);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MainTabView(),
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
