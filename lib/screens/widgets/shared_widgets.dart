import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../resources/assets manager.dart';
import '../../resources/color_manager.dart';
import '../../shared/components.dart';
class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerRight,
            end: Alignment.centerLeft,
            colors: [
              HexColor('#110B09'),
              HexColor('#56392D'),



            ],
          )
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children:  [


            Container(child: Image(image: AssetImage('assets/images/logo.png'),height: 30,width: 200,
            ))

            ,
            SizedBox(width: 350,),
            Container(
              child:
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  defaultTextButton(
                      function: (){}, text: 'About us',textColor: lightGrey,fontSize: 12),
                  SizedBox(width: 30,),
                  defaultTextButton(
                      function: (){}, text: 'Categories',textColor: lightGrey,fontSize: 12),
                  SizedBox(width: 30,),

                  defaultTextButton(
                      function: (){}, text: 'Services',textColor: lightGrey,fontSize: 12),
                  SizedBox(width: 30,),

                  defaultTextButton(
                      function: (){}, text: 'Request',textColor: lightGrey,fontSize: 12),
                ],)

              ,
            ),
            SizedBox(width: 350,),

            Container(
              child: Row(children: [
                OutlinedButton(
                  onPressed: (){},


                  style: ButtonStyle(


                    shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0),side: BorderSide(color: white))),


                  ),
                  child: const Text("SignUp",style: TextStyle(color: white),),

                ),
                SizedBox(width: 20,),


                DefaultButton(
                  onPressed: (){}, width: 80, height: 35,title: 'Login',colour: white,textColour: Colors.black,),
              ],),
            )








          ],
        ),
      ),
    );
  }
}
class Footer extends StatelessWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200,
      decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerRight,
            end: Alignment.centerLeft,
            colors: [
              HexColor('#110B09'),
              HexColor('#56392D'),




            ],
          )
      ),
      child:Row(

        children: [
          SizedBox(width: 50,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text('For any questions',style: TextStyle(color: lightBrown,fontSize: 30),),
              Row(
                children: [
                  Icon(Icons.email,color: lightBrown,size: 35,),
                  SizedBox(width: 20,),
                  Text('Email@petology.com',style: TextStyle(color: lightBrown,fontSize: 20),),
                ],
              ),

              Row(
                children: [
                  Icon(Icons.phone,color: lightBrown,size: 35,),
                  SizedBox(width: 20),
                  Text('(+2)0123456789',style: TextStyle(color: lightBrown,fontSize: 20),),
                ],
              ),

            ],
          ),
          SizedBox(width: 40,),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('We are waiting you',style: TextStyle(color: lightBrown,fontSize: 30),),
              Row(
                children: [
                  Icon(Icons.location_on,color: lightBrown,size: 35,),
                  SizedBox(width: 20,),
                  Text('First settlement/Cairo',style: TextStyle(color: lightBrown,fontSize: 20),),
                ],
              ),

              Row(
                children: [
                  Icon(Icons.location_on,color: lightBrown,size: 35,),
                  SizedBox(width: 20),
                  Text('Cairo/Egypt',style: TextStyle(color: lightBrown,fontSize: 20),),

                ],
              ),

            ],
          ),
          Spacer(),
          Image(image: AssetImage(ImageAssets.footerDog))
        ],
      ),
    );
  }
}

