//import 'dart:js';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_via_app/models/plants_response.dart';

import '../../shared/preferences.dart';
import 'home_states.dart';
import '../../models/product.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(initialState());

  static HomeCubit get(context) => BlocProvider.of(context);
  Product allPlantsResponse = Product();
  SeedsResponse seedsResponse = SeedsResponse();
  SeedsResponse toolsResponse = SeedsResponse();
  SeedsResponse plantsResponse = SeedsResponse();

  void increamentCounter(int index,SeedsResponse response) {
    response.data![index].count++;
    emit(counterPlusState());
  }

  void decreamentCounter(int index,SeedsResponse response) {
  response.data![index].count--;
    emit(counterMinusState());
  }

  void gettAll() async {
    Dio()
        .get(
      'https://lavie.orangedigitalcenteregypt.com/api/v1/products',
      options: Options(headers: {
        'Authorization':
            'Bearer ${PreferenceUtils.getString(SharedKeys.apiToken)}'
      }),
    )
        .then((response) {
      print(response);
      print('--------------------');
      allPlantsResponse = new Product.fromJson(response.data);
     // emit(getAllProductsState());
      //print(seedsResponse.data![0].);
    }).catchError((error) {
      if (error is DioError) {
        print(error.response);
      }
    });
  }

  void getSeeds() async {
    Dio()
        .get(
      'https://lavie.orangedigitalcenteregypt.com/api/v1/seeds',
      options: Options(headers: {
        'Authorization':
            'Bearer ${PreferenceUtils.getString(SharedKeys.apiToken)}'
      }),
    )
        .then((response) {
      print(response);
      print('--------------------');
      seedsResponse = new SeedsResponse.fromJson(response.data);
    //  emit(getSeedsState());
      //print(seedsResponse.data![0].);
    }).catchError((error) {
      if (error is DioError) {
        print(error.response);
      }
    });
  }

  void getPlants() async {
    Dio()
        .get(
      'https://lavie.orangedigitalcenteregypt.com/api/v1/plants',
      options: Options(headers: {
        'Authorization':
            'Bearer ${PreferenceUtils.getString(SharedKeys.apiToken)}'
      }),
    )
        .then((response) {
      print(response);
      print('--------------------');
      plantsResponse = new SeedsResponse.fromJson(response.data);
     // emit(getPlantsState());
      //print(seedsResponse.data![0].);
    }).catchError((error) {
      if (error is DioError) {
        print(error.response);
      }
    });
  }

  void getTools() async {
    Dio()
        .get(
      'https://lavie.orangedigitalcenteregypt.com/api/v1/tools',
      options: Options(headers: {
        'Authorization':
            'Bearer ${PreferenceUtils.getString(SharedKeys.apiToken)}'
      }),
    )
        .then((response) {
      print(response);
      print('--------------------');
      toolsResponse = new SeedsResponse.fromJson(response.data);
     // emit(getToolsState());
      //print(seedsResponse.data![0].);
    }).catchError((error) {
      if (error is DioError) {
        print(error.response);
      }
    });
  }
}
