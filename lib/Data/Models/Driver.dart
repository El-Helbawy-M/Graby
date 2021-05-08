class Driver {
  Driver(this._name, this._phone, this._balance, this._imagePath, this._price,
      this._carNumber);
  Driver.empty() {
    this.isEmpty = true;
  }
  //=================================== Variables
  String _name, _imagePath, _phone, _carNumber;
  int _balance, _price;
  bool isEmpty = false;
  //=================================== End
  //===================== Getters
  String get name => this._name;
  String get imagePath => this._imagePath;
  String get phone => this._phone;
  String get carNumber => this._carNumber;
  int get balance => this._balance;
  int get price => this._price;
  //===================== End
}
