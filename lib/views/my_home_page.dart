import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hospitalmanagementproject/model/mysetting.dart';
import 'package:hospitalmanagementproject/views/my_main_page.dart';
import 'package:hospitalmanagementproject/views/my_setting.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List pages = [
    MyMainPage(),
    MyDisplaySetting(),
  ];
  int currentIndex = 0;
  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<MySetting>(
      builder: (context, ui, child) {
        return Scaffold(
          body: pages[currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            unselectedFontSize: 0,
            selectedFontSize: 0,
            type: BottomNavigationBarType.fixed,
            onTap: onTap,
            currentIndex: currentIndex,
            selectedItemColor: ui.homeTitleColor,
            unselectedItemColor: Colors.black,
            showUnselectedLabels: false,
            showSelectedLabels: false,
            elevation: 0,
            items: [
              BottomNavigationBarItem(label: 'Trang chủ', icon: Icon(CupertinoIcons.home)),
              BottomNavigationBarItem(label: 'Cài đặt', icon: Icon(CupertinoIcons.settings)),
            ],
          ),
        );
      },
    );
  }
}
