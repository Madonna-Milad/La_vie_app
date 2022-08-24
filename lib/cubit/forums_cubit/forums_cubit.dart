import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_via_app/cubit/forums_cubit/forums_state.dart';

import '../../models/forums_respose.dart';
import '../../shared/preferences.dart';

class ForumsCubit extends Cubit<ForumsStates>{
  ForumsCubit() : super(InitialState());


  static ForumsCubit get(context) => BlocProvider.of(context);
 bool likePressed = false;
 Forums formusResponse = new Forums();
   Forums myFormusResponse = new Forums();

  void toggleLikeButton(){
    likePressed = !likePressed;
    emit(ChangeLikeState());
  }

void increamentLikesNumber(int index){
  likePressed ?formusResponse.data![index].forumLikes!.length+=1:formusResponse.data![index].forumLikes!.length-=1;
emit(ChangelikesNumber());
}



 void getAllForums() async {
    Dio()
        .get(
      'https://lavie.orangedigitalcenteregypt.com/api/v1/forums',
      options: Options(headers: {
        'Authorization':
            'Bearer ${PreferenceUtils.getString(SharedKeys.apiToken)}'
      }),
    )
        .then((response) {
      print(response);
      print('--------------------');
      formusResponse = Forums.fromJson(response.data);
      print(formusResponse.data![0].title);
      print(formusResponse.data!.length);
    }).catchError((error) {
      if (error is DioError) {
        print(error.response);
      }
    });
  }

   void getMyForums() async {
    Dio()
        .get(
      'https://lavie.orangedigitalcenteregypt.com/api/v1/forums/me',
      options: Options(headers: {
        'Authorization':
            'Bearer ${PreferenceUtils.getString(SharedKeys.apiToken)}'
      }),
    )
        .then((response) {
      print(response);
      print('--------------------');
      myFormusResponse = Forums.fromJson(response.data);
      print(myFormusResponse.data![0].title);
      print(myFormusResponse.data!.length);
    }).catchError((error) {
      if (error is DioError) {
        print(error.response);
      }
    });
  }

}