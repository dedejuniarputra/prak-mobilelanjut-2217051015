import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('PRAKTIKUM MOBILE LANJUT'),
        ),
        body: const Center(
          child: Text(
            'Hallo Nama Saya DEDE JUNIAR',
            textAlign: TextAlign.center,
            // style: TextStyle(fontSize: 16), // opsional
          ),
        ),
      ),
    );
  }
}
