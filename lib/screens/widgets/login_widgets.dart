
import 'package:auth_buttons/auth_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
<<<<<<< HEAD
import 'package:petology/screens/home/home_view.dart';
=======
>>>>>>> a84024f7b5cfa6aaa282c3e95ae394016a619cfd
import 'package:petology/screens/login/viewmodel/login_cubit.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../resources/assets manager.dart';
import '../../resources/color_manager.dart';
import '../../shared/components.dart';
import '../login/viewmodel/login_states.dart';
import '../register/register_view.dart';

class LoginArea extends StatelessWidget {
  LoginArea({Key? key}) : super(key: key);
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formkey =GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit,LoginStates>(
      listener: (context,state){},
      builder: (context,state){
<<<<<<< HEAD
        if (state is LoginSuccessState){
          navigateAndFinish(context, HomeView());
        }

=======
>>>>>>> a84024f7b5cfa6aaa282c3e95ae394016a619cfd
        if (state is FaceBookLoginSuccessState){
          launchUrl(state.uri);
        }
        return
          Form(
            key: formkey,
            child:
            Column(
              children: [
                Image(image: AssetImage(ImageAssets.loginDog,),width: 200,height: 150,),
                Container(

                  height: 500,
                  width: 500,
                  decoration: BoxDecoration(
                      border:Border.all(
                        color: primary,

                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(40),

                      )

                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(height: 40,),
                          Text('LOGIN',style: const TextStyle(fontSize: 18,color: primary,fontWeight: FontWeight.w600),),
                          SizedBox(height: 40,),
                          defaultFormField(
                              labelText: 'Email',

                              controller: emailController,
                              inputType: TextInputType.emailAddress,
                              validate:  (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter your email';
                                }}

                          ),
                          SizedBox(height: 20,),
                          defaultFormField(

                            controller: passwordController,
                            inputType: TextInputType.visiblePassword,
                            validate: (value) {
                              if (value!.isEmpty) {
                                return 'Password is to short';
                              }
                            },
                            labelText: 'Password',

                          ),
                          SizedBox(height: 20,),

                          DefaultButton(
                            onPressed: (){
                              if(formkey.currentState!.validate()){
                                LoginCubit.get(context).userLogin(
                                    email: emailController.text,
                                    password: passwordController.text);
                              }
                            },
                            width: double.infinity,
                            height: 50,
                            colour: primary,
                            title: 'Login',

                          ),
                          SizedBox(height: 30,),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(child: Container(height: 1,color: Colors.black,)),
                              Text('or'),

                              Expanded(child: Container(height: 1,color: Colors.black,)),

                            ],
                          ),
                          SizedBox(height: 30,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [

                              FacebookAuthButton(
                                onPressed: (){
                                  LoginCubit.get(context).faceBookLogin();
                                },
                                style:  const AuthButtonStyle(

                                    height: 60,
                                    width: 4,
                                    buttonColor: blue,
                                    textStyle: TextStyle(color: Colors.white),
                                    iconSize: 20,
                                    borderRadius: 50


                                ),
                              ),
                              SizedBox(width: 20,),
                              GoogleAuthButton(
                                onPressed: (){},
                                style:  const AuthButtonStyle(
                                  iconType: AuthIconType.secondary,
                                  height: 60,
                                  width: 4,
                                  buttonColor: Colors.white,
                                  textStyle: TextStyle(color: Colors.black),
                                  iconSize: 20,
                                  borderRadius: 50,




                                ),
                              ),



                            ],
                          ),
                          SizedBox(height: 20,),

                          Row(
                            mainAxisAlignment:MainAxisAlignment.center,
                            children: [
                              Text('Don\'t Have Account? '),
                              defaultTextButton(
                                  function: (){
                                    navigateTo(context, RegisterView());
                                  }, text: 'SIGNUP',fontSize: 13,fontWeight: FontWeight.bold)
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
      },
    );
  }
}
