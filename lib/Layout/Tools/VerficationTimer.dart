class VerficationTimer {
  int seconds, minutes;
  VerficationTimer() {
    this.seconds = 0;
    this.minutes = 2;
  }
  runTime() {
    if (this.seconds == 0) {
      this.seconds = 59;
      this.minutes--;
    } else
      this.seconds--;
  }
}
