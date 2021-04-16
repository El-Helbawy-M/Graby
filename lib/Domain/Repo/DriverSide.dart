class DriverSide {
  String _name, _phone, _imagePath;
  int _price, _balance;
  DriverSide(
      this._name, this._phone, this._price, this._imagePath, this._balance);
  //================ Getters
  String get name => this._name;
  String get phone => this._phone;
  int get price => this._price;
  int get balance => this._balance;
  String get image => this._imagePath;
  //================ End
}
