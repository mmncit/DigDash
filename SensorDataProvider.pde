class SensorDataProvider { 
  String filePath; // to store the path of the selected sensor data file
  Table dataTable; // to load the data in the csv input file
  int currentIndex; // representing the data row index that needs to be processed
  TableRow row; // row of the table

  SensorDataProvider () // default constructor
  {
    filePath = "";
    dataTable = null;
    currentIndex = 0;
    row = null;
  }
  void setFilePath(String filePath) // param constructor
  {
    this.filePath = filePath;
  }

  /** reads the whole input csv file and loads it into dataTable
   */
  void Initialize() {
    dataTable = loadTable(filePath, "header");
  }
  /** advances to the next line by incrementing currentIndex
   */
  void readNext() {
    if (dataTable == null) {
      noLoop();
      println("Table is not loaded");
    }
    // In order to make sure that the program does not crashes because of null reference, there should be a cap on incrementing currentIndex
    if (currentIndex < dataTable.getRowCount() - 1) {
      currentIndex++;
    } else {
      noLoop();
       fill(255, 0, 0);
       text("Quit the program (pressing 3) or restart (pressing 4) for another simulation", width * 0.2, height * 0.63);
    }
  }
  // display the values in the first and last 15% of the range differently
  color getCurrentColor(){
    if ((float)currentIndex <= 0.15 * (float) dataTable.getRowCount()) return color(random(200, 255), 0, 0); // set some random red colors  
    else if ((float)currentIndex >= 0.85 * (float) dataTable.getRowCount()) return color(0, 0, random(200, 255)); // set some random blue colors
    else return color(0, random(200, 255), 0); // some random green colors
  }
  /*
    read different values from current row of the data
   */
  float readRPM() {
    return (float) dataTable.getRow(currentIndex).getInt("RPM");
  }
  float readFuelLevel() {
    return dataTable.getRow(currentIndex).getFloat("Fuel Level (liter)");
  }
  float readRatio() {
    return dataTable.getRow(currentIndex).getFloat("Gear Ratio");
  }
  float readX() {
    return dataTable.getRow(currentIndex).getFloat("X");
  }
  float readY() {
    return dataTable.getRow(currentIndex).getFloat("Y");
  }
}
