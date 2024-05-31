import 'package:assignment/models/user_data.dart';
import 'package:assignment/service/database_service.dart';
import 'package:assignment/utils/global_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:assignment/view/add_subscription/add_subscription_view.dart';

import '../../common/color_extension.dart';
import '../calender/calender_view.dart';
import '../card/cards_view.dart';
import '../home/home_view.dart';
import '../spending_budgets/spending_budgets_view.dart';

class MainTabView extends StatefulWidget {
  const MainTabView({super.key});

  @override
  State<MainTabView> createState() => _MainTabViewState();
}

class _MainTabViewState extends State<MainTabView> {
  DatabaseService databaseService = DatabaseService();
  int selectTab = 0;
  PageStorageBucket pageStorageBucket = PageStorageBucket();
  Widget currentTabView = const HomeView();

  late Future<UserData> userData;
  late Future<List<UserData>> allUsers;

  @override
  void initState() {
    GlobalData.initialize();
    super.initState();
    // allUsers = databaseService.getAllUsers();
    userData = databaseService.getUser(GlobalData.userId!);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColor.gray,
      body: Stack(children: [
        PageStorage(bucket: pageStorageBucket, child: currentTabView),
        SafeArea(
          child: FutureBuilder(
              future: userData,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Expanded(
                    child: Column(
                      children: [
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, top: 8),
                          child: Stack(
                            alignment: Alignment.bottomCenter,
                            children: [
                              Stack(
                                alignment: Alignment.center,
                                children: [
                                  Image.asset("assets/img/bottom_bar_bg.png"),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      IconButton(
                                        onPressed: () {
                                          setState(() {
                                            selectTab = 0;
                                            currentTabView = const HomeView();
                                          });
                                        },
                                        icon: Image.asset(
                                          "assets/img/home.png",
                                          width: 20,
                                          height: 20,
                                          color: selectTab == 0
                                              ? TColor.white
                                              : TColor.gray30,
                                        ),
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          setState(() {
                                            selectTab = 1;
                                            currentTabView =
                                                const SpendingBudgetsView();
                                          });
                                        },
                                        icon: Image.asset(
                                          "assets/img/budgets.png",
                                          width: 20,
                                          height: 20,
                                          color: selectTab == 1
                                              ? TColor.white
                                              : TColor.gray30,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 50,
                                        height: 50,
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          setState(() {
                                            selectTab = 2;
                                            currentTabView =
                                                const CalenderView();
                                          });
                                        },
                                        icon: Image.asset(
                                          "assets/img/calendar.png",
                                          width: 20,
                                          height: 20,
                                          color: selectTab == 2
                                              ? TColor.white
                                              : TColor.gray30,
                                        ),
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          setState(() {
                                            selectTab = 3;
                                            currentTabView = const CardsView();
                                          });
                                        },
                                        icon: Image.asset(
                                          "assets/img/creditcards.png",
                                          width: 20,
                                          height: 20,
                                          color: selectTab == 3
                                              ? TColor.white
                                              : TColor.gray30,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const AddSubScriptionView()));
                                },
                                child: Container(
                                  margin: const EdgeInsets.all(20),
                                  decoration: BoxDecoration(boxShadow: [
                                    BoxShadow(
                                        color:
                                            TColor.secondary.withOpacity(0.25),
                                        blurRadius: 10,
                                        offset: const Offset(0, 4))
                                  ], borderRadius: BorderRadius.circular(50)),
                                  child: Image.asset(
                                    "assets/img/center_btn.png",
                                    width: 55,
                                    height: 55,
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  );
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
        )
      ]),
    );
  }
}
