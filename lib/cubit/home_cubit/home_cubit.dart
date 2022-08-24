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
 bool getProducts=false;
  bool getAllPlants=false;
   bool getAllSeeds=false;
    bool getAllTools=false;


List <SeedsResponse> search=[];
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
    getProducts=true;
 
    emit(LoadingState());
    Dio()
        .get(
      'https://lavie.orangedigitalcenteregypt.com/api/v1/products',
      options: Options(headers: {
        'Authorization':
            'Bearer ${PreferenceUtils.getString(SharedKeys.apiToken)}'
      }),
    )
        .then((response) {
      // print(response);
      // print('--------------------');
      //search=response.data[]
      allPlantsResponse = new Product.fromJson(response.data);

      getProducts=false;
      emit(getAllProductsState());
     
    }).catchError((error) {
      if (error is DioError) {
        print(error.response);
      }
    });
  }

  void getSeeds() async {
   
   bool getAllSeeds=true;
  
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
      getAllSeeds=false;
      emit(getSeedsState());
     
    }).catchError((error) {
      if (error is DioError) {
        print(error.response);
      }
    });
  }

  void getPlants() async {
     getAllPlants=true;
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
      getAllPlants=false;
      emit(getPlantsState());
      //print(seedsResponse.data![0].);
    }).catchError((error) {
      if (error is DioError) {
        print(error.response);
      }
    });
  }

  void getTools() async {
    bool getAllTools=true;
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
      getAllTools=false;
      emit(getToolsState());
      //print(seedsResponse.data![0].);
    }).catchError((error) {
      if (error is DioError) {
        print(error.response);
      }
    });
  }


  void searchForItems(String? id){
    emit(LoadingSearchState());

    Dio()
        .get(
      'https://lavie.orangedigitalcenteregypt.com/api/v1/tools/:${id}',
      options: Options(headers: {
        'Authorization':
            'Bearer ${PreferenceUtils.getString(SharedKeys.apiToken)}'
      }),
    )
        .then((response) {
      // print(response);
      // print('--------------------');
      toolsResponse = new SeedsResponse.fromJson(response.data);
      getAllTools=false;
      emit(getToolsState());
      search=toolsResponse.data! as List<SeedsResponse>;
      print(search[0]);
    }).catchError((error) {
      if (error is DioError) {
        print(error.response);
      }
    });
  }
}
