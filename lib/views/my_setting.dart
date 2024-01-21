import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hospitalmanagementproject/model/mysetting.dart';
import 'package:hospitalmanagementproject/views/my_home_page.dart';
import 'package:provider/provider.dart';

class MyDisplaySetting extends StatefulWidget {
  const MyDisplaySetting({super.key});

  @override
  State<MyDisplaySetting> createState() => _MySettingState();
}

class _MySettingState extends State<MyDisplaySetting> {
  @override
  Widget build(BuildContext context) {
    return Consumer<MySetting>(
      builder: (context, ui, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Setting',
            ),
            backgroundColor: ui.homeBackgroundColor,
            foregroundColor: ui.homeTitleColor,
          ),
          body: Container(
            child: Column(
              children: [
                SizedBox(height: 10,),
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 10),
                      child: Text('FontSize: ${ui.fontSize.toInt()}',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                    Slider(
                        min : 1,
                        max: 100,
                        value: ui.fontSize,
                        onChanged: (newValue) {
                          ui.fontSize = newValue;
                        },
                    ),
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 10),
                      child: Text('Color Home: ',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                    DropdownButton<String>(
                        value: ui.strHomeTitleColor,
                        items: MySetting.listColorHome.map<DropdownMenuItem<String>>(
                                (String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }
                        ).toList(),
                        onChanged: (String? value) {
                          ui.homeTitleColor = value;
                        }
                    ),
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 10),
                      child: Text('Color background: ',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                    DropdownButton<String>(
                        value: ui.strHomeBackgroundColor,
                        items: MySetting.listColorBackground.map<DropdownMenuItem<String>>(
                                (String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }
                        ).toList(),
                        onChanged: (String? value) {
                          ui.homeBackgroundColor = value;
                        }
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

