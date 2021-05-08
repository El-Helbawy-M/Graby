class User {
  User(this.name, this._phone, this._balance, this._points);
  User.empty() {
    this.isEmpty = true;
  }
  //=================================== Variables
  String name, _phone;
  int _balance, _points;
  bool isEmpty = false;
  //=================================== End
  //===================== Getters
  // String get name => this.name;
  String get phone => this._phone;
  int get balance => this._balance;
  int get points => this._points;
  //===================== End

  //===================== Set
  set balance(int value) => this._balance = value;
  set points(int value) => this._points = value;
  //===================== End
}
