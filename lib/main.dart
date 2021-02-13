import 'package:flutter/material.dart';
import 'package:arrange_your_courses/home.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'رتب دوراتك',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Tajawal',
        primarySwatch: Colors.blue,
      ),
      home: Home(),
    );
  }
}

//ناڤيقيشن بار يظهر في كل الصفحات مو بس الصفحات الرئيسية، يحتاج تعديل في الديزاين:)
//final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();
//int _selectedTab = 1;
//
//double height;
//double width;
//double fontScale;
//@override
//Widget build(BuildContext context) {
//  height = MediaQuery.of(context).size.height;
//  width = MediaQuery.of(context).size.width;
//  fontScale = width * 0.015;
//
//
//  return Scaffold(
//    body: Navigator(key: _navigatorKey, onGenerateRoute: generateRoute),
//    bottomNavigationBar: _bottomNavigationBar(),
//  );
//}
//
//Widget _bottomNavigationBar() {
//  return BottomNavigationBar(
//    onTap: _onTap,
//    currentIndex: _selectedTab,
//    items: [
//      BottomNavigationBarItem(
//        icon: Icon(FeatherIcons.bookOpen),
//        title: Text(
//          'اكتشف',
//          style: TextStyle(fontSize: fontScale * 2.4),
//        ),
//      ),
//      BottomNavigationBarItem(
//        icon: Icon(EvaIcons.messageCircleOutline),
//        title: Text(
//          'اضافة كورس',
//          style: TextStyle(fontSize: fontScale * 2.4),
//        ),
//      ),
//      BottomNavigationBarItem(
//        icon: Icon(FeatherIcons.home),
//        title: Text(
//          'الحساب الشخصي',
//          style: TextStyle(fontSize: fontScale * 2.4),
//        ),
//
//    ],
//  );
//}
//
//_onTap(int tabIndex) {
//  switch (tabIndex) {
//    case 0:
//      _navigatorKey.currentState.pushReplacementNamed("اكتشف");
//      break;
//    case 1:
//      _navigatorKey.currentState.pushReplacementNamed("اضافة كورس");
//      break;
//    case 2:
//      _navigatorKey.currentState.pushReplacementNamed("الحساب الشخصي");
//
//  }
//  setState(() {
//    _selectedTab = tabIndex;
//  });
//}
//
//Route<dynamic> generateRoute(RouteSettings settings) {
//  switch (settings.name) {
//    case "اكتشف":
//      return MaterialPageRoute(builder: (context) => Explore());
//    case "الحساب الشخصي":
//      return MaterialPageRoute(builder: (context) => Profile());
//    default:
//      return MaterialPageRoute(builder: (context) => AddCourse());
//  }
//}