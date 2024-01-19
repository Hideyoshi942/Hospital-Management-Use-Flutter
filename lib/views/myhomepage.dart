import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hospitalmanagementproject/settings/MySettings.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Consumer<MySettings>(builder: (context, mySettings, child){
        return Scaffold(
          body: Column(
            // appBar
            children: [
              Container(
                child: Container(
                  margin: EdgeInsets.only(top: 45, bottom:15),
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Column(
                        children: [
                          Text(
                            'Home',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                              color: Colors.blue,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        width: 45,
                        height: 45,
                        child: const Icon(
                          CupertinoIcons.bell,
                          color: Colors.white,
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.blue
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        );
        return Scaffold(
          body: Column(
            // appBar
            children: [
              Container(
                child: Container(
                  margin: EdgeInsets.only(top: 45, bottom:15),
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Column(
                        children: [
                          Text(
                            'Home',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                              color: Colors.blue,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        width: 45,
                        height: 45,
                        child: const Icon(
                          CupertinoIcons.bell,
                          color: Colors.white,
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.blue
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      }),
      debugShowCheckedModeBanner: false,
    );
  }
}
