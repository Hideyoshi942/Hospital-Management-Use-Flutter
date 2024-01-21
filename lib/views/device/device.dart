import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Device extends StatefulWidget {
  const Device({super.key});

  @override
  State<Device> createState() => _DeviceState();
}

class _DeviceState extends State<Device> {
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
