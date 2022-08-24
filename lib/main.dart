import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:la_via_app/modules/login_screen.dart';
import 'package:la_via_app/modules/splash_screen.dart';
import 'package:la_via_app/shared/preferences.dart';

import 'layout/layout_screen.dart';
import 'models/plants_response.dart';
import 'modules/Profile_screen.dart';
import 'modules/blogs_screen.dart';
import 'modules/cart_screen.dart';
import 'modules/course_exam.dart';
import 'modules/create_new_post_screen.dart';
import 'modules/discussion_forums_screen.dart';
import 'modules/home_screen.dart';
import 'modules/notifications_screen.dart';
import 'modules/scan_screen.dart';
import 'modules/search_screen.dart';
import 'modules/signup_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    
    super.initState();
     
     login();
  }

  void login(){
    Dio().post('https://lavie.orangedigitalcenteregypt.com/api/v1/auth/signin',
    data: {
      'email':'madonnamilad20@gmail.com',
      'password':'M0170509001m',
    }
).then((response)async {
 
 await PreferenceUtils.setString(SharedKeys.apiToken, response.data['data']['accessToken']);
  
}).catchError((error){
if(error is DioError){
  print(error.response);
}
});

  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Color(0xFF1ABC00),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 0,
          backwardsCompatibility: false,
          systemOverlayStyle:
              SystemUiOverlayStyle(statusBarColor: Colors.transparent),
        ),
        scaffoldBackgroundColor: Colors.white,
        //  buttonColor:const Color(0xFF1ABC00),
      ),
      debugShowCheckedModeBanner: false,
      home: SplachScreen(),
    );
  }
}
