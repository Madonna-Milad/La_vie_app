import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_via_app/cubit/layout_cubit/layout_cubit.dart';
import 'package:la_via_app/cubit/layout_cubit/layout_states.dart';
import 'package:la_via_app/modules/blogs_screen.dart';
import 'package:la_via_app/modules/course_exam.dart';
import 'package:la_via_app/modules/home_screen.dart';
import 'package:la_via_app/modules/notifications_screen.dart';

import '../modules/Profile_screen.dart';
import '../modules/discussion_forums_screen.dart';
import '../modules/qr_code_screen.dart';
import '../modules/scan_screen.dart';

class LayoutScreen extends StatelessWidget {
  
  
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    
    return BlocProvider(
      create: (BuildContext context) => LayoutCubit(),
      child: BlocConsumer<LayoutCubit,LayoutStates>(
        listener: (context, state) {},
        builder: (context, state) {
          LayoutCubit cubit =LayoutCubit.get(context);
          return Scaffold(
          
          body: cubit.screens[cubit.currentIndex] ,
          
          bottomNavigationBar: CurvedNavigationBar(
            height: height*.07,
         
            backgroundColor: Color.fromARGB(255, 248, 240, 240),
            buttonBackgroundColor: Theme.of(context).primaryColor,
            index: 2,
            items: <Widget>[
             Image.asset('assets/images/leave 1 (Traced).png',scale: 1,),
              Image.asset('assets/images/qr-code-scan 1 (Traced).png',scale: 1,),
              Image.asset('assets/images/Rectangle 74.png',scale: 1,color: Colors.black),
              Image.asset('assets/images/Group 2120.png',scale: 1,),
              Icon(Icons.person_outline, size: 30),
            ],
            onTap: (index) {
              
             cubit.changeScreenIndex(index);
              
              
            },
          ),
        );
        } ,
       
      ),
    );
  }
}
