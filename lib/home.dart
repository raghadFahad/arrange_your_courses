import 'package:flutter/material.dart';
import 'package:arrange_your_courses/main.dart';
import 'package:arrange_your_courses/signUp.dart';
import 'package:arrange_your_courses/signin.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
  }

  double height;
  double width;
  double fontScale;

  @override
  Widget build(BuildContext context) {
    if (MediaQuery.of(context).orientation == Orientation.portrait) {
      height = MediaQuery.of(context).size.height;
      width = MediaQuery.of(context).size.width;
      fontScale = width * 0.015;
    } else {
      height = MediaQuery.of(context).size.width;
      width = MediaQuery.of(context).size.height;
      fontScale = width * 0.015;
    }
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            space(0.06),
            sizedBoxPic(height * 0.27, "images/arrange your courses logo.png"),
            space(0.013),
            titleText("مرحباً بك", 5),
            space(0.003),
            subtitleText("نظم مواعيد دوراتك بمساعدة تطبيق نظم دوراتك",2.7),
            space(0.02),
            ovalButton(context,"تسجيل الدخول", Color.fromRGBO(241, 151, 134, 0.4),Color.fromRGBO(241, 151, 134, 1),Signin()),
            space(0.001),
            ovalButton(context,"إنشاء حساب جديد",Color.fromRGBO(132, 134, 247, 0.4) ,Color.fromRGBO(132, 134, 247, 1), SignUp()),
            space(0.027),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [],
            ),

          ],
        ),
      ),

    );}

//////////

  Widget line(double w) {
    return Image.asset(
      "images/Line 3.png",
      width: width * w,
    );
  }
  Widget space(double h){
    return Padding(
      padding: EdgeInsets.symmetric(vertical: height * h)
    );
  }
//  Widget flatButtonPic(String picPath, double width, Widget page, BuildContext context) {
//    return FlatButton(
//      onPressed: (){
//        Navigator.of(context).push(MaterialPageRoute(builder: (context) => page));
//      },
//      child: FaIcon(FontAwesomeIcons.googlePlus,size:width*0.8,color: Colors.black,),
//    );
//  }
  Widget circleButton(IconData icon, Color backColor, Widget page, BuildContext context){
    return RawMaterialButton(
      onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => page));
      },
      elevation: 2.0,
      fillColor: backColor,
      child: FaIcon(icon,color: Colors.white, size: width*0.09,),
      padding: EdgeInsets.all(width *0.035),
      shape: CircleBorder(),
    );
  }
  Widget sizedBoxPic(double height, String image) {
    return SizedBox(
      height: height,
      child: Image.asset(
        image,
        fit: BoxFit.contain,
      ),
    );
  }
  Widget titleText(String text, double f) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontScale * f,
        color: Colors.black,
        fontWeight: FontWeight.bold
      ),
      textAlign: TextAlign.center,
    );}

  Widget subtitleText(String text, double f) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontScale * f,
        color: Colors.grey,
      ),
      textAlign: TextAlign.center,
    );}


  Widget ovalButton(BuildContext context,String text, Color color1, Color color2,Widget page){
    return  Container(
        padding: const EdgeInsets.only(top: 3.0, bottom: 3.0),
        height: height * 0.055,
        width: width * 0.8,
        margin:
        const EdgeInsets.only(top: 20, left: 20.0, right: 0.0, bottom: 0.0),
        decoration: BoxDecoration(
            gradient: LinearGradient(
              begin:  Alignment.topLeft,
              end: Alignment.bottomLeft,
              colors: [
                color1,
                color2,
              ],
            ),
            borderRadius: BorderRadius.circular(30.0),
            boxShadow: [
              BoxShadow(
                color: color1,
                spreadRadius: 1,
                blurRadius: 1,
                offset: Offset(0, 1.7), // changes position of shadow
              ),
            ]),
        child: FlatButton(
//              padding: EdgeInsets.only(top: height * 0.07, left: height * 0.07),
            onPressed: ()  {
              Navigator.push(context, MaterialPageRoute(builder: (context) => page));
            },
            child: Text(
              text,
              style: TextStyle(
                fontSize: fontScale *3.6,
                color: Colors.white,

              ),
              textAlign: TextAlign.center,
            )));


  }
}


//final loginButon = Material(
//    borderRadius: BorderRadius.circular(30.0),
//    color: Colors.white10,
//    child: Container(
//        child: GestureDetector(
//          onTap: () {
//            Navigator.push(
//                context, MaterialPageRoute(builder: (context) => Signin()));
//          },
//          child: Stack(children: <Widget>[
//            Image.asset('images/Rectangle 10.png'),
//            Center(
//              child: Padding(
//                padding: const EdgeInsets.fromLTRB(0.0, 0, 20.0, 0),
//                child: Text(
//                  "تسجيل الدخول",
//                  style: TextStyle(
//                    height: 2.0,
//                    fontFamily: 'Tajawal',
//                    fontSize: 25.0,
//                    color: Colors.white,
//                  ),
//                ),
//              ),
//            )
//          ]),
//        )));
//
//final signUpButon = Material(
//    borderRadius: BorderRadius.circular(30.0),
//    color: Colors.white10,
//    child: Container(
//        child: GestureDetector(
//            onTap: () {
//              Navigator.push(context,
//                  MaterialPageRoute(builder: (context) => SignUp()));
//            },
//            child: Stack(children: <Widget>[
//              FlatButton(
//                onPressed: null,
//                padding: EdgeInsets.all(0.0),
//                child: Image.asset('images/Rectangle 13.png'),
//              ),
//              Center(
//                child: Padding(
//                  padding: const EdgeInsets.fromLTRB(0.0, 0, 30.0, 0),
//                  child: Text(
//                    "إنشاء حساب جديد",
//                    style: TextStyle(
//                      height: 2.0,
//                      fontFamily: 'Tajawal',
//                      fontSize: 25.0,
//                      color: Colors.white,
//                    ),
//                  ),
//                ),
//              )
//            ]))));