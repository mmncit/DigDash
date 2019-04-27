class FuelTank{
  float tankCapacity = 0; // in liter
  float fuelLevel = 0;
  float prevFuelLevel = 0;
  
  void setTankCapacity(float tankCapacity){
    this.tankCapacity = tankCapacity;
    prevFuelLevel = tankCapacity; // considering initially fuel was full, is it ok?
  }
  
  void setFuelLevel(float fuelLevel){
    prevFuelLevel = this.fuelLevel; // update previous fuel level
    this.fuelLevel = fuelLevel; // set the current fuel level
  }
  
  float getConsumedFuel(){
    // Consumed fuel is calculated by subtracting current level from previous level
    return abs(prevFuelLevel - fuelLevel);
  }
  // FuelTank calculates the remaining fuel using the input fuel level
  float getRemainingFuel(){
    return fuelLevel; // remaining fuel = current fuel level ??
  }

}
