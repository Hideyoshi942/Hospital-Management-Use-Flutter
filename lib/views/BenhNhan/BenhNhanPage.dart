import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hospitalmanagementproject/models/BenhNhan.dart';
import 'package:hospitalmanagementproject/views/BenhNhan/FormBenhNhan.dart';
import 'package:hospitalmanagementproject/data/data.dart';
import 'package:hospitalmanagementproject/views/BenhNhan/ThemBenhNhan.dart';
import 'package:intl/intl.dart';

class BenhNhanPage extends StatefulWidget {
  final List<BenhNhan> danhsachBenhNhan;

  BenhNhanPage(this.danhsachBenhNhan);

  @override
  State<StatefulWidget> createState() {
    return BenhNhanPageState();
  }
}

class BenhNhanPageState extends State<BenhNhanPage> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Center(
          child: Text(
            "thong tin benh nhan",
            style: TextStyle(fontSize: 30),
          ),
        ),
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
                children: widget.danhsachBenhNhan.map((e) {
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
      persistentFooterButtons: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.deepOrangeAccent,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10))),
          onPressed: () {
            // Chuyển đến màn hình mới
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ThemBenhNhan()),
            );
          },
          child: Icon(Icons.person_add_rounded),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.deepOrangeAccent,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10))),
          onPressed: () {},
          child: Icon(Icons.person_remove),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.deepOrangeAccent,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10))),
          onPressed: () {},
          child: Icon(Icons.edit),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.deepOrangeAccent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              )),
          onPressed: () {},
          child: Icon(Icons.person_search),
        ),
      ],
    );
  }
}
