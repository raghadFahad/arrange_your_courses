import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:arrange_your_courses/home.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:arrange_your_courses/forget_password.dart';
import 'dart:convert';
import "package:crypto/crypto.dart";

//sing in libraries
import 'package:firebase_auth/firebase_auth.dart';
//import 'package:google_sign_in/google_sign_in.dart';

class Signin extends StatefulWidget {
  @override
  _SignState createState() => _SignState();
}

class _SignState extends State<Signin> {
  @override
  void initState() {
    super.initState();
  }

  double height;
  double width;
  double fontScale;

  //to get the value of user eamil& password
  final FirebaseAuth auth = FirebaseAuth.instance;
  bool isGoogleSignIn = false;
  String errorMessage = '';
  String successMessage = '';
  final GlobalKey<FormState> _formStateKey = GlobalKey<FormState>();
  String _emailId;
  String _password;
  final _emailIdController = TextEditingController(text: '');
  final _passwordController = TextEditingController(text: '');


  @override
  Widget build(BuildContext context) {
    if (MediaQuery
        .of(context)
        .orientation == Orientation.portrait) {
      height = MediaQuery
          .of(context)
          .size
          .height;
      width = MediaQuery
          .of(context)
          .size
          .width;
      fontScale = width * 0.015;
    } else {
      height = MediaQuery
          .of(context)
          .size
          .width;
      width = MediaQuery
          .of(context)
          .size
          .height;
      fontScale = width * 0.015;
    }


    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
          child: Form(
            key: _formStateKey,
            autovalidate: true,
            child: Column(
              children: <Widget>[
                backIcon(Icons.arrow_back, Colors.black, Home()),
                space(0.01),
                sizedBoxPic(
                    height * 0.27, "images/arrange your courses logo.png"),
                space(0.013),
                textField("الرجاء إدخال البريد الإلكتروني", _emailIdController,
                    Icons.email, _emailId, false),
                space(0.01),
                textField("الرجاء إدخال كلمة المرور ", _passwordController,
                    Icons.vpn_key, _password, true),

                space(0.01),
                ovalButton(
                    context, "تسجيل الدخول", Color.fromRGBO(241, 151, 134, 0.4),
                    Color.fromRGBO(241, 151, 134, 1), Home()),
                space(0.02),
                subtitleText('هل نسيت كلمة المرور؟',3.0),
                errorText(),
                space(0.02),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    line(0.35),
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                          width * 0.035, 0, width * 0.035, 0),
                      child: titleText("أو", 2.8),
                    ),
                    line(0.35)
                  ],
                ),
                space(0.02),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    circleButton(FontAwesomeIcons.twitter, Colors.blue,
                        Home(), context)
                    ,
                    circleButton(
                        FontAwesomeIcons.googlePlusG, Colors.red, Home(),
                        context),
                    circleButton(FontAwesomeIcons.facebookF, Colors.indigo,
                        Home(), context),

                  ],
                )
              ],
            ),
          )
      ),

    );
  }

// Widget to build the app

  //back icon widget
  Widget backIcon(IconData icon, Color color, Widget page) {
    return  Container(
      alignment: Alignment.topLeft,
      margin: EdgeInsets.all(24),
      child: new IconButton(
        icon: Icon(Icons.arrow_back),
          color: Colors.black,
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(
                builder: (context) => Home()
            ));
          },
        ),

    );
  }
  //logo widget
  Widget sizedBoxPic(double height, String image) {
    return SizedBox(
      height: height,
      child: Image.asset(
        image,
        fit: BoxFit.contain,
      ),
    );
  }
  // text widget
  Widget titleText(String text, double f) {
    return Text(
      text,
      style: TextStyle(
          fontSize: fontScale * f,
          color: Colors.black,
          fontWeight: FontWeight.bold
      ),
      textAlign: TextAlign.center,
    );
  }

  // text widget
  Widget subtitleText(String text, double f) {

    return FlatButton(
        child: Text(
          text,
          style: TextStyle(
            fontSize: fontScale * f,
            color: Colors.black,
          ),
          textAlign: TextAlign.center,
        ),
      onPressed: (){
      Navigator.push(context, MaterialPageRoute(
          builder: (context) => forget_password()
      ));
    },
      );


  }
  // textField widget
  Widget textField(String validText, TextEditingController controller,
      IconData icon, String id, bool obscure) {
    return Container(
        height: height * 0.055,
        width: width * 0.8,
        child: new Theme(
          data: new ThemeData( //when press the textField
            primaryColor: Color.fromRGBO(241, 151, 134, 100),
            primaryColorDark: Color.fromRGBO(241, 151, 134, 100),
          ),
          child: new TextFormField(
            keyboardType: TextInputType.emailAddress,
            controller: controller,
            obscureText: obscure,
            decoration: new InputDecoration(
                border: new OutlineInputBorder(
                    borderSide: new BorderSide(
                        color: Color.fromRGBO(241, 151, 134, 100))),

                prefixIcon: Icon(icon, color: Colors.grey)
            ),
          ),
        )

    );
  }
  //button widget

  Widget ovalButton(BuildContext context, String text, Color color1,
      Color color2, Widget page) {
    return Container(
        padding: const EdgeInsets.only(top: 3.0, bottom: 3.0),
        height: height * 0.055,
        width: width * 0.8,
        margin:
        const EdgeInsets.only(top: 20, left: 20.0, right: 0.0, bottom: 0.0),
        decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
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
            onPressed: () {
              if (_formStateKey.currentState.validate()) {
                _formStateKey.currentState.save();
                signIn(_emailIdController.text, passEncoded(_passwordController.text)).then((
                    user) {
                 });
              }
            },
            child: Text(
              text,
              style: TextStyle(
                fontSize: fontScale * 3.6,
                color: Colors.white,

              ),
              textAlign: TextAlign.center,
            )));
  }
  Widget line(double w) {
    return Image.asset(
      "images/Line 3.png",
      width: width * w,
    );
  }

  // widget to make a space between the other widget
  Widget space(double h) {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: height * h)
    );
  }

  //Twitter, google, facebook buttons
  Widget circleButton(IconData icon, Color backColor, Widget page,
      BuildContext context) {
    return RawMaterialButton(
      onPressed: () {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => page));
      },
      elevation: 2.0,
      fillColor: backColor,
      child: FaIcon(icon, color: Colors.white, size: width * 0.09,),
      padding: EdgeInsets.all(width * 0.035),
      shape: CircleBorder(),
    );
  }
  //encrypt user's password
  String passEncoded(String password){
    var pass = utf8.encode(password); // data being hashed
    var encodedPassword = sha256.convert(pass);
    return encodedPassword.toString();
  }
  // sign in method
  Future<FirebaseUser> signIn(String email, String password) async {

    try {//try to sign in

      FirebaseUser user = (await FirebaseAuth.instance.
      signInWithEmailAndPassword(email: email, password:password))
          .user;
//
//      assert(user != null);//che
//      assert(await user.getIdToken() != null);
      final FirebaseUser currentUser = await auth.currentUser();
      assert(user.uid == currentUser.uid);
      Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => Home()));

      return user;
    } catch (e) {
      if(_emailIdController.text == '' && _passwordController.text == '') {
        errorMessage = "الرجاء التأكد من ملأ الفرغات";
      }
      handleError(e);
      setState(() {//if any error occur the validate message will show
        errorText();
      });


    }
  }
//  // Google sign in
//  Future<void> _handleSignIn() async {
//    try {
//      final GoogleSignIn _googleSignIn = GoogleSignIn();
//      await _googleSignIn.signIn();
//    } catch (error) {
//      print(error);
//    }
//  }

  //error handling for firebase connection
  handleError(Object error) {
    print(error);

  }
  // if the email or password was wrong
  Widget errorText() {

    if (_emailIdController.text != '' && _passwordController.text != '') {
       errorMessage = 'الرجاء التأكد من إدخال البريد الالكتروني أو كلمة المرور الصحيحة';
    }
    return (errorMessage != '') ?
    Text(
      errorMessage,
      style: TextStyle(color: Colors.red),
    ) : Container();
  }

}


