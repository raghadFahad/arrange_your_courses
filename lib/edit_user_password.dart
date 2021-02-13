import 'package:flutter/material.dart';
import 'package:arrange_your_courses/home.dart';
//import 'package:url_launcher/url_launcher.dart';


class Edit_user_password extends StatelessWidget {
  TextStyle style = TextStyle(fontFamily: 'Tajawal', fontSize: 20.0);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Edit_user_password_ful_state(),
          ),
        ),
      ),
    );

  }
}
class Edit_user_password_ful_state extends StatefulWidget{
  @override
  _Edit_user_password_state createState() => _Edit_user_password_state();
}
class _Edit_user_password_state extends State<Edit_user_password_ful_state> {
  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    //interface items
    final backIcone =Stack(
      children: [
        IconButton(
          icon: Padding(
            padding: const EdgeInsets.fromLTRB(5.0, 10.0, 50.0, 0),
            child: Icon(Icons.arrow_back),
          ),
          color: Colors.black,
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(
                builder: (context) => Home()
            ));
          },
        ),
      ],
    );

    //email textField
    final exPasswordTextFeild = new Theme(
      data: new ThemeData(//when press the textField
        primaryColor: Color.fromRGBO(145, 149, 248, 100),
        primaryColorDark: Color.fromRGBO(145, 149, 248, 100),
      ),
      child:TextField(
        textAlign: TextAlign.center,
        decoration: new InputDecoration(
          contentPadding: const EdgeInsets.fromLTRB(180.0, 3.0, 0.0, 3.0),
          border:
          new OutlineInputBorder(
              borderSide: new BorderSide(color: Color.fromRGBO(145, 149, 248, 100))),
          labelText: 'كلمة المرور السابقة',
        ),
      ),
    );

    //password textField
    final newPasswordField = new Theme(
      data: new ThemeData(//when press the textField
        primaryColor: Color.fromRGBO(241, 151, 134, 100),
        primaryColorDark: Color.fromRGBO(241, 151, 134, 100),
      ),
      child:TextField(
        textAlign: TextAlign.center,
        decoration: new InputDecoration(
          contentPadding: const EdgeInsets.fromLTRB(185.0, 3.0, 0.0, 3.0),
          border: new OutlineInputBorder(
              borderSide: new BorderSide(color: Color.fromRGBO(241, 151, 134, 100))),
          labelText: 'كلمة المرور الجديدة',
        ),
      ),
    );

    //Password repeat
    final newPasswordRepeatField = new Theme(
      data: new ThemeData(//when press the textField
        primaryColor: Color.fromRGBO(209, 146, 167, 100),
        primaryColorDark: Color.fromRGBO(209, 146, 167, 100),
      ),
      child:TextField(
        textAlign: TextAlign.center,
        decoration: new InputDecoration(
          contentPadding: const EdgeInsets.fromLTRB(150.0, 3.0, 0.0, 3.0),
          border: new OutlineInputBorder(
              borderSide: new BorderSide(color: Color.fromRGBO(209, 146, 167, 100))),
          labelText: 'تأكيد كلمة المرور الجديدة',
        ),
      ),
    );

    //sign up button
    final editButton =Material(
        borderRadius: BorderRadius.circular(30.0),
        color: Colors.white10,
        child: Container(
            child: Stack(
                children: <Widget>[
                  FlatButton(
                    onPressed: null,
                    padding: EdgeInsets.all(0.0),
                    child: Image.asset('images/Rectangle 2.png'),),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: Text("تـعديـل",
                        style: TextStyle(
                          height: 2.0,
                          fontFamily: 'Tajawal',
                          fontSize: 25.0,
                          color: Colors.white,),
                      ),
                    ),)]
            )
        )
    );


    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: backIcone,
        elevation: 0.0,
      ),
      body:
      Center(
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(56.0, 20.0, 36.0, 36.0),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 250.0,
                  child: Image.asset(
                    "images/arrange your courses logo.png",
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(height: 25,),
                exPasswordTextFeild,
                SizedBox(height: 25,),
                newPasswordField,
                SizedBox(height: 25.0),
                newPasswordRepeatField,
                SizedBox(height: 25.0),
                editButton,
                SizedBox(height: 25.0,),
              ],
            ),
          ),
        ),
      ),
    );
    throw UnimplementedError();
  }

}

