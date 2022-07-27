import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:petology/resources/color_manager.dart';

import 'constants.dart';


class DefaultButton extends StatelessWidget {
   DefaultButton(
      {Key? key,
      this.colour,
      this.title,
        this.textColour=white,
      required this.onPressed,
      required this.width,
      required this.height
      })
      : super(key: key);
  final Color? colour;
  final String? title;
  final VoidCallback onPressed;
  final double width;
  final double height;
   Color? textColour;


  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: colour,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50),
      ),
      onPressed: onPressed,
      minWidth: width,
      height: height,
      child: Text(title!,
          style:  TextStyle(
            color: textColour,
          )),
    );
  }
}

Widget defaultFormField({
  required TextEditingController controller,
  @required TextInputType? inputType,
  var suffixPressed,
  var onSubmit,
  var onChange,
  var onTap,
  String? labelText,
  var isPassword = false,
  required String? Function(String? value)? validate,
  IconData? prefix,
  IconData? suffix,

}) {
  return Container(
    decoration:  BoxDecoration(
      
      color:  Colors.white,
      borderRadius: BorderRadius.circular(15),
      boxShadow: <BoxShadow>[
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 1,
          blurRadius: 1,
          offset: Offset(0, 1), // changes position of shadow
        ),
      ],
    ),

    child: TextFormField(

      controller: controller,
      keyboardType: inputType,
      onFieldSubmitted: onSubmit,
      onChanged: onChange,
      validator: validate,
      obscureText: isPassword,
      onTap: onTap,
      decoration: InputDecoration(
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
        suffixIcon: IconButton(
          onPressed: suffixPressed,
          icon: Icon(suffix),
        ),
        labelText: labelText,
        prefixIcon: Icon(prefix),

      ),
    ),
  );
}

Widget defaultTextButton(
        {@required function,
        required String text,
         Color textColor = primary,
          double fontSize=10,
          var fontWeight=FontWeight.w100
        }
    ) =>
    TextButton(
      onPressed: function,
      child: Text(
        text.toUpperCase(),
        style: TextStyle(color: textColor,fontSize: fontSize,fontWeight: fontWeight),

      ),
    );

void navigateTo(context, widget) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
void navigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
        context, MaterialPageRoute(builder: (context) => widget),
        (Route<dynamic> route) {
      return false;
    });
void showToast(String message) => Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
    textColor: Colors.white,
    timeInSecForIosWeb: 5,
    fontSize: 16);


class pages extends StatefulWidget {
  @override
  _pagesState createState() => _pagesState();

}

class _pagesState extends State<pages> {

  List<String> pages = ['About us', 'Categories', 'Services', 'Request',];
  int selectedIndex=0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: SizedBox(
        height: 25,
        child: ListView.builder(
          itemBuilder: (context,index)=>buildCategory(index),
          itemCount: pages.length,
          scrollDirection: Axis.horizontal,
        ),
      ),
    );
  }
  Widget buildCategory(int index)
  {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
         defaultTextButton(function: (){
           selectedIndex=index;
         }, text: pages[index],fontSize: 30,textColor: lightGrey),
          Container(
            margin: const EdgeInsets.only(top: 5),
            height: 2,
            width: 30,
            color: selectedIndex==index? Colors.black : Colors.transparent,
          ),
        ],

      ),
    );
  }
}