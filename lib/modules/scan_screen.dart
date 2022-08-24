import 'package:flutter/material.dart';

class ScanScreen extends StatelessWidget {
  const ScanScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          ColorFiltered(
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.9), BlendMode.dstATop),
            child: Image.asset(
                'assets/images/Meet the Maker_ Nathalie Gibbins _ Rose & Grey 1.png',
                width: width,
                fit: BoxFit.fill,
                color: Color.fromARGB(121, 255, 255, 255),
                colorBlendMode: BlendMode.modulate),
          ),
          Padding(
            padding:  EdgeInsets.all(width*.08),
            child: Container(
              padding: EdgeInsets.all(10),
              alignment: Alignment.center,
              height: height * .1,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Colors.grey),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'SNAKE PLANT (SENSEVIERIA)',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        'Native to southern Africa',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w400),
                      )
                    ],
                  ),
                  SizedBox(
                    width: width * .04,
                  ),
                  FloatingActionButton(onPressed: (){},child:Icon(Icons.arrow_forward,size: 20,) ,mini: true,backgroundColor: Theme.of(context).primaryColor,),
                  
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
