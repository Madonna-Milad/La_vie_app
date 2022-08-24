import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_via_app/cubit/blogs_cubit/blogs_cubit.dart';
import 'package:la_via_app/cubit/blogs_cubit/blogs_states.dart';
import 'package:la_via_app/modules/single_blog_screen.dart';

import '../models/blogs_response.dart';
import '../models/forums_respose.dart';
import '../shared/preferences.dart';

class BlogsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return BlocProvider(
      create: (context) => BlogsCubit()..getBlogs(),
      child: BlocConsumer<BlogsCubit, BlogsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          BlogsCubit cubit = BlogsCubit.get(context);
          return Scaffold(
              appBar: AppBar(
                leading: IconButton(icon: Icon(Icons.arrow_back),color: Colors.black,onPressed: (){Navigator.pop(context);}),
                title: Text(
                  'Blogs',
                  style: TextStyle(color: Colors.black),
                ),
                centerTitle: true,
              ),
              body: cubit.gettingBlogs
                  ? Center(child: CircularProgressIndicator(color: Theme.of(context).primaryColor,))
                  : Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: ListView.separated(
                          physics: const AlwaysScrollableScrollPhysics(),
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemBuilder: ((context, index) {
                            return buildBlogItem(
                                height, width, index, cubit, context);
                          }),
                          separatorBuilder: (context, index) {
                            return Container(
                              height: height * .03,
                            );
                          },
                          itemCount: cubit.blogsResponse.data!.plants!.length),
                    ));
        },
      ),
    );
  }

  Widget buildBlogItem(double height, double width, int index, BlogsCubit cubit,
      BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    SingleBlogScreen(cubit.blogsResponse, index)));
      },
      child: Material(
        borderRadius: BorderRadius.circular(15),
        child: Container(
          alignment: Alignment.center,
          height: height * .177,
          child: Row(
            children: [
              Image.network(
                'https://lavie.orangedigitalcenteregypt.com${cubit.blogsResponse.data!.plants![index].imageUrl}',
                height: height * .14,
                width: width * .34,
              ),
              SizedBox(
                width: width * .035,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('2 days ago',
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                            color: Theme.of(context).primaryColor)),
                    SizedBox(
                      height: height * .01,
                    ),
                    Text('5 Tips to treat plants',
                        style:
                            TextStyle(fontSize: 17, fontWeight: FontWeight.w600)),
                    SizedBox(
                      height: height * .01,
                    ),
                    Text(
                        cubit.blogsResponse.data!.plants![index].description
                            .toString(),
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
