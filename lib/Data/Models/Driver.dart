class Driver {
  Driver(this._name, this._phone, this._balance, this._imagePath, this._price);
  Driver.empty() {
    this.isEmpty = true;
  }
  //=================================== Variables
  String _name, _imagePath, _phone;
  int _balance, _price;
  bool isEmpty = false;
  //=================================== End
  //===================== Getters
  String get name => this._name;
  String get imagePath => this._imagePath;
  String get phone => this._phone;
  int get balance => this._balance;
  int get price => this._price;
  //===================== End
}
