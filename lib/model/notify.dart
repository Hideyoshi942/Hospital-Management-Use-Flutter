class Notify {
  String _notify;
  int _numberNotify;

  Notify(this._notify, this._numberNotify);

  String get notify => _notify;

  set notify(String value) {
    _notify = value;
  }


  int get numberNotify => _numberNotify;

  set numberNotify(int value) {
    _numberNotify = value;
  }

  int countElements() {
    return _numberNotify;
  }
}