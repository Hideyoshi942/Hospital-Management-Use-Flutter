import '../models/BenhNhan.dart';
import '../models/PhongDieuTri.dart';

class data{
  static List<BenhNhan> _benhnhan = [
    BenhNhan("ho duc thanh", DateTime.now(), DateTime.now(), "nghe an", 1234567890, _phongdieutri[0].id),
    BenhNhan("bui anh viet", DateTime.now(), DateTime.now(), "nam dinh", 0987654321, _phongdieutri[1].id),
  ];
  static List<PhongDieuTri> _phongdieutri = [PhongDieuTri(1), PhongDieuTri(2)];

  static List<BenhNhan> DataBenhNhan(){
    return _benhnhan;
  }

  static List<PhongDieuTri> DataPhongDieuTri(){
    return _phongdieutri;
  }
}