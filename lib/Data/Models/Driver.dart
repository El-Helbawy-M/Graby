class Driver {
  Driver(this._name, this._phone, this._balance, this._imagePath);
  //=================================== Variables
  String _name, _imagePath, _phone;
  int _balance;
  //=================================== End
  //===================== Getters
  String get name => this._name;
  String get imagePath => this._imagePath;
  String get phone => this._phone;
  int get balance => this._balance;
  //===================== End
}
