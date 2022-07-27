import 'package:flutter/material.dart';

class CircleInformation extends StatelessWidget {
  const CircleInformation({
    Key? key,
    required this.image,
    required this.title,
    this.leftPadding = 45.0,
  }) : super(key: key);
  final String image;
  final String title;
  final double leftPadding;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 50.0),
          child: CircleAvatar(
            radius: 95,
            backgroundColor: Color(0xff492F24),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: leftPadding),
          child: Column(
            children: [
              SizedBox(
                  height: 120,
                  child: Image.asset(
                    'assets/icons/$image.png',
                  )),
              SizedBox(
                height: 40.0,
              ),
              Text(
                '$title',
                style: const TextStyle(
                  fontFamily: 'Arial',
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xffFFE3C5),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}






class DefaultHomeButton extends StatelessWidget {
  const DefaultHomeButton({
    Key? key,
    required this.height,
    required this.width,
    required this.buttonColor,
    required this.radius,
    this.borderColor = Colors.transparent,
    this.borderWidth = 0.0,
    required this.title,
    required this.textColor,
    this.fontWeight,
    this.fontSize = 20.0,
    this.iconData,
    this.iconColor,
    this.iconSize,
    required this.onPress,
  }) : super(key: key);

  final double height;
  final double width;
  final Color buttonColor;
  final double radius;
  final Color borderColor;
  final double borderWidth;
  final String title;
  final Color textColor;
  final FontWeight? fontWeight;
  final double? fontSize;
  final IconData? iconData;
  final Color? iconColor;
  final double? iconSize;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        onPressed: onPress,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(buttonColor),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius),
              side: BorderSide(
                color: borderColor,
                width: borderWidth,
              ),
            ),
          ),
        ),
        child: Row(
          children: [
            Expanded(
              flex: 40,
              child: Center(
                child: Text(
                  title,
                  style: TextStyle(
                    fontFamily: 'Arial',
                    fontSize: fontSize,
                    fontWeight: fontWeight,
                    color: textColor,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Icon(
                iconData,
                color: iconColor,
                size: iconSize,
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class DefaultCard extends StatelessWidget {
  const DefaultCard({
    Key? key,
    required this.image,
    required this.name,
    this.colorCard = Colors.transparent,
    this.widthBorder = 0.3,
    this.colorBorder = Colors.transparent,
    this.colorButton = Colors.white,
    this.textButtonColor,
    this.widthButton = 5.0,
    this.colorButtonBorder = Colors.transparent,
    this.bottomName,
    this.bottom = false,
  }) : super(key: key);

  final String image;
  final String name;
  final Color colorCard;
  final double widthBorder;
  final Color colorBorder;
  final Color colorButton;
  final Color? textButtonColor;
  final double widthButton;
  final Color colorButtonBorder;
  final String? bottomName;
  final bool bottom;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 470,
      width: 310,
      decoration: BoxDecoration(
        color: colorCard,
        borderRadius: BorderRadius.circular(50),
        border: Border.all(width: widthBorder, color: colorBorder),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 300,
            child: Image.asset('assets/images/$image.png'),
          ),
          Text(
            name,
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Color(0xff492F24),
            ),
          ),
          SizedBox(height: 20),
          DefaultHomeButton(
            onPress: () {},
            height: 62,
            width: 225,
            buttonColor: colorButton,
            radius: 28.0,
            title: '    Read more',
            textColor: textButtonColor!,
            fontWeight: FontWeight.bold,
            borderColor: colorButtonBorder,
            borderWidth: widthButton,
          ),
          SizedBox(height: 10.0),
          bottom
              ? Column(
            children: [
              Text(
                'By $bottomName',
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xff492F24),
                ),
              ),
              SizedBox(height: 5.0),
              Container(
                height: 5.0,
                width: 90.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xffFFE3C5),
                ),
              ),
            ],
          )
              : Container(),
        ],
      ),
    );
  }
}


class DogCatCard extends StatelessWidget {
  const DogCatCard({
    Key? key,
    required this.image,
    required this.title,
    required this.onTap,
  }) : super(key: key);
  final String image;
  final String title;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 230,
        width: 220,
        decoration: BoxDecoration(
          color: Color(0xffFFE3C5),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(width: 3.0, color: const Color(0xff492F24)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 90.0,
              child: Image.asset('assets/icons/$image.png'),
            ),
            SizedBox(height: 20),
            Text(
              '$title',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Color(0xff492F24),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class CircleArrow extends StatelessWidget {
  const CircleArrow({
    Key? key,
    required this.icon,
  }) : super(key: key);
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CircleAvatar(
        child: Icon(
          icon,
          color: Colors.white,
          size: 35,
        ),
        radius: 28.0,
        backgroundColor: Color(0xff492F24),
      ),
    );
  }
}