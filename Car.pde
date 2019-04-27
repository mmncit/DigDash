class Car {
  // holds an instance of three computing classes as member variables
  TripComputer tripComputer = new TripComputer();
  FuelTank fuelTank = new FuelTank();
  FuelComputer fuelComputer = new FuelComputer();

  void processInput(SensorDataProvider sensorDataProvider) {
    
    tripComputer.setRPM(sensorDataProvider.readRPM());
    tripComputer.setgearRatio(sensorDataProvider.readRatio());
    
    tripComputer.updateTotalDistance(); // update total distance
    
    fuelTank.setFuelLevel(sensorDataProvider.readFuelLevel()); // set the current fuel level and update previous fuel level
    
    // calculate fuel economy based on traversed distance (km) in last second and diff of fuel level
    fuelComputer.calculateFuelEconomy(tripComputer.getdistanceTravelled(), fuelTank.getConsumedFuel()); 
    // calculate avg fuel economy
    fuelComputer.calculateAverageFuelEconomy(fuelComputer.getFuelEconomy());
    fuelComputer.calculateFuelConsumption();
    
    fuelComputer.calculateRange(fuelTank.getRemainingFuel());
    
    // get direction of the vehicle for the current location and previous location
    tripComputer.setLocation(sensorDataProvider.readX(), sensorDataProvider.readY());
  }

  void setRadius(float radius) {
    tripComputer.setRadius(radius);
  }

  float getCurrentSpeed() {
    return tripComputer.getCurrentSpeed();
  }
  
  float getTotalDistance() {
    return tripComputer.getTotalTravelledDistance();
  }
  
  void setTankCapacity(float tankCapacity){
    fuelTank.setTankCapacity(tankCapacity);
  }
  float getFuelEconomy(){
    return fuelComputer.getFuelEconomy();
  }
  float getAverageFuelEconomy(){
    return fuelComputer.getAverageFuelEconomy();
  }
  float getFuelConsumption(){
    return fuelComputer.getFuelConsumption();
  }
  float getRange(){
    return fuelComputer.getRange();
  }
  String getDirection(){
    return tripComputer.getDirection();
  }
  
  color getCurrentColor(){
    return sensorDataProvider.getCurrentColor();
  }
  
}
