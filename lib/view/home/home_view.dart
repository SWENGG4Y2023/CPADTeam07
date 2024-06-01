import 'package:assignment/models/subscription_model.dart';
import 'package:assignment/models/user_data.dart';
import 'package:assignment/service/database_service.dart';
import 'package:assignment/utils/global_data.dart';
import 'package:assignment/view/spending_budgets/spending_budgets_view.dart';
import 'package:flutter/material.dart';
import 'package:assignment/common/color_extension.dart';
import 'package:flutter/services.dart';

import '../../common_widget/custom_arc_painter.dart';
import '../../common_widget/segment_button.dart';
import '../../common_widget/status_button.dart';
import '../../common_widget/subscription_home_row.dart';
import '../../common_widget/upcoming_bill_row.dart';
import '../settings/settings_view.dart';
import '../subscription_info/subscription_info_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  bool isSubscription = true;
  // List subArr = [
  //   {"name": "Spotify", "icon": "assets/img/spotify_logo.png", "price": "5.99"},
  //   {
  //     "name": "YouTube Premium",
  //     "icon": "assets/img/youtube_logo.png",
  //     "price": "18.99"
  //   },
  //   {
  //     "name": "Microsoft OneDrive",
  //     "icon": "assets/img/onedrive_logo.png",
  //     "price": "29.99"
  //   },
  //   {"name": "NetFlix", "icon": "assets/img/netflix_logo.png", "price": "15.00"}
  // ];

  List bilArr = [
    {"name": "Spotify", "date": DateTime(2023, 07, 25), "price": "5.99"},
    // {
    //   "name": "YouTube Premium",
    //   "date": DateTime(2023, 07, 25),
    //   "price": "18.99"
    // },
    // {
    //   "name": "Microsoft OneDrive",
    //   "date": DateTime(2023, 07, 25),
    //   "price": "29.99"
    // },
    // {"name": "NetFlix", "date": DateTime(2023, 07, 25), "price": "15.00"}
  ];

  DatabaseService databaseService = DatabaseService();
  late Future<UserData> userDataModel;
  late Future<List<SubscriptionModel>> subsciptionData;

  @override
  void initState() {
    super.initState();
    setState(() {
      userDataModel = databaseService.getUser(GlobalData.userId!);
      subsciptionData = databaseService.getSubscription(GlobalData.userId!);
    });
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
  }

  String getHighestSubscription(List<SubscriptionModel> subArr) {
    int highest = subArr[0].currency;
    for (var sub in subArr) {
      if (highest < sub.currency) {
        highest = sub.currency;
      }
    }
    return '\u{20B9}$highest';
  }

  String getLowestSubscription(List<SubscriptionModel> subArr) {
    int lowest = subArr[0].currency;
    for (var sub in subArr) {
      if (lowest > sub.currency) {
        lowest = sub.currency;
      }
    }
    return '\u{20B9}$lowest';
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: TColor.gray,
      body: SingleChildScrollView(
        // UserData grabbed
        child: FutureBuilder(
            future: userDataModel,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                UserData userData = snapshot.data!;
                return FutureBuilder(
                    future: subsciptionData,
                    builder: (context, snapshot2) {
                      if (snapshot2.hasData) {
                        List<SubscriptionModel> subArr = snapshot2.data!;
                        return Column(
                          children: [
                            Container(
                              height: media.width * 1.1,
                              decoration: BoxDecoration(
                                  color: TColor.gray70.withOpacity(0.5),
                                  borderRadius: const BorderRadius.only(
                                      bottomLeft: Radius.circular(25),
                                      bottomRight: Radius.circular(25))),
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  Image.asset("assets/img/home_bg.png"),
                                  Stack(
                                    alignment: Alignment.topCenter,
                                    children: [
                                      Container(
                                        padding: EdgeInsets.only(
                                            bottom: media.width * 0.05),
                                        width: media.width * 0.72,
                                        height: media.width * 0.72,
                                        child: CustomPaint(
                                          painter: CustomArcPainter(
                                            end: 220,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 10),
                                        child: Row(
                                          children: [
                                            const Spacer(),
                                            IconButton(
                                                onPressed: () {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              //TODO
                                                              const SettingsView()));
                                                },
                                                icon: Image.asset(
                                                    "assets/img/settings.png",
                                                    width: 25,
                                                    height: 25,
                                                    color: TColor.gray30))
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      SizedBox(
                                        height: media.width * 0.05,
                                      ),
                                      Image.asset("assets/img/app_logo.png",
                                          width: media.width * 0.25,
                                          fit: BoxFit.contain),
                                      SizedBox(
                                        height: media.width * 0.07,
                                      ),
                                      Text(
                                        '\u{20B9}${userData.accountBalance}',
                                        style: TextStyle(
                                            color: TColor.white,
                                            fontSize: 35,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      SizedBox(
                                        height: media.width * 0.055,
                                      ),
                                      Text(
                                        "This month bills",
                                        style: TextStyle(
                                            color: TColor.gray40,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      SizedBox(
                                        height: media.width * 0.07,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const SpendingBudgetsView(),
                                            ),
                                          );
                                        },
                                        child: Container(
                                          padding: const EdgeInsets.all(8),
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: TColor.border
                                                  .withOpacity(0.15),
                                            ),
                                            color:
                                                TColor.gray60.withOpacity(0.3),
                                            borderRadius:
                                                BorderRadius.circular(16),
                                          ),
                                          child: Text(
                                            "See your budget",
                                            style: TextStyle(
                                                color: TColor.white,
                                                fontSize: 12,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(20),
                                    child: Column(
                                      children: [
                                        const Spacer(),
                                        Row(
                                          children: [
                                            Expanded(
                                              child: StatusButton(
                                                title: "Active subs",
                                                value: subArr.length.toString(),
                                                statusColor: TColor.secondary,
                                                onPressed: () {},
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 8,
                                            ),
                                            Expanded(
                                              child: StatusButton(
                                                title: "Highest subs",
                                                value: getHighestSubscription(
                                                    subArr),
                                                statusColor: TColor.primary10,
                                                onPressed: () {},
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 8,
                                            ),
                                            Expanded(
                                              child: StatusButton(
                                                title: "Lowest subs",
                                                value: getLowestSubscription(
                                                    subArr),
                                                statusColor: TColor.secondaryG,
                                                onPressed: () {},
                                              ),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 20),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 8),
                              height: 50,
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(15)),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: SegmentButton(
                                      title: "Your subscription",
                                      isActive: isSubscription,
                                      onPressed: () {
                                        setState(() {
                                          isSubscription = !isSubscription;
                                        });
                                      },
                                    ),
                                  ),
                                  Expanded(
                                    child: SegmentButton(
                                      title: "Upcoming bills",
                                      isActive: !isSubscription,
                                      onPressed: () {
                                        setState(() {
                                          isSubscription = !isSubscription;
                                        });
                                      },
                                    ),
                                  )
                                ],
                              ),
                            ),

                            //// SUBSCIPTION TAB
                            if (isSubscription)
                              ListView.builder(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 0),
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: subArr.length,
                                  itemBuilder: (context, index) {
                                    var sObj = subArr[index];

                                    if (subArr.length == 0 || subArr.isEmpty) {
                                      return const Center(
                                        child: Text(
                                            "No data to display, please add subscriptions to yourself!"),
                                      );
                                    }

                                    return SubScriptionHomeRow(
                                      sObj: sObj,
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    SubscriptionInfoView(
                                                        sObj: sObj)));
                                      },
                                    );
                                  }),

                            //// UPCOMING BILLS TAB
                            if (!isSubscription)
                              ListView.builder(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 0),
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: bilArr.length,
                                  itemBuilder: (context, index) {
                                    var sObj = bilArr[index];

                                    if (bilArr.length == 0 || bilArr.isEmpty) {
                                      return const Center(
                                        child: Text("No upcoming bills!"),
                                      );
                                    }

                                    return UpcomingBillRow(
                                      sObj: sObj,
                                      onPressed: () {},
                                    );
                                  }),
                            const SizedBox(
                              height: 110,
                            ),
                          ],
                        );
                      } else if (snapshot2.hasError) {
                        return const Center(
                          child: Text("Error Loading Details"),
                        );
                      } else {
                        return const Center(
                          child: Column(
                            children: [
                              CircularProgressIndicator(),
                              Text("Fetching Details, please wait!"),
                            ],
                          ),
                        );
                      }
                    });
              } else if (snapshot.hasError) {
                return const Center(
                  child: Text("Error Loading Details"),
                );
              } else {
                return const Center(
                  child: Column(
                    children: [
                      CircularProgressIndicator(),
                      Text("Fetching Details, please wait!"),
                    ],
                  ),
                );
              }
            }),
      ),
    );
  }
}
