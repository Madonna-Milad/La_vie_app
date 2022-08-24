import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_via_app/cubit/layout_cubit/layout_states.dart';
import 'package:la_via_app/modules/discussion_forums_screen.dart';

import '../../modules/Profile_screen.dart';
import '../../modules/blogs_screen.dart';
import '../../modules/home_screen.dart';
import '../../modules/notifications_screen.dart';
import '../../modules/scan_screen.dart';

class LayoutCubit extends Cubit<LayoutStates>{
  LayoutCubit() : super(initialState());


static LayoutCubit get(context)=>BlocProvider.of(context);

int currentIndex=2;
List<Widget>screens=[
   DiscussionForumScreen(),
    ScanScreen(),
    HomeScreen(true),
    NotificationsScreen(),
    ProfileScreen()

  ];

void changeScreenIndex(int index){
  currentIndex=index;
  emit(ChangeScreenIndexState());
}

}