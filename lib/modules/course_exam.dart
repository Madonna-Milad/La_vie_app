

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_via_app/cubit/exam_cubit/exam_cubit.dart';
import 'package:la_via_app/cubit/exam_cubit/exam_states.dart';
import 'package:la_via_app/modules/home_screen.dart';
import 'package:la_via_app/shared/components.dart';

class CourseExam extends StatelessWidget {
  
  bool quizVisible;
  CourseExam(this.quizVisible);
 
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;




    return BlocProvider(
      create:(BuildContext context) =>ExamCubit() ,

      child: BlocConsumer<ExamCubit,ExamStates>(
        listener: (context, state) {},
        builder: (context,state){
          ExamCubit cubit=ExamCubit.get(context);

          return  Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              'Course Exam',
              style: TextStyle(
                  fontSize: 19, fontWeight: FontWeight.w500, color: Colors.black),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(30),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text('Question ',
                            style: TextStyle(
                                fontSize: 36, fontWeight: FontWeight.w500)),
                        Text('${cubit.questionNumber}',
                            style: TextStyle(
                                fontSize: 36,
                                fontWeight: FontWeight.w500,
                                color: Colors.green)),
                        Text('/${cubit.questions.length} ',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey)),
                      ]),
                  SizedBox(
                    height: height * .04,
                  ),
                  Text(cubit.questions[0],
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
                  SizedBox(
                    height: height * .054,
                  ),
                  buildChoiceItem(
                      choice: cubit.choices[0],
                      width: width,
                      height: height,
                      color:cubit.isFirstSelected? Colors.green: Colors.white,
                      onTap: (){
                       cubit.chooseFirstChoice();
                       
          
                      }
                      ),
                  SizedBox(
                    height: height * .042,
                  ),
                  buildChoiceItem(
                      choice: cubit.choices[1],
                      width: width,
                      height: height,
                     
                      color:cubit.isSecondSelected? Colors.green: Colors.white,
                      onTap: (){
                       cubit.chooseSecondChoice();
                       
          
                      }),
                  SizedBox(
                    height: height * .042,
                  ),
                  buildChoiceItem(
                      choice: cubit.choices[2],
                      width: width,
                      height: height,
                     color:cubit.isThirdSelected? Colors.green: Colors.white,
                      onTap: (){
                       cubit.chooseThirdChoice();
                       
          
                      }),
                  SizedBox(
                    height: height * .1,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                     cubit. questionNumber != 1
                          ? defaultButton(
                              width: width * .4,
                              height: height * .05,
                              label: 'Back',
                              color: Colors.white,
                              textColor: Theme.of(context).primaryColor,
                              onPressed: () {
                               
                                 cubit.decrementQuestionNumber();
                                  
                                 cubit.setbuttonName();
                             
                              })
                          : SizedBox(
                              width: width * .4,
                            ),
                      SizedBox(
                        width: width * .03,
                      ),
                      defaultButton(
                          width: width * .4,
                          height: height * .05,
                          label: cubit.buttonName,
                          color: Theme.of(context).primaryColor,
                          onPressed: () {
                             if(cubit.questionNumber==cubit.questions.length){
                              cubit.CheckIfAnswered();
                               cubit.disableQuizMark(quizVisible);
                              Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  HomeScreen(quizVisible)));
                              
                               
                              
                            }
                            if(cubit.questionNumber<cubit.questions.length){
                            
                           
                             cubit.CheckIfAnswered();
                              cubit.setbuttonName();
                              
                          
                            }
                            
                          }
                          ),
                    ],
                  )
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
