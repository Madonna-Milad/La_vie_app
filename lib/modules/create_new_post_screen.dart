import 'dart:ui';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:la_via_app/shared/components.dart';

class CreateNewPostScreen extends StatelessWidget {
 CreateNewPostScreen({ Key? key }) : super(key: key);
  var titleController=TextEditingController();
 var descriptionController=TextEditingController();

  void createNewPost() async {
    try {
      var response = await Dio().post(
          'https://lavie.orangedigitalcenteregypt.com/api/v1/auth/signup',
          data: {
            "title": "${titleController}",
            "description": "${descriptionController}",
            "imageBase64": "",
           
          });
      print(response);
    
     
    } on DioError catch (e) {
    

      print(e.response);
   
    
    }
  }


  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon:Icon(Icons.arrow_back),onPressed:(){
          Navigator.pop(context);
        } ,color: Colors.black,),
        title:Text('Create New post',style: TextStyle(color: Colors.black,fontSize: 21,fontWeight: FontWeight.w700),),
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  border: Border.all(color: Theme.of(context).primaryColor,),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(children: [
                IconButton(onPressed: (){}, icon: Icon(Icons.add,color: Theme.of(context).primaryColor,),),
                Text('Add a photo',style: TextStyle(color:Theme.of(context).primaryColor),),
               
                
              ],
              
              ),
              
              ),
              
            ],
          ),
          SizedBox(height:height*.06),
              Text('Title',style: TextStyle(color:Colors.grey)),
              SizedBox(height: height*.015,),
              defaultTextFormField(controller: titleController,width: width*.9,height: height*.06),
              SizedBox(height: height*.03,),
               Text('Description',style: TextStyle(color:Colors.grey)),
              SizedBox(height: height*.015,),
              defaultTextFormField(controller: descriptionController,width: width*.9,height:height*.15),
               SizedBox(height: height*.07,),
              defaultButton(width: width*.9,height: height*.06, label: 'Post', onPressed: (){
                createNewPost();
              },color: Theme.of(context).primaryColor)
        ]),
      ),
    );
  }
}