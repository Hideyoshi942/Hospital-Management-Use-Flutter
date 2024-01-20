import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hospitalmanagementproject/data/data.dart';
import 'BenhNhanPage.dart';
import 'FormBenhNhan.dart';

class SuaBenhNhan extends StatelessWidget {
  final tenCt = TextEditingController();
  final diachiCt = TextEditingController();
  final cccdCt = TextEditingController();
  final List<int> idPhongDT = [-1];
  List<DateTime> ngaysinh = [DateTime.now()];
  List<DateTime> ngaykham = [DateTime.now()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Form(
                child: Column(
                  children: [
                    TextFormField(
                      expands: false,
                      decoration: InputDecoration(
                        labelText: "Ten",
                        prefixIcon: Icon(Icons.people),
                        border: OutlineInputBorder(),
                      ),
                      controller: tenCt,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    DateSelect("ngay sinh", ngaysinh),
                    SizedBox(
                      height: 10,
                    ),
                    DateSelect("ngay kham", ngaykham),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      expands: false,
                      decoration: InputDecoration(
                        labelText: "dia chi",
                        prefixIcon: Icon(Icons.home),
                        border: OutlineInputBorder(),
                      ),
                      controller: diachiCt,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      expands: false,
                      decoration: InputDecoration(
                        labelText: "can cuoc cong dan",
                        prefixIcon: Icon(Icons.credit_card),
                        border: OutlineInputBorder(),
                      ),
                      controller: cccdCt,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    MyDropdownButtonFormField(idPhongDT),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.orange,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                fixedSize: Size(double.infinity, 60)),
                            onPressed: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        BenhNhanPage(data.DataBenhNhan()),
                                  ));
                            },
                            child: Icon(
                              Icons.arrow_back,
                              size: 50,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.deepOrangeAccent,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  fixedSize: Size(double.infinity, 60)),
                              onPressed: () {
                                String ten = '';
                                ten = tenCt.text;
                                String diachi = '';
                                diachi = diachiCt.text;
                                int cccd = -1;
                                int? cccdtemp = int.tryParse(cccdCt.text);
                                if (cccdtemp != null) {
                                  cccd = cccdtemp;
                                }
                                int id = idPhongDT[0];
                                DateTime ns = ngaysinh[0];
                                DateTime nk = ngaykham[0];
                                bool check = false;
                                int indexedit = -1;
                                for (int i = 0;
                                    i < data.DataBenhNhan().length;
                                    i++) {
                                  if (cccd == -1) {
                                    break;
                                  }
                                  if (cccd == data.DataBenhNhan()[i].cccd) {
                                    indexedit = i;
                                    check = true;
                                  }
                                }
                                if (check &&
                                    ten != '' &&
                                    diachi != '' &&
                                    cccd != -1 &&
                                    id != -1) {
                                  data.DataBenhNhan()[indexedit].ten = ten;
                                  data.DataBenhNhan()[indexedit].diachi =
                                      diachi;
                                  data.DataBenhNhan()[indexedit].ngaysinh =
                                      ngaysinh[0];
                                  data.DataBenhNhan()[indexedit].ngaykham =
                                      ngaykham[0];
                                  data.DataBenhNhan()[indexedit].idPDT = id;
                                  //dieu huong
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            BenhNhanPage(data.DataBenhNhan())),
                                  );
                                } else {
                                  final snackBar = SnackBar(
                                    content: Text('bạn nhập không đủ dữ liệu \nhoặc không có ai có cccd như vây'),
                                  );

                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBar);
                                }
                              },
                              child: Icon(
                                Icons.mode_edit,
                                size: 50,
                              )),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
