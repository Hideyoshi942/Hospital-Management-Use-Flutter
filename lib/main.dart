
import 'package:flutter/material.dart';
import 'package:hospitalmanagementproject/views/my_home_page.dart';
import 'package:hospitalmanagementproject/views/my_setting.dart';
import 'package:hospitalmanagementproject/model/mysetting.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
        create: (context) => MySetting(),
        child: MaterialApp(
          home: MyHomePage(),
          debugShowCheckedModeBanner: false,
        ),
    ),
  );
}


