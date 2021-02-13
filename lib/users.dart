import 'package:cloud_firestore/cloud_firestore.dart';
final CollectionReference userCollection = Firestore.instance.collection('users');//connect to 'Users' collection in firestor

class User {

  final String uid;
  User({this.uid});//get user id

  Future userInfo(String fName, String lName, String email, String password) async{//method of sign up
    return await userCollection.document(uid).setData({//save the user' data to the firestore
      "fName": fName,
      "lName": lName,
      "email": email,
      "password": password,
    });
  }
}
