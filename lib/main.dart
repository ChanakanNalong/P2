import 'package:flutter/material.dart';
import 'package:flutter_login/home.dart'; 
import 'login.dart';
import 'register.dart';
import 'duration_page.dart';  


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Login(), // หน้าล็อกอินเริ่มต้น
      routes: {
        'register': (context) => register(), // เปลี่ยนชื่อให้ถูกต้อง
        'home': (context) => HomePage(),
        'login': (context) => Login(),
        'duration_page': (context) => DurationPage(),  // เพิ่ม duration_page ที่นี่
      },
    );
  }
}
