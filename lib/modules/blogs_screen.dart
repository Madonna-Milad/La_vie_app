import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:la_via_app/modules/single_blog_screen.dart';

import '../models/blogs_response.dart';
import '../models/forums_respose.dart';
import '../shared/preferences.dart';

class BlogsScreen extends StatefulWidget {
  const BlogsScreen({Key? key}) : super(key: key);

  @override
  State<BlogsScreen> createState() => _BlogsScreenState();
}

class _BlogsScreenState extends State<BlogsScreen> {
  Blogs blogsResponse = new Blogs();
  List<Plants> data=[];
  List imagesUrl=[];
  @override
  void initState() {
    super.initState();
    getBlogs();
  }

  void getBlogs() async {
    Dio()
        .get(
      'https://lavie.orangedigitalcenteregypt.com/api/v1/products/blogs',
      options: Options(headers: {
        'Authorization':
            'Bearer ${PreferenceUtils.getString(SharedKeys.apiToken)}'
      }),
    )
        .then((response) {
      print(response);
      print('--------------------');
      blogsResponse = Blogs.fromJson(response.data);
      data=blogsResponse.data!.plants!;
      data.forEach((blog){
        imagesUrl.add(blog.imageUrl);
      });
    }).catchError((error) {
      if (error is DioError) {
        print(error.response);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Blogs',
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
        ),
        body:Padding(
          padding: const EdgeInsets.symmetric(horizontal:20),
          child: ListView.separated(
            physics:const AlwaysScrollableScrollPhysics(),
            shrinkWrap: true,
             scrollDirection: Axis.vertical,
             
              itemBuilder: ((context, index) {
                return buildBlogItem(height, width,index);
              }),
              separatorBuilder: (context, index) {
                return Container(
                  height: height * .03,
                );
              },
              itemCount: blogsResponse.data!.plants!.length),
        ));
  }

  Widget buildBlogItem(
    double height,
    double width,
    int index
  ) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => SingleBlogScreen(blogsResponse,index)));
      },
      child: Material(
        borderRadius: BorderRadius.circular(15),
        child: Container(
          alignment: Alignment.center,
          height: height * .177,
          child: Row(
            children: [
              Image.asset(
                'assets/images/Rectangle 15.png',
                height: height * .14,
                width: width * .34,
              ),
              SizedBox(
                width: width * .035,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('2 days ago',
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          color: Theme.of(context).primaryColor)),
                          SizedBox(height: height*.01,),
                  Text('5 Tips to treat plants',
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.w600)),
                          SizedBox(height: height*.01,),
                  Text(blogsResponse.data!.plants![index].description.toString(),
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
