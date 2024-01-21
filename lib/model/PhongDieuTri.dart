class PhongDieuTri{
  int _id;
  String _name;
  int _sucChua;

  PhongDieuTri(this._id, this._name, this._sucChua);

  int get id => _id;

  set id(int value) {
    _id = value;
  }

  String get name => _name;

  set name(String value) {
    _name = value;
  }

  int get sucChua => _sucChua;

  set sucChua(int value) {
    _sucChua = value;
  }
}