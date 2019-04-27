import java.util.Queue;
import java.util.LinkedList;

class FuelComputer {
  float fuelEconomy;
  float fuelConsumption; // Fuel consumption is the average fuel consumed by car to travel 100 km
  float fuelEconomyHistory; // summation of previous fuel economy
  float range; // range is the estimated number of kilometers the vehicle can go before running out of fuel.
  int n_seconds; // size limit
  Queue<Float> fuelEconomyStorage; // queue for the storing fuel economy
  float averageFuelEconomy;
  

  FuelComputer() {
    fuelEconomyStorage = new LinkedList<Float>(); 
    fuelEconomyHistory = 0.0;
    n_seconds = 60;
  }
  /**
   * Calculates current fuel economy and call calculateAverageFuelEconomy
   * @param distanceTravelled - distance travelled (in km) in a second
   * @param consumedFuel - current fuel level and previous fuel level in liters (fuel consumed during the past second)
   */
  void calculateFuelEconomy(float distanceTravelled, float consumedFuel) {
    if (consumedFuel == 0.0) fuelEconomy = 0.0; // distanceTravelled / 0.0 is set to 0.0 to avoid Infinity. What should be the fuelEconomy in such case?
    else fuelEconomy = distanceTravelled / consumedFuel;
  }
  float getFuelEconomy() {
    return fuelEconomy;
  }
  /**
   * Inserts fuel economy into the storage to calculate avg
   * @param fuelEconomy - fuel economy
   */
  void calculateAverageFuelEconomy(float fuelEconomy) {
    if (fuelEconomyStorage.size() == n_seconds) {
      fuelEconomyHistory -= fuelEconomyStorage.remove(); // dequeue and substract from history
    }
    fuelEconomyHistory += fuelEconomy; // add fuel Economy into history
    fuelEconomyStorage.add(fuelEconomy); // enqueue into storage after remove the last element to avoid overflow
    averageFuelEconomy = fuelEconomyHistory / (float) fuelEconomyStorage.size(); // avg of fuel economy history
  }
  /*
  * @return avg of fuel economy 
   */
  float getAverageFuelEconomy()
  {    
    return averageFuelEconomy;
  }
  void calculateFuelConsumption() {
    // Fuel Consumption = 1/AverageFuelEconomy(km/liter)*100(km)
    fuelConsumption = (1.0 / averageFuelEconomy) * 100.0;
  }
  float getFuelConsumption() {
    return fuelConsumption;
  }
   
  void calculateRange(float remainingFuel){
    // range is caulcated based on average fuel economy during the past 60 seconds and remaining fuel
    range = averageFuelEconomy * remainingFuel;
  }
  float getRange(){
    return range;
  }
}
