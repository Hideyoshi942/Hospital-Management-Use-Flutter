import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Medicine extends StatefulWidget {
  const Medicine({super.key});

  @override
  State<Medicine> createState() => _MedicineState();
}

class _MedicineState extends State<Medicine> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chức năng đang phát triển'),
        foregroundColor: Colors.white,
        backgroundColor: Colors.blue,
      ),
      body: Container(
        color: Colors.yellow,
        child: Center(
          child: Container(
            child: Icon(Icons.warning, size: 100,color: Colors.red,),
          ),
        ),
      ),
    );
  }
}
