import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const FunnyQuotesApp());
}

class FunnyQuotesApp extends StatelessWidget {
  const FunnyQuotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Funny Quotes',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static List<Color> RandomColors =[
    Colors.orange,
    Colors.teal,
    Colors.deepPurpleAccent,
    Colors.blue,
    Colors.red,
  ];
  var Randomcolor = RandomColors[0] ;

  static const List<String> quoteList = [
    'หน้าไม่หวานส่วนปากไม่ต้องถาม หมาแน่นอน',
    'พูดไม่ค่อยเก่ง แต่กินหมดจาน',
    'ที่บ้านมันรก เพราะอั๊วชอบลื้อ',
    'ทุกการเติบโต ย่อมปวดหลังเสมอ',
    'อดข้าวไม่ว่า เสื้อผ้าห้ามซ้ำ',
  ];
  var quote = quoteList[0]; // state variable

  void handleClickGo() {
    setState(() {
      var rand = Random();
      var randomIndex = rand.nextInt(quoteList.length);
      quote = quoteList[randomIndex];

      var RdColor = Random() ;
      var rdColor = RdColor.nextInt(RandomColors.length) ;
      Randomcolor = RandomColors[rdColor] ;
    });
  }

  @override
  Widget build(BuildContext context) {
    var rand = Random();
    var randomIndex = rand.nextInt(quoteList.length);
    var quote = quoteList[randomIndex];
    return Scaffold(
      appBar: AppBar(title: const Text('คำคมกวนๆ')),
      floatingActionButton: FloatingActionButton(
        onPressed: handleClickGo,
        child: const Center(
          child: Text(
            'Next Quote',
            textAlign: TextAlign.center,
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Text(
            quote,
            style:  TextStyle(
              color: Randomcolor,


              fontSize: 50,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}