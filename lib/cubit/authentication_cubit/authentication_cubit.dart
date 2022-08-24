import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_via_app/cubit/authentication_cubit/authentication_states.dart';

class AuthenticationsCubit extends Cubit<AuthenticationStates> {
  AuthenticationsCubit() : super(InitialState());

  static AuthenticationsCubit get(context) => BlocProvider.of(context);

  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var signupEmailController = TextEditingController();

  var signupPasswordController = TextEditingController();
  var signupConfirmPasswordController = TextEditingController();

  var firstNameController = TextEditingController();
  var secondNameController = TextEditingController();

  bool firstNameFlag = false;
  bool secondNameFlag = false;
  bool emailFlag = false;
  bool passwordFlag = false;
  bool confirmPasswordFlag = false;
  bool samePassword = false;
  String firstNameMessasge = '';
  String secondNameMessasge = '';
  String emailMessage = '';
  String passwordMessage = '';
  String ConfirmPasswordMessage='';
  bool errorFlag = false;
  String errorMessasge = '';
  String responseType = '';

  void login() {
    Dio().post('https://lavie.orangedigitalcenteregypt.com/api/v1/auth/signin',
        data: {
          "email": "${emailController.text}",
          "password": "${passwordController.text}"
        }).then((response) {
      print(response);
      responseType = response.data['type'];
      print(responseType);
      if (responseType == 'Success') {
        loginSuccessfuly();
      }
    }).catchError((e) {
      errorMessasge = e.response!.data['message'];
      raiseErrorFlag();
    });
  }

  void raiseErrorFlag() {
    errorFlag = true;
    emit(WrongEmailOrPasswordState());
  }

  void loginSuccessfuly() {
    emit(LoginSuccessfullyState());
  }

  void signUp() async {
    try {
      var response = await Dio().post(
          'https://lavie.orangedigitalcenteregypt.com/api/v1/auth/signup',
          data: {
            "firstName": "${firstNameController.text}",
            "lastName": "${secondNameController.text}",
            "email": "${emailController.text}",
            "password": "${passwordController.text}"
          });
      print(response);
      checkAllVlidation();
    } on DioError catch (e) {
      checkAllVlidation();
      print(e.response);
      print(e.response!.data['message'][0]);
    }
  }

  void raiseFirstNameFlag(bool flag) {
    firstNameFlag = flag;
    firstNameMessasge =
        'firstName must be longer than or equal to 3 characters';
    emit(ShortNameState());
  }

  void raiseSecondFlag(bool flag) {
    secondNameFlag = flag;
    secondNameMessasge =
        'lastName must be longer than or equal to 3 characters';
    emit(ShortNameState());
  }

  void raiseShortPasswordFlag(bool flag) {
    passwordFlag = flag;
    passwordMessage = 'password must be longer than or equal to 8 characters';
    emit(ShortNameState());
  }

  void raiseEmailFlag(bool flag) {
    emailFlag = flag;
    emailMessage = 'email must be an email';
    emit(WrongEmailOrPasswordState());
  }

  void raiseShortConfirmPasswordFlag(bool flag) {
    confirmPasswordFlag = flag;
    passwordMessage = 'password must be longer than or equal to 8 characters';
  
    emit(ShortNameState());
  }

  void checkAllVlidation() {
    if (firstNameController.text.length < 2) {
      raiseFirstNameFlag(true);
    } else {
      raiseFirstNameFlag(false);
    }
    if (secondNameController.text.length < 2) {
      raiseSecondFlag(true);
    } else {
      raiseSecondFlag(false);
    }
    if (signupPasswordController.text.length < 7) {
      raiseShortPasswordFlag(true);
    } else {
      raiseShortPasswordFlag(false);
    }
    if (signupConfirmPasswordController.text.length < 7) {
      raiseShortConfirmPasswordFlag(true);
    } else {
      raiseShortConfirmPasswordFlag(false);
    }

    if (emailController.text.length < 3) {
      raiseEmailFlag(true);
    }
    checkPasswordSimilarity();
  }

  void checkPasswordSimilarity() {
    if (signupPasswordController.text == signupConfirmPasswordController.text) {
      samePassword = true;
    } else {
      ConfirmPasswordMessage = 'Not the same Password';
      
    }
    emit(ConfirmedPassword());
  }
}
