import 'package:arrange_your_courses/forget_password.dart';
import 'package:arrange_your_courses/users.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:arrange_your_courses/home.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:email_validator/email_validator.dart';
import 'dart:convert';
import "package:crypto/crypto.dart";

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  void initState() {
    super.initState();
  }

  double height;
  double width;
  double fontScale;

  TextStyle style = TextStyle(fontFamily: 'Tajawal', fontSize: 20.0);
  //set user id
  final String uid;
  _SignUpState({this.uid});

  //firebase connection
  final FirebaseAuth auth = FirebaseAuth.instance;

  //sign up variables
  String errorMessage = ''; // to validate if user enter un-valid input
  final GlobalKey<FormState> _formStateKey = GlobalKey<FormState>(); // sign up form

  //Text field value
  final _firstNameController = TextEditingController(text: '');
  final _lastNameController = TextEditingController(text: '');
  final _emailIdController = TextEditingController(text: '');
  final _passwordController = TextEditingController(text: '');
  final _confirmPasswordController = TextEditingController(text: '');

  //for interface rotation
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

    // build the interface
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
          child: Form(
            key: _formStateKey,
            autovalidate: true,
            child: Column(
              children: <Widget>[
                backIcon(Icons.arrow_back, Colors.black, Home()),
                sizedBoxPic(
                    height * 0.1, "images/arrange your courses logo.png"),
                space(0.013),
                textField(
                    "الرجاء إدخال الاسم الأول",
                    'الاسم الأول',
                    _firstNameController,
                    241,
                    151,
                    134,
                    false),
                space(0.01),
                textField(
                    "الرجاء إدخال الاسم الأخير ",
                    'الاسم الاخير',
                    _lastNameController,
                    132,
                    133,
                    247,
                    false),
                space(0.01),
                textField(
                    "الرجاء إدخال البريد الالكتروني ",
                    'البريد الالكتروني',
                    _emailIdController,
                    132,
                    133,
                    247,
                    false),
                space(0.01),
                textField(
                    "الرجاء إدخال كلمة المرور ",
                    'كلمة المرور',
                    _passwordController,
                    241,
                    151,
                    134,
                    true),
                space(0.01),
                textField(
                    "الرجاء التأكد من مطابقة كلمة المرور ",
                    'تأكيد كلمة المرور',
                    _confirmPasswordController,
                    132,
                    133,
                    247,
                    true),
                space(0.01),
                ovalButton(context, "إنشاء حساب جديد",
                    Color.fromRGBO(132, 134, 247, 0.4),
                    Color.fromRGBO(132, 134, 247, 1), Home()),
                space(0.02),
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
                Row(//sign up with google or twitter or facebook

                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    circleButton(FontAwesomeIcons.twitter, Colors.blue,
                        Home(), context)//twitter
                    ,
                    circleButton(
                        FontAwesomeIcons.googlePlusG, Colors.red, Home(),
                        context),//google
                    circleButton(FontAwesomeIcons.facebookF, Colors.indigo,
                        Home(), context),//facebook

                  ],
                )
              ],
            ),
          )
      ),

    );
  }


  //back icon button widget
  Widget backIcon(IconData icon, Color color, Widget page) {
    return Container(
      alignment: Alignment.topLeft,
      margin: EdgeInsets.all(24),
      child: new IconButton(
        icon: Icon(Icons.arrow_back),
        color: Colors.black,
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(
              builder: (context) => page
          ));
        },
      ),

    );
  }

  Widget line(double w) {
    return Image.asset(
      "images/Line 3.png",
      width: width * w,
    );
  }

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
    );
  }

  //textField form
  Widget textField(String validText, String label,
      TextEditingController controller, int color1, int color2, int color3,
      bool obscure) {
    return Container(
        height: height * 0.055,
        width: width * 0.8,
        child: new Theme(
            data: new ThemeData( //when press the textField
              primaryColor: Color.fromRGBO(color1, color2, color3, 100),
              primaryColorDark: Color.fromRGBO(color1, color2, color3, 100),
            ),
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: new TextFormField(
                textAlign: TextAlign.right,
                autofocus: true,
                keyboardType: TextInputType.emailAddress,
                controller: controller,
                obscureText: obscure,
                decoration: new InputDecoration(
                  labelText: label,
                  border: new OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Color.fromRGBO(color1, color2, color3, 100))),

                  //                prefixIcon: Icon(icon, color: Colors.grey)
                ),
              ),
            )

        ));
  }
  //sign up button
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
              registerToFb();
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

  //Encrypt the password
  String passEncoded(String password){
    var pass = utf8.encode(password); // data being hashed
    var encodedPassword = sha256.convert(pass);
    return encodedPassword.toString();
  }
  //sign up method
  Future registerToFb() async{
    setState(() {// if any user input is error the validate message will show up using setState()
      errorText();
    });

    try{// try to save user's data in the firestore
      AuthResult result = await auth.createUserWithEmailAndPassword(
          email: _emailIdController.text, password:passEncoded( _passwordController.text));// create the user in firebase's authentication so when user sign in the system need to check the authentication part only
      FirebaseUser user = result.user; // get user id

    await User(uid: user.uid).userInfo(_firstNameController.text,_lastNameController.text,
        _emailIdController.text,passEncoded(_passwordController.text)); // create user record in firestore "users" collection
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => Home()));// if the user created move to home page
    return user;
    }catch (e) {//validation
      handleError(e);
      if(_firstNameController.text == '' || _lastNameController.text == '' ||
          _emailIdController.text == ''
          || _passwordController.text == '' ||
          _confirmPasswordController.text == '') {
        errorMessage = "الرجاد التأكد من ملأ جميع الفراغات"; //if any textField is empty
      }else {
        errorMessage =
        "هذا البريد مسجل مسبقاً الرجاء التأكد من البريد الإلكتروني";// if the email already used
      }
    }
  }

  //realtime method
//  void registerToFb() {
//      setState(() {
//        errorText();
//      });
//    auth.createUserWithEmailAndPassword(
//        email: _emailIdController.text, password:passEncoded(_passwordController.text))
//        .then((result) {
//      dbRef.child(result.user.uid).set({
//        "fName": _firstNameController.text,
//        "lName": _lastNameController.text,
//        "email": _emailIdController.text,
//        "password": passEncoded(_passwordController.text),
//
//      }).then((res) {
//        Navigator.pushReplacement(
//          context,
//          // MaterialPageRoute(builder: (context) => Home(uid: result.user.uid)),
//          MaterialPageRoute(builder: (context) => forget_password()), );
//      });
//      Navigator.of(context).push(
//          MaterialPageRoute(builder: (context) => Home()));
//    }).catchError((e) {
//      if(_firstNameController.text == '' || _lastNameController.text == '' ||
//          _emailIdController.text == ''
//          || _passwordController.text == '' ||
//          _confirmPasswordController.text == '') {
//        errorMessage = "الرجاد التأكد من ملأ جميع الفراغات";
//      }else {
//        errorMessage =
//        "هذا البريد مسجل مسبقاً الرجاء التأكد من البريد الإلكتروني";
//      }
//    });
//  }

  handleError(Object error) {//for developer
    print(error);
  }

  Widget validationMessage() {// check th users's input is validate
    if (_passwordController.text != _confirmPasswordController.text) {
      errorMessage = "الرجاء التأكد من تطابق كلمة المرور"; // check the password and its confirm is matched
    }
    Pattern passPattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';//
    RegExp passRegex = new RegExp(passPattern);
    if (!passRegex.hasMatch(_passwordController.text)){
      errorMessage = " :يجب أن تحتوي كلمة المرور على \n  على الأقل ٦ حروف * \n حروف كبيرة وحروف صغيرة * \n أرقام ورموز *  "; //check the password pattern

    }
    if(!EmailValidator.validate(_emailIdController.text)){
      errorMessage = "الرجاء التأكد من صحة البريد الالكتروني";//check the email form valid
    }
    Pattern namePattern =
        r'^[A-Za-z0]*$';
    RegExp nameRegex = new RegExp(namePattern);
    if (!nameRegex.hasMatch(_firstNameController.text) || !nameRegex.hasMatch(_lastNameController.text)){
      errorMessage = "يجب أن يحتوي الاسم الأول والأخير على حروف فقط";// check th first name and last name contain only letters
    }

  }

  // if the email or password was wrong
  Widget errorText() {// to show validate message if any error occur and empty Container() if every thing is right and validated
 if (_firstNameController.text != '' && _lastNameController.text != '' &&
        _emailIdController.text != ''
        && _passwordController.text != '' &&
        _confirmPasswordController.text != '') {
      validationMessage();
 }
      return (errorMessage != '') ?
      Text(
        errorMessage,
        textAlign: TextAlign.right,
        style: TextStyle(color: Colors.red),
      ) : Container();
 }

  @override
  void dispose() {
    super.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailIdController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();

  }

}
