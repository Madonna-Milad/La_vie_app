import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_via_app/cubit/blogs_cubit/blogs_states.dart';

import '../../models/blogs_response.dart';
import '../../shared/preferences.dart';

class BlogsCubit extends Cubit<BlogsStates>{
  BlogsCubit() : super(InitialState());


  static BlogsCubit get(context)=>BlocProvider.of(context);



 Blogs blogsResponse = new Blogs();
  List<Plants> data=[];
  List imagesUrl=[];
bool gettingBlogs=false;


   void getBlogs() async {
    gettingBlogs=true;
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
      gettingBlogs=false;
      emit(GettingAllBlogs());
      
    }).catchError((error) {
      if (error is DioError) {
        print(error.response);
      }
    });
  }


  
}