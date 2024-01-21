import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hospitalmanagementproject/model/mysetting.dart';
import 'package:hospitalmanagementproject/views/my_page_body.dart';
import 'package:provider/provider.dart';

class MyMainPage extends StatefulWidget {
  const MyMainPage({super.key});

  @override
  State<MyMainPage> createState() => _MyBottomPageState();
}

class _MyBottomPageState extends State<MyMainPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<MySetting>(
        builder: (context, ui, child) {
          return Scaffold(
            backgroundColor: ui.homeBackgroundColor,
            body: Column(
              children: [
                // header
                Container(
                  child: Container(
                    margin: EdgeInsets.only(top: 45, bottom:15),
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text(
                              'Home',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: ui.fontSize,
                                color: ui.homeTitleColor,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          width: 45,
                          height: 45,
                          alignment: Alignment.center,
                          child: Badge(
                            label: Text('0', style: TextStyle(color: Colors.white),),
                            child: const Icon(
                              CupertinoIcons.bell,
                              color: Colors.white,
                            ),
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: ui.homeTitleColor,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                // slider
                Expanded(child: SingleChildScrollView(child: MyPageBody(),)),
              ],
            ),
          );
        },
    );
  }
}
