import 'package:flutter/material.dart';
import 'package:la_via_app/modules/login_screen.dart';

import '../shared/preferences.dart';

class SplachScreen extends StatefulWidget {
  const SplachScreen({ Key? key }) : super(key: key);

  @override
  State<SplachScreen> createState() => _SplachScreenState();
}

class _SplachScreenState extends State<SplachScreen> {

  @override
void initState() {
    
    super.initState();
    Future.delayed(Duration(seconds: 3)).then((value) {
       Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen(),)
       );
    }
   
    );
     PreferenceUtils.init();
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        
         body: Center(
            child: Image.asset('assets/images/logo.png',),
          ),
        
      );
    
  }
}