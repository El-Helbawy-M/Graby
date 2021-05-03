class User {
  User(this._name, this._phone, this._balance, this._points);
  User.empty() {
    this.isEmpty = true;
  }
  //=================================== Variables
  String _name, _phone;
  int _balance, _points;
  bool isEmpty = false;
  //=================================== End
  //===================== Getters
  String get name => this._name;
  String get phone => this._phone;
  int get balance => this._balance;
  int get points => this._points;
  //===================== End

  //===================== Set
  set balance(int value) => this._balance = value;
  set points(int value) => this._points = value;
  //===================== End
}
