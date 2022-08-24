import 'package:flutter/material.dart';
import 'package:la_via_app/models/blogs_response.dart';

class SingleBlogScreen extends StatelessWidget {
   //SingleBlogScreen(Blogs blogsResponse, {Key? key}) : super(key: key);
Blogs blogsResponse;
int index;

SingleBlogScreen(this.blogsResponse,this.index);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        children: [
          Image.asset(
            'assets/images/Rectangle 15.png',
            height: height * .33,
            width: width,
            fit: BoxFit.cover,
          ),
          SizedBox(
            height: height * .04,
          ),

          Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '5 Simple Tips to treat plants',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
                 SizedBox(
              height: height * .02,
            ),
            Text(
              blogsResponse.data!.plants![index].description.toString(),
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400,color: Colors.grey),
            ),
              ],
            ),
          
         
        ],
      ),
    );
  }
}
