SensorDataProvider sensorDataProvider;
Car car; // holds an instance of three computing classes
Gauge speedometer; // A gauge for displaying the current speed in km/h
Gauge tachometer; // A gauge for displaying the current engine RPM
Gauge fuelGauge; // A gauge for showing the current fuel level of the tank in liter
BoxField direction; // A simple indicator specifying the direction of the vehicle based on the input location data.

TextField odometer; // A text field for displaying the total distance travelled by the car in km
TextField fuelEconomy; // A text field showing the fuel economy in km/liter
TextField fuelConsumption; // A text field for showing the average fuel consumption for travelling 100 km.
TextField range; // A text field for showing the distance (km) car can travel on the remaining fuel in the fuel tank.

Chart avgFuelEconomy; // A chart displaying the history of the last 40 calculated average fuel economy values.
Chart fuelConsumptionHistory; // A chart displaying the last 40 calculated fuel consumption values.

boolean showDashboard;

void setup() {

  size(1200, 650);
  frameRate(2);

  sensorDataProvider = new SensorDataProvider();
  car = new Car();

  speedometer = new Gauge();
  speedometer.setLocation(width * 0.25, height * 0.33);
  speedometer.setUnit("Speed (KM/H)");
  speedometer.setMin(0.0);
  speedometer.setMax(300.0);

  tachometer = new Gauge();
  tachometer.setLocation(width * 0.5, height * 0.33);
  tachometer.setUnit("RPM");
  tachometer.setFontOffset(20, 0); // display unit of RPM to somewhat at bottom-center of the gauge
  tachometer.setMin(0.0);
  tachometer.setMax(3000.0);

  fuelGauge = new Gauge();
  fuelGauge.setLocation(width* 0.75, height * 0.33);
  fuelGauge.setUnit("Fuel (LITER)");
  fuelGauge.setMin(0.0);
  

  direction = new BoxField();
  direction.setLocation(width * 0.5, height * 0.07);
  direction.setSize(80);

  odometer = new TextField();
  odometer.setLocation(width* 0.16, height * 0.55);
  odometer.setTextField("Odometer");
  odometer.setUnit("km");

  fuelEconomy = new TextField();
  fuelEconomy.setLocation(width* 0.16, height * 0.58);
  fuelEconomy.setTextField("Fuel Economy");
  fuelEconomy.setUnit("km/liter");

  fuelConsumption = new TextField();
  fuelConsumption.setLocation(width* 0.5, height * 0.58);
  fuelConsumption.setTextField("Fuel Consumption");
  fuelConsumption.setUnit("liter/(100 km)");

  range = new TextField();
  range.setLocation(width* 0.5, height * 0.55);
  range.setTextField("Range");
  range.setUnit("km");

  avgFuelEconomy = new Chart(this);
  avgFuelEconomy.setMax(20);
  avgFuelEconomy.setText("Average Fuel Economy (km/liter) over time (sec)");
  avgFuelEconomy.setLocation(width * 0.1, height * 0.63);

  fuelConsumptionHistory = new Chart(this);
  fuelConsumptionHistory.setMax(30);
  fuelConsumptionHistory.setText("Fuel Consumption (liter) over time (sec)");
  fuelConsumptionHistory.setLocation(width * 0.55, height * 0.63);
}

void draw() {

  background(0); // render blackground as black

  if (showDashboard) {

    car.processInput(sensorDataProvider);

    // draws the gauges 
    speedometer.setValue(car.getCurrentSpeed());
    speedometer.setColor(car.getCurrentColor());
    speedometer.display(); 

    tachometer.setValue(sensorDataProvider.readRPM());
    tachometer.setColor(car.getCurrentColor());
    tachometer.display(); 

    fuelGauge.setValue(sensorDataProvider.readFuelLevel());
    fuelGauge.setColor(car.getCurrentColor());
    fuelGauge.display(); 

    direction.setValue(car.getDirection());
    direction.setColor(car.getCurrentColor());
    direction.display();

    // display the text fields

    odometer.setValue(car.getTotalDistance());
    odometer.display(); 

    fuelEconomy.setValue(car.getFuelEconomy());
    fuelEconomy.display();

    fuelConsumption.setValue(car.getFuelConsumption());
    fuelConsumption.display();

    range.setValue(car.getRange());
    range.display();

    // Display charts

    avgFuelEconomy.addHistoryData(car.getAverageFuelEconomy());
    avgFuelEconomy.display();

    fuelConsumptionHistory.addHistoryData(car.getFuelConsumption());
    fuelConsumptionHistory.display();

    sensorDataProvider.readNext();
  } else {
    // Show the menu
    fill(255);
    textFont(createFont("Arial", 12), 32);
    text("Press one of the following numbers:", width * .08, height * 0.11);
    text("1. Minicar", width * .08, height * 0.26);
    text("2. Truck", width * .08, (height * 0.26) + 100);
    text("3. Quit the program", width * .08, (height * 0.26) + 200);
  }
}

void keyPressed() {
  if (keyPressed) {
    if (key == '1') {
      showDashboard = true;
      sensorDataProvider.setFilePath("data/car_status_BMW_323i.csv");
      sensorDataProvider.Initialize();
      car.setRadius(23);
      car.setTankCapacity(60);
      fuelGauge.setMax(60);
      loop();
    } else if (key == '2') {
      showDashboard = true;
      sensorDataProvider.setFilePath("data/car_status_Truck_F150.csv");
      sensorDataProvider.Initialize();
      car.setRadius(25.4);
      car.setTankCapacity(80);
      fuelGauge.setMax(80);
      loop();
    } else if (key == '3') {
      exit(); // quit the program
    } else if (key == '4') {
      reset(); // restart program
    }
  } else {
    showDashboard = false;
    noLoop();
  }
}
void reset() {
  setup();
  showDashboard = false;
  loop();
}
