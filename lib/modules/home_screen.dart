import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:la_via_app/main.dart';
import 'package:la_via_app/cubit/home_cubit/home_cubit.dart';
import 'package:la_via_app/cubit/home_cubit/home_states.dart';
import 'package:la_via_app/models/plants_response.dart';
import 'package:la_via_app/models/product.dart';
import 'package:la_via_app/modules/cart_screen.dart';
import 'package:la_via_app/modules/course_exam.dart';
import 'package:la_via_app/shared/components.dart';
import 'package:la_via_app/shared/constants.dart';
import 'package:la_via_app/shared/preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  bool quizVisible ;
  HomeScreen(this.quizVisible);
  @override
  State<HomeScreen> createState() => _HomeScreenState(this.quizVisible);
 

}

class _HomeScreenState extends State<HomeScreen> {
  
 bool quizVisible;
 _HomeScreenState(this.quizVisible);

  int dayDate = DateTime.now().day;

  int today = 30;

  bool displayQuiz() {
    if (today > DateTime.now().day) {
      quizVisible = false;
    } else
      quizVisible = true;
    return quizVisible;
  }

  @override
  void initState() {
    super.initState();
  //         HomeCubit.get(context).gettAll();
  //         HomeCubit.get(context).getPlants();
  //         HomeCubit.get(context).getSeeds();
  //         HomeCubit.get(context).getTools();
   }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    int conut = 1;
    var searchController = TextEditingController();

    return BlocProvider(
      create: (BuildContext context) => HomeCubit(),
      child: BlocConsumer<HomeCubit, HomeStates>(
        listener: (context, state) {},
        builder: (context, state) {
          HomeCubit cubit = HomeCubit.get(context);
          cubit.gettAll();
          cubit.getPlants();
          cubit.getSeeds();
          cubit.getTools();
  
          return Scaffold(
            body: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SingleChildScrollView(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Image.asset(
                            'assets/images/logo.png',
                            height: height * .15,
                          ),
                          quizVisible
                              ? CircleAvatar(
                                  radius: width * .055,
                                  child: IconButton(
                                    onPressed: () {
                                      dayDate = DateTime.now().day;

                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  CourseExam(quizVisible)));
                                    },
                                    icon: Icon(
                                      Icons.question_mark,
                                      color: Colors.white,
                                    ),
                                    alignment: Alignment.center,
                                  ),
                                  backgroundColor:
                                      Theme.of(context).primaryColor,
                                )
                              : SizedBox(
                                  width: width * 0.05,
                                ),
                        ],
                      ),
                      SizedBox(
                        height: height * .02,
                      ),
                      Row(
                        children: [
                          Container(
                              child: defaultTextFormField(
                            controller: searchController,
                            label: 'Search',
                            prefix: Icons.search,
                            height: height * .05,
                            width: width * .7,
                          )),
                          SizedBox(
                            width: width * .03,
                          ),
                          GestureDetector(
                            child: Container(
                              width: width * .13,
                              height: height * .05,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Theme.of(context).primaryColor,
                              ),
                              child:
                                  Image.asset('assets/images/Vector 155.png'),
                            ),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: ((context) => CartScreen())));
                            },
                          ),
                        ],
                      ),
                      SizedBox(
                        height: height * .03,
                      ),
                      DefaultTabController(
                        length: 4, // length of tabs
                        initialIndex: 0,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              Container(
                                child: TabBar(
                                  labelColor: Theme.of(context).primaryColor,
                                  unselectedLabelColor: Colors.grey,
                                  indicatorColor:
                                      Theme.of(context).primaryColor,
                                  tabs: [
                                    Tab(text: 'All'),
                                    Tab(text: 'Plants'),
                                    Tab(text: 'Seeds'),
                                    Tab(text: 'Tools'),
                                  ],
                                ),
                              ),
                              Container(
                                height: height,
                                child: TabBarView(
                                    physics: NeverScrollableScrollPhysics(),
                                    children: <Widget>[
                                      GridView.count(
                                        crossAxisSpacing: width * .04,
                                        mainAxisSpacing: height * .08,
                                        crossAxisCount: 2,
                                        scrollDirection: Axis.vertical,
                                        shrinkWrap: true,
                                        physics: AlwaysScrollableScrollPhysics(),
                                        children: List.generate(
                                            (cubit.allPlantsResponse.data!
                                                .length), (index) {
                                          return buildMarketItem(
                                            width: width,
                                            height: height,
                                            name: cubit.allPlantsResponse
                                                .data![index].name
                                                .toString(),
                                            price: 100,
                                            count: cubit.allPlantsResponse
                                                .data![index].count,
                                            buttonColor:
                                                Theme.of(context).primaryColor,
                                            onPressPlus: () {
                                              HomeCubit.get(context).increamentCounter(index,cubit.seedsResponse );
                                            },
                                            onPressMinus: () {
                                              HomeCubit.get(context).decreamentCounter(index,cubit.seedsResponse);
                                            },
                                            onPressButton: () {
                                              // boughtItems.add(allPlantsResponse.data![index]);
                                            },
                                            imagePath:
                                                'assets/images/Lovepik_com-401306819-plant-pot.png',
                                          );
                                        }),
                                      ),
                                      GridView.count(
                                        crossAxisSpacing: width * .04,
                                        mainAxisSpacing: height * .08,
                                        crossAxisCount: 2,
                                        scrollDirection: Axis.vertical,
                                        shrinkWrap: true,
                                        physics: NeverScrollableScrollPhysics(),
                                        children: List.generate(
                                            cubit.plantsResponse.data!.length,
                                            (index) {
                                          return buildMarketItem(
                                            width: width,
                                            height: height,
                                            name: cubit.plantsResponse
                                                .data![index].name
                                                .toString(),
                                            price: 100,
                                            count: cubit.plantsResponse
                                                .data![index].count,
                                            buttonColor:
                                                Theme.of(context).primaryColor,
                                            onPressPlus: () {
                                              HomeCubit.get(context).increamentCounter(index,cubit.plantsResponse);
                                            },
                                            onPressMinus: () {
                                              HomeCubit.get(context).decreamentCounter(index,cubit.plantsResponse);
                                            },
                                            onPressButton: () {
                                              boughtItems.add(cubit
                                                  .plantsResponse.data![index]);
                                            },
                                            imagePath:
                                                'assets/images/Lovepik_com-401306819-plant-pot.png',
                                          );
                                        }),
                                      ),
                                      GridView.count(
                                        crossAxisSpacing: width * .04,
                                        mainAxisSpacing: height * .08,
                                        crossAxisCount: 2,
                                        scrollDirection: Axis.vertical,
                                        shrinkWrap: true,
                                        physics: NeverScrollableScrollPhysics(),
                                        children: List.generate(
                                            cubit.seedsResponse.data!.length,
                                            (index) {
                                          return buildMarketItem(
                                            width: width,
                                            height: height,
                                            name: cubit
                                                .seedsResponse.data![index].name
                                                .toString(),
                                            price: 100,
                                            count: cubit.seedsResponse
                                                .data![index].count,
                                            buttonColor:
                                                Theme.of(context).primaryColor,
                                            onPressPlus: () {
                                              HomeCubit.get(context)
                                                  .increamentCounter(index,cubit.seedsResponse);
                                            },
                                            onPressMinus: () {
                                              HomeCubit.get(context)
                                                  .decreamentCounter(index,cubit.seedsResponse);
                                            },
                                            onPressButton: () {
                                              boughtItems.add(cubit
                                                  .seedsResponse.data![index]);
                                            },
                                            imagePath:
                                                'assets/images/Lovepik_com-401306819-plant-pot.png',
                                          );
                                        }),
                                      ),
                                      GridView.count(
                                        crossAxisSpacing: width * .04,
                                        mainAxisSpacing: height * .08,
                                        crossAxisCount: 2,
                                        scrollDirection: Axis.vertical,
                                        shrinkWrap: true,
                                        physics: NeverScrollableScrollPhysics(),
                                        children: List.generate(
                                            cubit.toolsResponse.data!.length,
                                            (index) {
                                          return buildMarketItem(
                                            width: width,
                                            height: height,
                                            name: cubit
                                                .toolsResponse.data![index].name
                                                .toString(),
                                            price: 100,
                                            count: cubit.toolsResponse
                                                .data![index].count,
                                            buttonColor:
                                                Theme.of(context).primaryColor,
                                            onPressPlus: () {
                                              HomeCubit.get(context)
                                                  .increamentCounter(index,cubit.toolsResponse);
                                            },
                                            onPressMinus: () {
                                              HomeCubit.get(context)
                                                  .decreamentCounter(index,cubit.toolsResponse);
                                            },
                                            onPressButton: () {
                                              boughtItems.add(cubit
                                                  .toolsResponse.data![index]);
                                            },
                                            imagePath:
                                                
                                            'assets/images/Lovepik_com-401306819-plant-pot.png',
                                          );
                                        }),
                                      ),
                                    ]),
                              ),
                              //    )
                            ]),
                      ),
                     
                    ]))),
          );
        },
      ),
    );
  }
}
