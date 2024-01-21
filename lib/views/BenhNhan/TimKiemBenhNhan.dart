import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hospitalmanagementproject/model/BenhNhan.dart';
import 'package:intl/intl.dart';

class TimKiemBenhNhan extends StatelessWidget{
  final List<BenhNhan> danhsachbenhnhan;

  TimKiemBenhNhan(this.danhsachbenhnhan);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,

      ),
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: Center(
              child: Container(
                width: double.infinity,
                height: double.infinity,
                color: Colors.blue,
                child: Icon(
                  Icons.account_circle_rounded,
                  size: 150,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 8,
            child: SingleChildScrollView(
              child: Column(
                children: danhsachbenhnhan.map((e) {
                  return Card(
                    margin: EdgeInsets.all(10),
                    shadowColor: Colors.black87,
                    elevation: 12,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Icon(Icons.person),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "Tên: ${e.ten}",
                              style: TextStyle(fontSize: 20),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.calendar_month_outlined),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "Ngày Sinh: ${DateFormat("yyyy/MM/dd").format(e.ngaysinh)}",
                              style: TextStyle(fontSize: 20),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.perm_contact_calendar_outlined),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "Ngày Khám: ${DateFormat("yyyy/MM/dd").format(e.ngaykham)}",
                              style: TextStyle(fontSize: 20),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.home_filled),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "Địa Chỉ: ${e.diachi}",
                              style: TextStyle(fontSize: 20),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.credit_card_sharp),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "Cccd: ${e.cccd}",
                              style: TextStyle(fontSize: 20),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.room_preferences),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "Id Phòng Điều Trị: ${e.idPDT}",
                              style: TextStyle(fontSize: 20),
                            )
                          ],
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }

}