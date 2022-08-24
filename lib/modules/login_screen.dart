import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_via_app/cubit/authentication_cubit/authentication_cubit.dart';
import 'package:la_via_app/layout/layout_screen.dart';
import 'package:la_via_app/modules/home_screen.dart';
import 'package:la_via_app/modules/signup_screen.dart';

import '../cubit/authentication_cubit/authentication_states.dart';
import '../shared/components.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
          child: Column(children: [
        Align(
            alignment: Alignment.topRight,
            child: Image.asset(
              'assets/images/green.png',
              height: height * .16,
            )),
        Image.asset(
          'assets/images/logo.png',
          height: height * .1,
          width: width * .4,
        ),
        SizedBox(
          height: height * .01,
        ),
        DefaultTabController(
          length: 2, // length of tabs
          initialIndex: 1,

          child: Column(
            //   crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                child: TabBar(
                  labelColor: Theme.of(context).primaryColor,
                  unselectedLabelColor: Colors.grey,
                  indicatorColor: Theme.of(context).primaryColor,
                  tabs: [
                    Tab(text: 'Signup'),
                    Tab(text: 'Login'),
                  ],
                ),
              ),
              SizedBox(
                height: height * .05,
              ),
              BlocProvider(
                  create: (BuildContext context) => AuthenticationsCubit(),
                  child:
                      BlocConsumer<AuthenticationsCubit, AuthenticationStates>(
                    listener: (context, state) {
                      if (state is LoginSuccessfullyState) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LayoutScreen()));
                      }

                      if(state is SignupSuccessfullyState){
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginScreen()));
                      }
                    },
                    builder: (context, state) {
                      AuthenticationsCubit cubit =
                          AuthenticationsCubit.get(context);
                      return Container(
                        height: height * .8,
                        child: TabBarView(children: <Widget>[
                          Padding(
                            padding:
                                EdgeInsets.symmetric(horizontal: width * .1),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      width: width*.38,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text('First Name'),
                                          defaultTextFormField(
                                              controller:
                                                  cubit.firstNameController,
                                              height: height * .06,
                                              width: width * .37),
                                             cubit.firstNameFlag? Text(cubit.firstNameMessasge,style: TextStyle(color: Colors.red,fontSize: 11),maxLines:2):SizedBox(width: 0,)
                                        ],

                                      ),
                                    ),
                                    SizedBox(
                                      width: width * .03,
                                    ),
                                    Container(
                                      width: width*.38,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text('Last Name'),
                                          defaultTextFormField(
                                              controller:
                                                  cubit.secondNameController,
                                              height: height * .06,
                                              width: width * .37),
                                          cubit.secondNameFlag? Text(cubit.secondNameMessasge,style: TextStyle(color: Colors.red,fontSize: 11),maxLines:2):SizedBox(width: 0,)

                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: height * .02,
                                ),
                                Text('Email'),
                                defaultTextFormField(
                                    controller: cubit.signupEmailController,
                                    height: height * .06),
                                  cubit.emailFlag? Text(cubit.emailMessage,style: TextStyle(color: Colors.red,fontSize: 11),maxLines:1):SizedBox(width: 0,),

                                SizedBox(
                                  height: height * .02,
                                ),
                                Text('Password'),
                                defaultTextFormField(
                                    controller: cubit.signupPasswordController,
                                    height: height * .06),
                                  cubit.passwordFlag? Text(cubit.passwordMessage,style: TextStyle(color: Colors.red,fontSize: 11),maxLines:1):SizedBox(width: 0,),

                                SizedBox(
                                  height: height * .02,
                                ),

                                Text('Confirm Password'),
                                defaultTextFormField(
                                    controller: cubit.signupConfirmPasswordController,
                                    height: height * .06),
                                    
                                 cubit.confirmPasswordFlag?(Text(cubit.passwordMessage,style: TextStyle(color: Colors.red,fontSize: 11),maxLines:2)) 
                                 :(cubit.samePassword==false?Text(cubit.ConfirmPasswordMessage,style: TextStyle(color: Colors.red,fontSize: 11)):SizedBox()),
                                
                                SizedBox(
                                  height: height * .03,
                                ),
                                defaultButton(
                                    width: width * .78,
                                    height: height * .06,
                                    color: Theme.of(context).primaryColor,
                                    label: 'Sign up',
                                    onPressed: () {
                                      cubit.signUp();
                                      
                                    }),
                                 
                                SizedBox(height: height * .01),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Already have an account ?',
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 13),
                                    ),
                                    SizedBox(
                                      width: width * .02,
                                    ),
                                    TextButton(
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    LoginScreen(),
                                              ));
                                        },
                                        child: Text(
                                          'Sign in',
                                          style: TextStyle(
                                              color: Theme.of(context)
                                                  .primaryColor),
                                        ))
                                  ],
                                ),
                                SizedBox(height: height * .01),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      color: Colors.grey,
                                      height: 1,
                                      width: width * .2,
                                    ),
                                    SizedBox(
                                      width: width * .03,
                                    ),
                                    Text('or continue with'),
                                    SizedBox(
                                      width: width * .03,
                                    ),
                                    Container(
                                      color: Colors.grey,
                                      height: 1,
                                      width: width * .2,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: height * .01,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset('assets/images/Google.png'),
                                    SizedBox(
                                      width: width * .08,
                                    ),
                                    Image.asset('assets/images/Facebook.png'),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsets.symmetric(horizontal: width * .1),
                            child: Container(
                              height: height * .3,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Email'),
                                  defaultTextFormField(
                                      controller: cubit.emailController,
                                      height: height * .07),
                                  SizedBox(
                                    height: height * .04,
                                  ),
                                  Text('Password'),
                                  defaultTextFormField(
                                      controller: cubit.passwordController,
                                      height: height * .07),
                                  SizedBox(
                                    height: height * .05,
                                  ),
                                  cubit.errorFlag
                                      ? Text(cubit.errorMessasge,
                                          style: TextStyle(
                                            color: Colors.red,
                                          ),
                                          textAlign: TextAlign.center)
                                      : Text(''),
                                  SizedBox(
                                    height: height * .02,
                                  ),
                                  defaultButton(
                                      width: width * .78,
                                      height: height * .06,
                                      color: Theme.of(context).primaryColor,
                                      label: 'Login',
                                      onPressed: () {
                                        cubit.login();
                                      }),
                                  SizedBox(height: height * .04),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        color: Colors.grey,
                                        height: 1,
                                        width: width * .2,
                                      ),
                                      SizedBox(
                                        width: width * .03,
                                      ),
                                      Text('or continue with'),
                                      SizedBox(
                                        width: width * .03,
                                      ),
                                      Container(
                                        color: Colors.grey,
                                        height: 1,
                                        width: width * .2,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: height * .04,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset('assets/images/Google.png'),
                                      SizedBox(
                                        width: width * .08,
                                      ),
                                      Image.asset('assets/images/Facebook.png'),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ]),
                      );
                    },
                  )),
            ],
          ),
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: Image.asset(
            'assets/images/green2.png',
            height: height * .15,
          ),
        ),
      ])),
    );
  }
}
