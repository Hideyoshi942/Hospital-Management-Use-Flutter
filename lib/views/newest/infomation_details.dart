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
            title: Text('Thông tin bài viết',),
            backgroundColor: ui.homeTitleColor,
            foregroundColor: ui.homeBackgroundColor,
          ),
          body: Center(
            child: Column(
              children: [
              ],
            ),
          ),
        );
      },
    );

  }
}

