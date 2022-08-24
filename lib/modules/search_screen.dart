import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_via_app/cubit/home_cubit/home_cubit.dart';
import 'package:la_via_app/cubit/home_cubit/home_states.dart';
import 'package:la_via_app/shared/components.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var searchController=TextEditingController();
     double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
   
    bool isFound=true;

    return BlocProvider(
      create: (context) => HomeCubit(),
      child: BlocConsumer<HomeCubit,HomeStates>(
        listener: (context, state) {},
        builder: (context,state){
          HomeCubit cubit=HomeCubit.get(context);
return  Scaffold(
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  defaultTextFormField(controller: searchController,
                 
                  label: 'Search',
                  height: height*.08,
                  width: width*.89,
                  onChange: (value){
                      
                  }
                  
                  ),
          
                  SizedBox(height:height*.025 ,),
                  isFound?Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Recent searches',style: TextStyle(color: Colors.grey),),
                      Row(children: [
                        Icon(Icons.access_time,),
                        SizedBox(width: width*.028,),
                        Expanded(child: Text('Search 1')),
                        IconButton(onPressed: (){}, icon: Icon(Icons.remove)),
          
          
                      ],)
                    ],
                  ):
                    Center(
                      heightFactor: 1.5,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset('assets/images/Frame.png',height:height*.27,width: width*.58,),
                            SizedBox(height: height*.04,),
                            Text('Not found',style: TextStyle(fontSize:24,fontWeight:FontWeight.w700),),
                           SizedBox(height: height*.013,),
                            Text('Sorry, the keyword you entered cannot be found, please check again or search with another keyword.',
                            style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400,color: Colors.grey),)
                          ],
                        ),
                      ),
                    ),
                  
                ],
              ),
            ),
          ),
        );
        },
        
      ),
    );
  }
}