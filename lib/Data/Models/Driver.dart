class Driver {
  Driver(this.name, this.phone, this.balance, this.imagePath, this.price, this.carNumber, this.startPoint, this.endPoint);
  Driver.empty() {
    this.isEmpty = true;
  }
  //=================================== Variables
  String name, imagePath, phone, carNumber, endPoint, startPoint;
  int balance, price;
  bool isEmpty = false;
  //=================================== End
}
