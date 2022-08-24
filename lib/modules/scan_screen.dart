import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_via_app/cubit/scan_cubit/scan_cubit.dart';
import 'package:la_via_app/cubit/scan_cubit/scan_states.dart';
import 'package:la_via_app/modules/blogs_screen.dart';
import 'package:la_via_app/shared/components.dart';

class ScanScreen extends StatelessWidget {
  
  

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return BlocProvider(
       create: (context) => ScanCubit(),
      child: BlocConsumer<ScanCubit,ScanStates>(
         listener: (context, state) {},
         
         builder: (context,state){
           ScanCubit cubit =ScanCubit.get(context);
return  Scaffold(
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
                defaultMaterialButton(
                    buttonName: 'Scan Qr Code',
                    onPressed: cubit.scanQr,
                    textColor: Theme.of(context).primaryColor
                    ),
                    
                           cubit.alreadyRead? Padding(
                            padding: EdgeInsets.all(width * .08),
                            child: Container(
                              padding: EdgeInsets.all(10),
                              alignment: Alignment.center,
                              height: height * .1,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.grey),
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
                                  FloatingActionButton(
                                    onPressed: () {
                                    
                                        cubit.displayBottomSheet();
                                     
                                     
                                    },
                                    child: Icon(
                                      Icons.arrow_forward,
                                      size: 20,
                                    ),
                                    mini: true,
                                    backgroundColor: Theme.of(context).primaryColor,
                                  ),
                                ],
                              ),
                            ),
                          ) : SizedBox(  width: 0,)
                        
                         
                      
              ],
            ),
            bottomSheet:cubit.showBottomSheet? Container(
                padding: const EdgeInsets.all(20),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                height: height * .58,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                child:
                    Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  const Text('SNAKE PLANT (SANSEVIERIA)',
                      style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600)),
                  SizedBox(
                    height: height * .02,
                  ),
                  const Text(
                    'Native to southern Africa, snake plants are well adapted to conditions similar to those in southern regions of the United States. Because of this, they may be grown outdoors for part of all of the year in USDA zones 8 and warmer',
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                        fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: height * .03,
                  ),
                  const Text('Common Snake Plant Diseases',
                      style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600)),
                  SizedBox(
                    height: height * .02,
                  ),
                  const Text(
                      'A widespread problem with snake plants is root rot. This results from over-watering the soil of the plant and is most common in the colder months of the year. When room rot occurs, the plant roots can die due to a lack of oxygen and an overgrowth of fungus within the soil. If the snake plant\'s soil is soggy, certain microorganisms such as Rhizoctonia ',
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                          fontWeight: FontWeight.w400)),
                  SizedBox(
                    height: height * .02,
                  ),
                  defaultButton(
                      width: width * .9,
                      height: height * .07,
                      label: 'Go To Blogs',
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => BlogsScreen())));
                      },
                      color: Theme.of(context).primaryColor)
                ]
                )
                ):SizedBox(height: 0,),
                );
         },
       
      ),
    );
  }

 
}
