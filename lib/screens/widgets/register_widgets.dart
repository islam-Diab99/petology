import 'package:auth_buttons/auth_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petology/screens/home/home_view.dart';
import 'package:petology/screens/login/login_view.dart';
import 'package:petology/screens/login/viewmodel/login_states.dart';
import 'package:petology/screens/register/viewmodel/register_states.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../resources/color_manager.dart';
import '../../shared/components.dart';
import '../register/viewmodel/register_cubit.dart';

class RegisterArea extends StatelessWidget {
  RegisterArea({Key? key}) : super(key: key);
  var firstNameController = TextEditingController();
  var lastNameController = TextEditingController();

  var countryController = TextEditingController();

  var phoneNumberController = TextEditingController();


  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var reEnterPasswordController = TextEditingController();
  var formKey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit,RegisterStates>(
      listener: (context, state){
        if(state is RegisterSuccessState){
          navigateTo(context, HomeView());
        }

      },
      builder:(context, state){return  Form(
        key: formKey,
        child: Column(
          children: [
            // Image(image: AssetImage(ImageAssets.loginDog,),width: 200,height: 150,),
            Container(

              height: 800,
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 30,),
                    const Text('Sign up',style: TextStyle(fontSize: 25,color: primary,fontWeight: FontWeight.bold),),

                    SizedBox(height: 30,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        FacebookAuthButton(
                          onPressed: (){},
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
                    SizedBox(height: 30,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(child: Container(height: 1,color: Colors.black,)),
                        Text('or'),

                        Expanded(child: Container(height: 1,color: Colors.black,)),

                      ],
                    ),


                    SizedBox(height: 20,),
                    defaultFormField(

                      controller: firstNameController,
                      inputType: TextInputType.text,
                      validate: (value) {
                        if (value!.isEmpty) {
                          return 'Must not be empty';
                        }
                      },
                      labelText: 'First Name',

                    ),

                    SizedBox(height: 20,),
                    defaultFormField(

                      controller: lastNameController,
                      inputType: TextInputType.text,
                      validate: (value) {
                        if (value!.isEmpty) {
                          return 'Must not be empty';
                        }
                      },
                      labelText: 'Last Name',

                    ),
                    SizedBox(height: 20,),
                    defaultFormField(

                      controller: phoneNumberController,
                      inputType: TextInputType.text,
                      validate: (value) {
                        if (value!.isEmpty) {
                          return 'Must not be empty';
                        }
                      },
                      labelText: 'Phone Number',

                    ),

                    SizedBox(height: 20,),

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
                    defaultFormField(

                      controller: reEnterPasswordController,
                      inputType: TextInputType.visiblePassword,
                      validate: (value) {
                        if (value!.isEmpty) {
                          return 'fill this field';
                        }
                      },
                      labelText: 'Re-Enter Password',

                    ),
                    SizedBox(height: 20,),
                    defaultFormField(

                      controller: countryController,
                      inputType: TextInputType.text,
                      validate: (value) {
                        if (value!.isEmpty) {
                          return 'Must not be empty';
                        }
                      },
                      labelText: 'Country',

                    ),
                    SizedBox(height: 20,),


                    DefaultButton(
                      onPressed: (){
                        if (formKey.currentState!.validate()) {
                          RegisterCubit.get(context).userRegister(
                            email: emailController.text,
                            password: passwordController.text,
                            lastName: lastNameController.text, country: countryController.text, firstName: firstNameController.text, phoneNumber: phoneNumberController.text,
                          );
                        }

                      },
                      width: double.infinity,
                      height: 50,
                      colour: primary,
                      title: 'Sign up',

                    ),




                    Row(
                      mainAxisAlignment:MainAxisAlignment.center,
                      children: [
                        const Text('Already have an account? '),
                        defaultTextButton(
                            function: (){navigateTo(context, LoginView());}, text: 'LOGIN',fontSize: 13,fontWeight: FontWeight.bold)
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );},

    );
  }
}