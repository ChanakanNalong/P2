import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:workmanager/workmanager.dart';
import 'ParkingPage/cam_detect.dart';
import 'yolo_service.dart';
import 'package:http/http.dart' as http;

Future<void> sendToDatabase(data) async {
  String url = "http://-your ip-/api/flutter_login/yolo_service.php";
  await http.post(
    Uri.parse(url),
      headers: {
        "Content-Type": "application/json"
      }, 
      body: json.encode(data));
}

void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) async {
    final yoloService = YoloWebSocketService();

    // เรียกใช้ใน initState หรือฟังก์ชัน setup อื่นๆ
    await yoloService.init('ws://172.16.10.249:81');

    // เรียกใช้งาน YoloWebSocket และส่งข้อมูลขึ้นฐานข้อมูล
    await yoloService.startDetection();

    // จำนวนรถที่ detect ได้
    int numberOfCars = yoloService.yoloResults.length;

    // ส่งข้อมูลไปยังฐานข้อมูล (สมมติว่ามีฟังก์ชัน sendToDatabase)
    await sendToDatabase(numberOfCars);

    // หยุดการตรวจจับ
    await yoloService.stopDetection();

    // ปิดบริการเมื่อไม่ใช้งานแล้ว
    await yoloService.dispose();

    return Future.value(true);
  });
}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Workmanager().initialize(callbackDispatcher, isInDebugMode: true);
  Workmanager().registerPeriodicTask(
    "1",
    "yoloWebSocketDetection",
    frequency: const Duration(hours: 1),
  );
  runApp(const MyApp());
}

// ส่วนของ Stateless widget
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SSP',
      // home: FirstScreen(),
      initialRoute: '/menu', // สามารถใช้ home แทนได้
      routes: {
        '/menu': (context) => YoloWebSocket(),
      },
    );
  }
}
