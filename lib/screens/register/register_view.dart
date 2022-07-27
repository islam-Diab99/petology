
import 'package:flutter/material.dart';
import 'package:petology/screens/widgets/register_widgets.dart';

import '../widgets/shared_widgets.dart';

class RegisterView extends StatelessWidget {
   RegisterView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: body()
    );
  }

  Widget body(){
    return SafeArea(
      child: SingleChildScrollView(
        child:
        Column(
          children: [
            const Header(),
            const SizedBox(height: 90,),
            RegisterArea(),
            const SizedBox(height: 80,),
            const Footer(),


          ],
        ),
      ),



    );
  }
  }

