

import 'package:auth_buttons/auth_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:petology/resources/assets%20manager.dart';
import 'package:petology/resources/color_manager.dart';
import 'package:petology/resources/values_manager.dart';
import 'package:petology/screens/widgets/login_widgets.dart';
import 'package:petology/screens/widgets/shared_widgets.dart';
import 'package:petology/shared/components.dart';
import 'package:auth_buttons/auth_buttons.dart'
    show GoogleAuthButton, AuthButtonStyle, AuthButtonType, AuthIconType;

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body()
    );
  }

  Widget body(){
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const Header(),
            const SizedBox(height: 90,),
            LoginArea(),
            SizedBox(height: 80,),
            const Footer(),


          ],
        ),
      ),



    );
  }
}
