class BenhNhan {
  String _ten;
  DateTime _ngaysinh;
  DateTime _ngaykham;
  String _diachi;
  int _cccd;
  int _idPDT; //id phong dieu tri

  BenhNhan(
      this._ten,
      this._ngaysinh,
      this._ngaykham,
      this._diachi,
      this._cccd,
      this._idPDT);

  int get cccd => _cccd;

  set cccd(int value) {
    _cccd = value;
  }

  String get diachi => _diachi;

  set diachi(String value) {
    _diachi = value;
  }

  DateTime get ngaykham => _ngaykham;

  set ngaykham(DateTime value) {
    _ngaykham = value;
  }

  DateTime get ngaysinh => _ngaysinh;

  set ngaysinh(DateTime value) {
    _ngaysinh = value;
  }

  String get ten => _ten;

  set ten(String value) {
    _ten = value;
  }

  int get idPDT => _idPDT;

  set idPDT(int value) {
    _idPDT = value;
  }
}