class User {
  User(this._name, this._phone, this._balance);
  //=================================== Variables
  String _name, _phone;
  int _balance;
  //=================================== End
  //===================== Getters
  String get name => this._name;
  String get phone => this._phone;
  int get balance => this._balance;
  //===================== End
}
