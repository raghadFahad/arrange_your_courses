import 'package:flutter/material.dart';
import 'package:arrange_your_courses/signin.dart';


class forget_password extends StatelessWidget {
  TextStyle style = TextStyle(fontFamily: 'Tajawal', fontSize: 20.0);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: forget_password_ful_state(),
          ),
        ),
      ),
    );

  }
}
class forget_password_ful_state extends StatefulWidget{
  @override
  _forget_password_state createState() => _forget_password_state();
}
class _forget_password_state extends State<forget_password_ful_state> {
  @override
  Widget build(BuildContext context) {

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
                builder: (context) => Signin()
            ));
          },
        ),
      ],
    );

    //email textField design properties
    final emailField = new Theme(
      data: new ThemeData(//when press the textField
        primaryColor: Color.fromRGBO(209, 146, 167, 100),
        primaryColorDark: Color.fromRGBO(209, 146, 167, 100),
      ),
      child:TextField(
        textAlign: TextAlign.center,
        decoration: new InputDecoration(
          contentPadding: const EdgeInsets.fromLTRB(150.0, 3.0, 0.0, 3.0),
          border:
          new OutlineInputBorder(
              borderSide: new BorderSide(color: Color.fromRGBO(209, 146, 167, 100))),
          labelText: 'البريد الالكتروني المسجل',
        ),
      ),
    );

    //sendEmail button design properties
    final sendEmailButton =Material(
        borderRadius: BorderRadius.circular(30.0),
        color: Colors.white10,
        child: Container(
            child: Stack(
                children: <Widget>[
                  FlatButton(
                    onPressed: null,
                    padding: EdgeInsets.all(0.0),
                    child: Image.asset('images/Rectangle 13.png'),),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0.0, 0, 30.0, 0),
                      child: Text("إرسال",
                        style: TextStyle(
                          height: 2.0,
                          fontFamily: 'Tajawal',
                          fontSize: 25.0,
                          color: Colors.white,),
                      ),
                    ),)]
            )
        ));


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
            padding: const EdgeInsets.fromLTRB(46.0, 0.0, 46.0, 36.0),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 300.0,
                  child: Image.asset(
                    "images/arrange your courses logo.png",
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(height: 35.0),
                SizedBox(height: 50.0, child:emailField,),
                SizedBox(height: 25.0),
                sendEmailButton,
                SizedBox(height: 20.0,),
              ],
            ),
          ),
        ),
      ),
    );
    throw UnimplementedError();
  }

}

