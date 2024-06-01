import 'package:assignment/models/subscription_model.dart';
import 'package:assignment/service/database_service.dart';
import 'package:assignment/utils/global_data.dart';
import 'package:assignment/view/main_tab/main_tab_view.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:assignment/common/color_extension.dart';
import 'package:assignment/common_widget/primary_button.dart';
import 'package:assignment/common_widget/round_textfield.dart';
import 'package:uuid/uuid.dart';

class AddSubScriptionView extends StatefulWidget {
  const AddSubScriptionView({super.key});

  @override
  State<AddSubScriptionView> createState() => _AddSubScriptionViewState();
}

class _AddSubScriptionViewState extends State<AddSubScriptionView> {
  DatabaseService databaseService = DatabaseService();

  TextEditingController txtDescription = TextEditingController();
  TextEditingController txtCategoryName = TextEditingController();
  TextEditingController txtSubsName = TextEditingController();
  TextEditingController txtSubsPrice = TextEditingController();

  List subArr = [
    {"name": "HBO GO", "icon": "assets/img/hbo_logo.png"},
    {"name": "Spotify", "icon": "assets/img/spotify_logo.png"},
    {"name": "YouTube Premium", "icon": "assets/img/youtube_logo.png"},
    {
      "name": "Microsoft OneDrive",
      "icon": "assets/img/onedrive_logo.png",
    },
    {"name": "NetFlix", "icon": "assets/img/netflix_logo.png"},
    {"name": "Other", "icon": "assets/img/app_logo.png"}
  ];

  double amountVal = 0.09;
  String imageAssetPath = "assets/img/app_logo.png";

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: TColor.gray,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: TColor.gray70.withOpacity(0.5),
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(25),
                      bottomRight: Radius.circular(25))),
              child: SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: Image.asset("assets/img/back.png",
                                    width: 25,
                                    height: 25,
                                    color: TColor.gray30))
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "New",
                              style:
                                  TextStyle(color: TColor.gray30, fontSize: 16),
                            )
                          ],
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Text(
                        "Add new\n subscription",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: TColor.white,
                            fontSize: 40,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                    SizedBox(
                      width: media.width,
                      height: media.width * 0.5,
                      child: CarouselSlider.builder(
                        options: CarouselOptions(
                          autoPlay: false,
                          aspectRatio: 1,
                          enlargeCenterPage: true,
                          enableInfiniteScroll: true,
                          viewportFraction: 0.65,
                          enlargeFactor: 0.4,
                          enlargeStrategy: CenterPageEnlargeStrategy.zoom,
                        ),
                        itemCount: subArr.length,
                        itemBuilder: (BuildContext context, int itemIndex,
                            int pageViewIndex) {
                          var sObj = subArr[itemIndex] as Map? ?? {};
                          return Container(
                            margin: const EdgeInsets.all(10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  sObj["icon"],
                                  width: media.width * 0.4,
                                  height: media.width * 0.4,
                                  fit: BoxFit.fitHeight,
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
                child: RoundTextField(
                  title: "Name",
                  titleAlign: TextAlign.center,
                  controller: txtSubsName,
                )),
            Padding(
                padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
                child: RoundTextField(
                  title: "Description",
                  titleAlign: TextAlign.center,
                  controller: txtDescription,
                )),
            Padding(
                padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                child: RoundTextField(
                  title: "Category",
                  titleAlign: TextAlign.center,
                  controller: txtCategoryName,
                )),
            Padding(
                padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                child: RoundTextField(
                  title: "Monthly price",
                  titleAlign: TextAlign.center,
                  controller: txtSubsPrice,
                )),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: PrimaryButton(
                title: "Add this platform",
                onPressed: () {
                  // add subscription to a user here.
                  SubscriptionModel subscriptionModel = SubscriptionModel(
                    subId: const Uuid().toString(),
                    userId: GlobalData.userId!,
                    name: txtSubsName.text,
                    description: txtDescription.text,
                    category: txtCategoryName.text,
                    firstPayment: DateTime.now().toString(),
                    currency: int.parse(txtSubsPrice.text),
                    subImage: imageAssetPath,
                  );

                  setState(() {
                    databaseService.addSubscriptionToUser(subscriptionModel);
                  });
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MainTabView()));
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
