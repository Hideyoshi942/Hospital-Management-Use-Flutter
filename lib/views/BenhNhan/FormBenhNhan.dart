import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hospitalmanagementproject/models/BenhNhan.dart';
import 'package:intl/intl.dart';
import 'package:hospitalmanagementproject/data/data.dart';
import 'package:hospitalmanagementproject/data/data.dart';
import '../../models/PhongDieuTri.dart';


class MyDropdownButtonFormField extends StatefulWidget {
  List phongdieutri = data.DataPhongDieuTri();
  List<int> IdPhongDT;
  MyDropdownButtonFormField(this.IdPhongDT);

  get pdt => phongdieutri;

  PhongDieuTri? select;

  PhongDieuTri? returnSelect(){
    return select;
  }

  @override
  _MyDropdownButtonFormFieldState createState() =>
      _MyDropdownButtonFormFieldState();
}

class _MyDropdownButtonFormFieldState extends State<MyDropdownButtonFormField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // DropdownButtonFormField
        DropdownButtonFormField<PhongDieuTri>(
          value: widget.select,
          onChanged: (PhongDieuTri? newValue) {
            setState(() {
              widget.select = newValue;
              widget.IdPhongDT[0] = widget.select!.id;
            });
          },
          items: widget.pdt
              .map<DropdownMenuItem<PhongDieuTri>>((PhongDieuTri value) {
            return DropdownMenuItem<PhongDieuTri>(
              value: value,
              child: Text(value.id.toString()),
            );
          }).toList(),
          decoration: InputDecoration(
            labelText: 'chon id phong dieu tri',
            border: OutlineInputBorder(), // Khung viền
          ),
        ),
      ],
    );
  }
}

class DateSelect extends StatefulWidget {
  String name;
  List<DateTime> datetime;
  DateSelect(this.name, this.datetime);
  @override
  State<StatefulWidget> createState() {
    return DateSelectState();
  }
}

class DateSelectState extends State<DateSelect> {
  DateTime selectedDate = DateTime.now();
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2050),
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
        widget.datetime[0] = selectedDate;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            fixedSize: Size(160, 60),
          ),
          onPressed: () => _selectDate(context),
          icon: Icon(Icons.calendar_today, color: Colors.black87),
          label: Text(widget.name, style: (TextStyle(fontSize: 16, color: Colors.black87, fontWeight: FontWeight.w400)),),
        ),
        SizedBox(width: 40,),
        Text(DateFormat('yyyy/MM/dd').format(selectedDate), style: TextStyle(fontSize: 20, ),),
      ],
    );
  }
}