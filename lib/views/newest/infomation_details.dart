import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hospitalmanagementproject/model/mysetting.dart';
import 'package:provider/provider.dart';

class InformationDetail extends StatefulWidget {
  const InformationDetail({super.key});

  @override
  State<InformationDetail> createState() => _InformationDetailState();
}

class _InformationDetailState extends State<InformationDetail> {
  @override
  Widget build(BuildContext context) {
    return Consumer<MySetting>(
      builder: (context, ui, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Thông tin bài viết',
            ),
            backgroundColor: ui.homeTitleColor,
            foregroundColor: ui.homeBackgroundColor,
          ),
          body: Container(
            child: Column(
              children: [
                Container(
                  child: Text(
                    'Family is the best',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  ),
                ),
                Container(
                  height: 200,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/image/news/new1.jpg"),
                        fit: BoxFit.cover),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  height: 200,
                  child: Text("Hello everyone, today I’m happy to introduce to you about my family."
                      "My family includes my mother, father and my little sister."
                      "Let’s get started with my mother, she is like any other mom. Loving, caring,"
                      "and concerned but when she is angry, she is very strict. She’s artistic and "
                      "seeks to do things that relate to art. She loves to cook and is extremely innovative"
                      "in that aspect. She is the anchor of our house and is definitely the driving force for"
                      "our family!"),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
