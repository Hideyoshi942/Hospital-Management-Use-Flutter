import 'dart:math';

import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_randomcolor/flutter_randomcolor.dart';
import 'package:hospitalmanagementproject/data/data.dart';
import 'package:hospitalmanagementproject/model/PhongDieuTri.dart';
import 'package:hospitalmanagementproject/model/mysetting.dart';
import 'package:hospitalmanagementproject/views/my_home_page.dart';
import 'package:hospitalmanagementproject/views/treatment/room.dart';
import 'package:provider/provider.dart';

class ListTreatment extends StatefulWidget {
  final List<PhongDieuTri> danhSachPhongDieuTri;
  PhongDieuTri? selectedPhongDieuTri;
  ListTreatment(this.danhSachPhongDieuTri);
  @override
  State<ListTreatment> createState() => _ListTreatmentState();
}

class _ListTreatmentState extends State<ListTreatment> {
  @override
  Widget build(BuildContext context) {
    return Consumer<MySetting>(
      builder: (context, ui, child) {
        return WillPopScope(
          onWillPop: () async {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => MyHomePage()),
            );
            return false;
          },
          child: Scaffold(
            appBar: AppBar(
              title: Text('Danh sách phòng điều trị'),
              foregroundColor: ui.homeBackgroundColor,
              backgroundColor: ui.homeTitleColor,
            ),
            body: SingleChildScrollView(
              child: Container(
                child: Column(
                  children: widget.danhSachPhongDieuTri.map((e) {
                    return Card(
                      child: ListTile(
                        leading: Container(
                          margin: EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 15,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black,
                              width: 1,
                            ),
                          ),
                          padding: EdgeInsets.all(10),
                          child: Text(
                            e.id.toString(),
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                            ),
                          ),
                        ),
                        title: Text('Tên phòng: ' + e.name,
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        subtitle: Text('Sức chứa: ' + e.sucChua.toString()),
                        trailing: PopupMenuButton(
                          icon: Icon(Icons.more_vert),
                          itemBuilder: (BuildContext context) {
                            return <PopupMenuEntry>[
                              PopupMenuItem(
                                child: ListTile(
                                  leading: Icon(Icons.edit),
                                  title: Text('Chỉnh sửa'),
                                  onTap: () {
                                    setState(() {
                                      widget.selectedPhongDieuTri = e;
                                    });
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => TreatmentRoom(phongDieuTri: widget.selectedPhongDieuTri),
                                      ),
                                    );
                                  },
                                ),
                              ),
                              PopupMenuItem(
                                child: ListTile(
                                  leading: Icon(Icons.delete),
                                  title: Text('Xóa'),
                                  onTap: () {
                                    setState(() {
                                      data.xoaPhongDieuTri(e);
                                    });
                                    Navigator.pop(context);
                                  },
                                ),
                              ),
                            ];
                          },
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
            floatingActionButton: FloatingActionButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => TreatmentRoom()));
              },
              child: Icon(Icons.add, color: ui.homeTitleColor,),
              backgroundColor: ui.homeBackgroundColor,
            ),
          ),
        );
      },
    );

  }
}
