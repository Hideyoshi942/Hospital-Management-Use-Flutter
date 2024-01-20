import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hospitalmanagementproject/models/BenhNhan.dart';
import 'package:hospitalmanagementproject/views/BenhNhan/FormBenhNhan.dart';
import 'package:hospitalmanagementproject/data/data.dart';
import 'package:hospitalmanagementproject/views/BenhNhan/SuaBenhNhan.dart';
import 'package:hospitalmanagementproject/views/BenhNhan/ThemBenhNhan.dart';
import 'package:intl/intl.dart';

import 'TimKiemBenhNhan.dart';

class BenhNhanPage extends StatefulWidget {
  final List<BenhNhan> danhsachBenhNhan;
  List<BenhNhan> timkiemBenhNhan = [];

  BenhNhanPage(this.danhsachBenhNhan);

  @override
  State<StatefulWidget> createState() {
    return BenhNhanPageState();
  }
}

class BenhNhanPageState extends State<BenhNhanPage> {
  int count = 0;
  final xoacccdCt = TextEditingController();
  final timkiemCt = TextEditingController();

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
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => ThemBenhNhan()),
            );
          },
          child: Icon(Icons.person_add_rounded),
        ), //button them
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.deepOrangeAccent,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          ),
          onPressed: () {
            showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return Card(
                    // color: Colors.blue[200],
                    child: Container(
                      height: 400,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(height: 30,),
                          Row(
                            children: [
                              SizedBox(
                                child: TextFormField(
                                  expands: false,
                                  decoration: InputDecoration(
                                    labelText: "cccd",
                                    border: OutlineInputBorder(),
                                  ),
                                  controller: xoacccdCt,
                                ),
                                width: 300,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  int? cccd = int.tryParse(xoacccdCt.text);
                                  int index = -1;
                                  if (cccd != null) {
                                    index = data.TimBenhNhan_cccd(cccd);
                                  }
                                  if (index != -1) {
                                    data.DataBenhNhan().removeAt(index);
                                    setState(() {});
                                  } else {
                                    final snackBar = SnackBar(
                                      content:
                                          Text('không có người sở hữu cccd nay'),
                                    );

                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(snackBar);
                                  }
                                  xoacccdCt.clear();
                                  Navigator.pop(context);
                                },
                                child: Icon(
                                  Icons.remove_outlined,
                                ),
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.deepOrangeAccent,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10)),
                                    fixedSize: Size(70, 68)),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                });
          },
          child: Icon(Icons.person_remove),
        ), //button xoa
        ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.deepOrangeAccent,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10))),
          onPressed: () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => SuaBenhNhan(),
                ));
          },
          child: Icon(Icons.edit),
        ), //button sua
        ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.deepOrangeAccent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              )),
          onPressed: () {
            showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return Card(
                    child: Container(
                      height: 400,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 30,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  child: TextFormField(
                                    expands: false,
                                    decoration: InputDecoration(
                                      labelText: "cccd",
                                      border: OutlineInputBorder(),
                                    ),
                                    controller: timkiemCt,
                                  ),
                                  width: 300,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                ElevatedButton(
                                    onPressed: () {
                                      setState(() {
                                        widget.timkiemBenhNhan.clear();
                                      });

                                      int cccd = -1;
                                      int? cccdtemp =
                                          int.tryParse(timkiemCt.text);
                                      if (cccdtemp != null) {
                                        cccd = cccdtemp;
                                      }
                                      if (cccd == -1) {
                                        final snackBar = SnackBar(
                                          content:
                                              Text('bạn nhập không đủ dữ liệu'),
                                        );

                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(snackBar);
                                      } else {
                                        data.DataBenhNhan().forEach((e) {
                                          if (e.cccd == cccd) {
                                            widget.timkiemBenhNhan.add(e);
                                          }
                                        });
                                        if (widget.timkiemBenhNhan.length ==
                                            0) {
                                          final snackBar = SnackBar(
                                            content: Text(
                                                'không có ai có cccd như vây'),
                                          );

                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(snackBar);
                                        } else {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    TimKiemBenhNhan(
                                                        widget.timkiemBenhNhan),
                                              ));
                                          setState(() {
                                            timkiemCt.clear();
                                          });
                                        }
                                      }
                                    },
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            Colors.deepOrangeAccent,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        fixedSize: Size(70, 68)),
                                    child: Icon(Icons.search))
                              ],
                            ),
                          ]),
                    ),
                  );
                });
          },
          child: Icon(Icons.person_search),
        ), //button tim kiem
      ],
    );
  }
}
