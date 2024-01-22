import 'package:hospitalmanagementproject/model/notify.dart';

import '../model/BenhNhan.dart';
import '../model/PhongDieuTri.dart';

class data{
  static List<BenhNhan> _benhnhan = [
    BenhNhan("ho duc thanh", DateTime.now(), DateTime.now(), "nghe an", 1234567890, _phongdieutri[0].id),
    BenhNhan("bui anh viet", DateTime.now(), DateTime.now(), "nam dinh", 0987654321, _phongdieutri[1].id),
  ];
  static List<PhongDieuTri> _phongdieutri = [PhongDieuTri(1, 'Phong hoi suc', 5), PhongDieuTri(2, 'Phong cap cuu', 1)];

  static List<BenhNhan> DataBenhNhan(){
    return _benhnhan;
  }

  static List<PhongDieuTri> DataPhongDieuTri(){
    return _phongdieutri;
  }

  static List<Notify> _notify = [];
  static List<Notify> DataNotify(){
    return _notify;
  }

  static int TimBenhNhan_cccd(int x){
    for(int i = 0; i< _benhnhan.length; i++){
      if(_benhnhan[i].cccd == x){
        return i;
      }
    }
    return -1;
  }

  static bool kiemTraTonTaiCCCD(int x){
    for (var cccd in data.DataBenhNhan()) {
      if (cccd.cccd == x) {
        return true;
      }
    }
    return false;
  }

  static bool kiemTraTonTaiId(int id) {
    for (var phongDieuTri in data.DataPhongDieuTri()) {
      if (phongDieuTri.id == id) {
        return true;
      }
    }
    return false;
  }
  static xoaPhongDieuTri(PhongDieuTri phong) {
    _phongdieutri.remove(phong);
  }

  static void capNhatPhongDieuTri(PhongDieuTri oldPhong, int newId, String newName, int newSucChua) {
    int index = _phongdieutri.indexWhere((phong) => phong == oldPhong);

    if (index != -1) {
      PhongDieuTri updatedPhong = PhongDieuTri(newId, newName, newSucChua);
      PhongDieuTri updatedPhong1 = PhongDieuTri(oldPhong.id, newName, newSucChua);

      _phongdieutri[index] = updatedPhong;

      for (var benhNhan in _benhnhan) {
        if (benhNhan.idPDT == oldPhong.id) {
          benhNhan.idPDT = newId;
        }
      }
    }
  }
}
