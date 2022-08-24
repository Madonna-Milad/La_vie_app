import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_via_app/cubit/cart_cubit/cart_states.dart';
import 'package:la_via_app/cubit/cart_cubit/cart_cubit.dart';
import 'package:la_via_app/layout/layout_screen.dart';
import 'package:la_via_app/shared/components.dart';
import 'package:la_via_app/shared/constants.dart';

class CartScreen extends StatelessWidget {
  
  bool isEmpty = false;
 
  double price=100;
 

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    
    return BlocProvider(
      create: (BuildContext context) =>CartCubit(),
      child: BlocConsumer<CartCubit,CartStates>(
        listener: (context, state) {},
        builder: (context,state){
          CartCubit cubit =CartCubit.get(context);
          cubit.calculateTotatlPrice();
          return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.push(context,MaterialPageRoute(builder: ((context)=>LayoutScreen())));
              },
            ),
            centerTitle: true,
            title: Text('My Cart',
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w700,
                    color: Colors.black)),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: boughtItems.length==0?
                   Column(children: [
                      Center(
                        heightFactor: 1.5,
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/images/Frame.png',
                                height: height * .27,
                                width: width * .58,
                              ),
                              SizedBox(
                                height: height * .04,
                              ),
                              Text(
                                'Your Cart is empty',
                                style: TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.w700),
                              ),
                              SizedBox(
                                height: height * .013,
                              ),
                              Text(
                                'Sorry, the keyword you entered cannot be found, please check again or search with another keyword.',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.grey),
                              )
                            ],
                          ),
                        ),
                      ),
                    ])
                  : Column(
                      children: [
                        ListView.separated(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: boughtItems.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Material(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                                elevation: 3,
                                child: Container(
                                  padding: EdgeInsets.all(20),
                                  height: height * .2,
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        'assets/images/Rectangle 15.png',
                                        width: width * .3,
                                        height: height * .18,
                                      ),
                                      SizedBox(
                                        width: width * .04,
                                      ),
                                      Expanded(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(boughtItems[index].name.toString()),
                                            SizedBox(
                                              height: height * .017,
                                            ),
                                            Text(
                                              '${price* boughtItems[index].count} Egp',
                                              style: TextStyle(
                                                  color: Theme.of(context)
                                                      .primaryColor),
                                            ),
                                            SizedBox(
                                              height: height * .01,
                                            ),
                                            Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                color: Colors.grey[100],
                                              ),
                                              width: width * .25,
                                              height: height * .05,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  defaultMaterialButton(
                                                      buttonName: '-',
                                                      onPressed: () {
                                                      cubit.decreamentCounter(index);
                                                       
                                                       cubit.calculateTotatlPrice();
                                                       if (boughtItems[index].count == 0) {
                                                         cubit.removeCartItem(index);
     
                                                     }
                                                      
                                                       
                                                      },
                                                      width: width * .09,
                                                      textColor: Theme.of(context)
                                                          .primaryColor),
                                                 
                                                  Text(
                                                   boughtItems[index].count.toString(),
                                                    style: TextStyle(fontSize: 15),
                                                  ),
                                                  defaultMaterialButton(
                                                      buttonName: '+',
                                                      onPressed: () {
                                                       
                                                        cubit.increamentCounter(index) ;
                                                         cubit.calculateTotatlPrice();
                                                        
                                                      },
                                                      width: width * .09,
                                                      textColor: Theme.of(context)
                                                          .primaryColor),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      Align(
                                          alignment: Alignment.bottomCenter,
                                          child: IconButton(icon:Icon(Icons.delete,
                                            color: Theme.of(context).primaryColor,),
                                            onPressed: (){
                                            
                                                cubit.removeCartItem(index) ;
                                                 cubit.calculateTotatlPrice();
                                            
                                           
                                            },
                                            
                                          )),
                                    ],
                                  ),
                                ),
                              );
                            },
                            separatorBuilder: (context, index) {
                              return Container(
                                height: height * .023,
                              );
                            }),
                      ],
                    ),
            ),
          ),
          bottomSheet: Container(
            padding: EdgeInsets.all(20),
            height: height * .18,
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                        child: Text('Total',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w600))),
                    Text(
                      cubit.totalPrice.toString(),
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    )
                  ],
                ),
                SizedBox(
                  height: height * .03,
                ),
                defaultButton(
                    width: width * .8,
                    height: height * .05,
                    label: 'Checkout',
                    onPressed: () {},
                    color: Theme.of(context).primaryColor)
              ],
            ),
          ),
        );
        },
        
      ),
    );
  }
}
