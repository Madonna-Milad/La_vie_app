// import 'dart:js';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_via_app/cubit/exam_cubit/exam_states.dart';

class ExamCubit extends Cubit<ExamStates> {
  ExamCubit() : super(InitialState());

  static ExamCubit get(context) => BlocProvider.of(context);

  bool isFirstSelected = false;
  bool isSecondSelected = false;
  bool isThirdSelected = false;
  int questionNumber = 1;
  String buttonName = 'Next';

  List<String> questions = [
    'What is the user experience ?',
    'What is the user experience ?',
    'What is the user experience ?',
  ];
  List<String> choices = [
    'The user experience is how a developer feels about user',
    'The user experience is how the user feel about interacting with or experiencing the product',
    'The user experience is the attitude the UX designer has about the product',
  ];

  void chooseFirstChoice() {
    isFirstSelected = true;
    isSecondSelected = false;
    isThirdSelected = false;
    emit(FirstChoiceChosenState());
  }

  void chooseSecondChoice() {
    isFirstSelected = false;
    isSecondSelected = true;
    isThirdSelected = false;
    emit(SecondChoiceChosenState());
  }

  void chooseThirdChoice() {
    isFirstSelected = false;
    isSecondSelected = false;
    isThirdSelected = true;
    emit(ThirdChoiceChosenState());
  }

  void setbuttonName() {
    if (questionNumber == questions.length) {
      buttonName = 'Finish';
      emit(ChangeButtonNameState());
    } else {
      buttonName = 'Next';
      emit(ChangeButtonNameState());
    }
  }

  void decrementQuestionNumber() {
    questionNumber--;
    emit(ChangeQuetionNumberState());
  }

  void CheckIfAnswered() {
    if (isFirstSelected || isSecondSelected || isThirdSelected) {
      questionNumber++;
      isFirstSelected = false;
      isSecondSelected = false;
      isThirdSelected = false;
    }
    emit(QuestionAnsweredState());
  }

  void disableQuizMark(bool quizVisible){
    quizVisible=false;
    emit(ChangeExamMarkState());
  }
  
}
