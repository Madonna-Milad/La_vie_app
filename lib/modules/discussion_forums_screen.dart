import 'dart:ui';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_via_app/cubit/forums_cubit/forums_cubit.dart';
import 'package:la_via_app/cubit/forums_cubit/forums_state.dart';
import 'package:la_via_app/modules/Profile_screen.dart';
import 'package:la_via_app/modules/create_new_post_screen.dart';
import 'package:la_via_app/shared/components.dart';

import '../models/forums_respose.dart';

import '../shared/preferences.dart';

class DiscussionForumScreen extends StatelessWidget {
 
  var searchController = TextEditingController();
 
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {},
            icon: Icon(Icons.arrow_back_ios),
            color: Colors.black,
          ),
          title: Text(
            'Discussion Forums',
            style: TextStyle(
                color: Colors.black, fontSize: 21, fontWeight: FontWeight.w700),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                defaultTextFormField(
                    controller: searchController,
                    label: 'Search',
                    prefix: Icons.search,
                    height: height * .07,
                    ),
                SizedBox(
                  height: height * .02,
                ),
                DefaultTabController(
                  length: 2, // length of tabs
                  initialIndex: 0,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Container(
                          child: TabBar(
                            
                            labelColor: Theme.of(context).primaryColor,
                            unselectedLabelColor: Colors.grey,
                            indicatorColor: Theme.of(context).primaryColor,
                            tabs: [
                              Tab(text: 'All Forums'),
                              Tab(text: 'My Forums'),
                            ],
                          ),
                        ),
                        BlocProvider(
      create: (BuildContext context) =>ForumsCubit(),
      child: BlocConsumer<ForumsCubit,ForumsStates>(
        listener: (context, state) {},
        builder: (context,state){
          ForumsCubit cubit =ForumsCubit.get(context);
         cubit.getAllForums();
    cubit.getMyForums();
          return Container(
                            height: height,
                           
                                child: TabBarView(
                                  physics:  NeverScrollableScrollPhysics(),
                                  children: <Widget>[
                                  ListView.separated(
                                     physics: NeverScrollableScrollPhysics(),
                                      scrollDirection: Axis.vertical,
                                      shrinkWrap: true,
                                      itemBuilder: ((context, index) => createForum(
                                          width,
                                          height,
                                          context,
                                         cubit.formusResponse,
                                          index,cubit)),
                                      separatorBuilder: ((context, index) =>
                                          SizedBox(
                                            height: height * .02,
                                          )),
                                      itemCount: cubit.formusResponse.data!.length
                                      ),
                                  ListView.separated(
                                      physics: NeverScrollableScrollPhysics(),
                                      scrollDirection: Axis.vertical,
                                      shrinkWrap: true,
                                      itemBuilder: ((context, index) => createForum(
                                          width,
                                          height,
                                          context,
                                          cubit.myFormusResponse,
                                          index,cubit)),
                                      separatorBuilder: ((context, index) =>
                                          SizedBox(
                                            height: height * .02,
                                          )),
                                      itemCount: cubit.myFormusResponse.data!.length),
                                ]),
                              );}))
                          
                      ]),
                ),
                SizedBox(
                  height: height * .024,
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => CreateNewPostScreen()));
          },
          backgroundColor: Theme.of(context).primaryColor,
          child: const Icon(Icons.add),
        )
        );
  }

  Widget createForum(double width, double height, BuildContext context,
      Forums forumsResponse, int index,ForumsCubit cubit) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(5),
          width: width,
          height: height * .45,
          decoration:
              BoxDecoration(border: Border.all(width: 1, color: Colors.grey)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: width * .05,
                    backgroundImage: AssetImage(
                      'assets/images/Ellipse 287.png',
                    ),
                  ),
                  SizedBox(
                    width: width * .028,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        ('Mayar Mohamed'),
                        style: TextStyle(
                            fontSize: 13, fontWeight: FontWeight.w700),
                      ),
                      Text('a month ago',
                          style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w400,
                              color: Colors.grey)),
                    ],
                  )
                ],
              ),
              SizedBox(
                height: height * .02,
              ),
              Text(
                (forumsResponse.data![index].title).toString(),
                style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 15,
                    fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: height * .01,
              ),
              Text(
                (forumsResponse.data![index].description).toString(),
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 11,
                    fontWeight: FontWeight.w400),
              ),
              SizedBox(
                height: height * .03,
              ),
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/images/pexels-scott-webb-213727 1.png',
                    ),
                    fit: BoxFit.fill,
                  ),
                ),
                width: width * .9,
                height: height * .25,
              ),
            ],
          ),
        ),
        SizedBox(
          height: height * .01,
        ),
        Row(
          children: [
            GestureDetector(
              child: Image.asset(
                'assets/images/Group (1).png',
                color: cubit.likePressed ? Colors.blue : Colors.grey,
              ),
              onTap: () {
              cubit.toggleLikeButton();
              cubit.increamentLikesNumber(index);  
              
              },
            ),
            Text(
              ' ${cubit.formusResponse.data![index].forumLikes!.length.toString()} Likes',
              style: TextStyle(color: Colors.grey, fontSize: 11),
            ),
            SizedBox(
              width: width * .1,
            ),
            Text(
              ('${cubit.formusResponse.data![index].forumComments!.length} Replies')
                  .toString(),
              style: TextStyle(color: Colors.grey, fontSize: 11),
            ),
          ],
        )
        
      ],
    );
  }
}
