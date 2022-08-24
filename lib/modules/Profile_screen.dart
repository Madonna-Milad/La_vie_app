import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.keyboard_arrow_left,
              color: Colors.white,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.menu),
              color: Colors.white,
            )
          ],
        ),
        body: Column(
          children: [
            Container(
              height: height * .455,
              width: width,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  ColorFiltered(
                    colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.85), BlendMode.dstATop),
                    child: Image.asset('assets/images/Rectangle 1022.png',
                        width: width,
                      //  height: height * .455,
                        fit: BoxFit.fill,
                        color: Color.fromARGB(121, 26, 23, 23),
                        colorBlendMode: BlendMode.modulate),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CircleAvatar(
                        radius: width * .17,
                        backgroundImage:
                            AssetImage('assets/images/Ellipse 105.png'),
                      ),
                      SizedBox(
                        height: height * .014,
                      ),
                      Text(
                        'Mayar Mohamed',
                        style: TextStyle(color: Colors.white, fontSize: 22),
                      ),
                      SizedBox(
                        height: height * .05,
                      ),
                      Container(
                        height: height * .12,
                        width: width,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10)),
                        ),
                        child: Container(
                           padding: EdgeInsets.all(20),
                          
                          child: Row(
                            children: [
                              Image.asset(
                                'assets/images/Group 1264.png',
                                width: width * .08,
                                height: height * .04,
                              ),
                              SizedBox(
                                width: width * .03,
                              ),
                              Text('You have 30 points',style: TextStyle(color: Colors.black, fontSize: 15,fontWeight: FontWeight.w500),),
                            ],
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
               
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Edit Profile'),
                  SizedBox(height: height*.025),
                  
                    Material(
                      
                      elevation: 5,
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        alignment: Alignment.center,
                        height:height*.09,
                        child: ListTile(
                          leading: Image.asset('assets/images/icon.png'),
                          title: Text('Change Name'),
                          trailing: IconButton(icon: Icon(Icons.arrow_forward),onPressed: (){},),
                        ),
                      ),
                    ),
                  
                    SizedBox(height: height*.028),
                  Material(
                      
                      elevation: 5,
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        alignment: Alignment.center,
                        height:height*.09,
                        child: ListTile(
                          leading: Image.asset('assets/images/icon.png'),
                          title: Text('Change Email'),
                          trailing: IconButton(icon: Icon(Icons.arrow_forward),onPressed: (){},),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ));
    
  }
}
