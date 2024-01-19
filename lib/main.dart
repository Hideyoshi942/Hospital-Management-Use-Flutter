import 'package:flutter/material.dart';
import 'package:hospitalmanagementproject/settings/MySettings.dart';
import 'package:hospitalmanagementproject/views/BenhNhan/BenhNhanPage.dart';
import 'package:hospitalmanagementproject/views/BenhNhan/FormBenhNhan.dart';
import 'package:hospitalmanagementproject/views/BenhNhan/ThemBenhNhan.dart';
import 'package:hospitalmanagementproject/views/myhomepage.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:date_format/date_format.dart';
import 'package:hospitalmanagementproject/data/data.dart';
void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => MySettings(),
      // child: MyHomePage(),
      child: MyApp(),
    )
  );
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
        ),
        body: BenhNhanPage(data.DataBenhNhan()),
      ),
    );
  }
}

