import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hospitalmanagementproject/data/data.dart';
import 'package:hospitalmanagementproject/model/PhongDieuTri.dart';
import 'package:hospitalmanagementproject/model/mysetting.dart';
import 'package:hospitalmanagementproject/views/treatment/list_treatment.dart';
import 'package:provider/provider.dart';

class TreatmentRoom extends StatefulWidget {
  final PhongDieuTri? phongDieuTri;
  const TreatmentRoom({Key? key, this.phongDieuTri}) : super(key: key);

  @override
  State<TreatmentRoom> createState() => _TreatmentState();
}

class _TreatmentState extends State<TreatmentRoom> {
  final maPhongController = TextEditingController();
  final tenPhongController = TextEditingController();
  final sucChuaController = TextEditingController();
  @override
  void initState() {
    super.initState();
    if (widget.phongDieuTri != null) {
      maPhongController.text = widget.phongDieuTri!.id.toString();
      tenPhongController.text = widget.phongDieuTri!.name;
      sucChuaController.text = widget.phongDieuTri!.sucChua.toString();
    }
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<MySetting>(
      builder: (context, ui, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Thông tin phòng điều trị'),
            backgroundColor: ui.homeTitleColor,
            foregroundColor: ui.homeBackgroundColor,
          ),
          body: Container(
            child: Card(
              elevation: 3,
              child: Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    TextField(
                      decoration: InputDecoration(labelText: 'Mã số phòng'),
                      controller: maPhongController,
                    ),
                    TextField(
                      decoration: InputDecoration(labelText: 'Tên phòng'),
                      controller: tenPhongController,
                    ),
                    TextField(
                      decoration: InputDecoration(labelText: 'Sức chứa phòng'),
                      controller: sucChuaController,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        int? maPhong = int.tryParse(maPhongController.text);
                        String tenPhong = tenPhongController.text;
                        int? sucChua = int.tryParse(sucChuaController.text);
                        if (maPhong != null && maPhong.toString().length >= 3 && tenPhong.isNotEmpty && sucChua != null) {
                          if (widget.phongDieuTri == null) {
                            if (data.kiemTraTonTaiId(maPhong)) {
                              final snackBar = SnackBar(content: Text('ID đã tồn tại. Vui lòng nhập ID khác.'));
                              ScaffoldMessenger.of(context).showSnackBar(snackBar);
                            } else {
                              data.DataPhongDieuTri().add(PhongDieuTri(maPhong, tenPhong, sucChua));
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(builder: (_) => ListTreatment(data.DataPhongDieuTri())),
                              );
                            }
                          } else {
                            if (maPhong != data.kiemTraTonTaiId(maPhong)) {
                              data.capNhatPhongDieuTri(widget.phongDieuTri!, maPhong, tenPhong, sucChua);
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(builder: (_) => ListTreatment(data.DataPhongDieuTri())),
                              );
                            } else {
                              final snackBar = SnackBar(content: Text('Không thể thay đổi mã phòng.'));
                              ScaffoldMessenger.of(context).showSnackBar(snackBar);
                            }
                          }
                        } else {
                          final snackBar = SnackBar(content: Text('Thông tin không hợp lệ. Vui lòng kiểm tra lại.'));
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }

                      },
                      child: Text('Lưu'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
