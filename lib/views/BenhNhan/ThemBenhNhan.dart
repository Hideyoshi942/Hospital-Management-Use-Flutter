import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hospitalmanagementproject/main.dart';
import 'package:hospitalmanagementproject/views/BenhNhan/BenhNhanPage.dart';
import 'package:hospitalmanagementproject/data/data.dart';
import 'FormBenhNhan.dart';

class ThemBenhNhan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          FormBenhNhan(),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BenhNhanPage(data.DataBenhNhan())),
                );
              },
              child: Text("chuyen"))
        ],
      ),
    );
  }
}
