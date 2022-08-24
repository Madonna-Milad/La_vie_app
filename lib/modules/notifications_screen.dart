import 'package:flutter/material.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Notifacations',
          style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500,color: Colors.black),
          
        ),
      ),
      body: ListView.separated(
          itemBuilder: (context, int) {
            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  CircleAvatar(
                   radius: 16,
                        
                      child: ClipRRect(
                          child: Image.asset(
                        'assets/images/Initials.png',
                        height: 50,width: 50,
                      ),
                      //borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                     SizedBox(
                  width: width * .03,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Joy Arnold left 6 comments on Your Post',maxLines: 2,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                    ),
                    Text(
                      'yesterday at 12:00 am',
                      style: TextStyle(color: Colors.grey,fontSize: 14),
                    ),
                  ],
                )
                  ],),
            );
               
              
            
          },
          separatorBuilder: (context, int) {
            return Container(
              height: 1,
              color: Colors.grey,
            );
          },
          itemCount: 10),
    );
  }
}
