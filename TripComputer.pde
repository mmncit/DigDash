class TripComputer {

  float rpm = 0.0;
  float gearRatio = 0.0;
  float totalTravelledDistance = 0.0;
  float radius = 0.0;
  float x = 0, y = 0; // current input location of vehicle
  float prevx, prevy; // previous location of vehicle

  void setRPM(float rpm) {
    this.rpm = rpm;
  }
  void setgearRatio(float gearRatio) {
    this.gearRatio = gearRatio;
  }
  void setRadius(float radius) {
    this.radius = radius * 0.01; // * 0.01 to convert it into meter
  }
  void setLocation(float x, float y) {
    // update previous x and y
    prevx = this.x;
    prevy = this.y;
    // set current x and y
    this.x = x;
    this.y = y;
  }

  float getCurrentSpeed() {
    return (rpm / 60.0) * (1.0 / gearRatio) * TWO_PI * radius * 3.6; // * 3.6 to convert into km/h
  }

  float getdistanceTravelled() {
    // Multiplying revolutions of the wheel by its perimeter calculates the distance travelled in 1 sec
    return (rpm / 60.0) * (1.0 / gearRatio) * TWO_PI * radius * 0.001; // * 0.001 to convert into km
  }

  void updateTotalDistance() {
    totalTravelledDistance += getdistanceTravelled();
  }

  float getTotalTravelledDistance() {
    return totalTravelledDistance;
  }
  String getDirection() {
    if (x > prevx && y > prevy) return "NE";
    else if (x > prevx && y < prevy) return "SE";
    else if (x < prevx && y < prevy) return "SW";
    else if (x < prevx && y > prevy) return "NW";
    else if (x == prevx && y > prevy) return " E ";
    else if (x == prevx && y < prevy) return " W ";
    else if (x > prevx && y == prevy) return " N ";
    else if (x < prevx && y == prevy) return " S ";
    else return " X ";
  }
}
