class Gauge { 
  float min;
  float max;
  float val; // current value
  String unit; // Units
  PFont font; // font for displaying info 
  float x, y; // location of gauge
  float xOffset, yOffset; // for displaying the text in a specified location
  float size; // size of gauge; ellipse size
  color textColor;  // for changing colors
  
  Gauge() { // default constructor
    font = loadFont("font/DS-Digital-48.vlw");
    unit = "";
    min = Float.MAX_VALUE * (-1.0);
    max = Float.MAX_VALUE;
    xOffset = 0.0;
    yOffset = 0.0;
    size = 180.0; // default size
    textColor = color(255); // default color is white
  }
  void setMin(float min){
    this.min = min; 
  }
  void setMax(float max){
    this.max = max;
  }
  // receives the current value as parameter (argument) and sets it
  void setValue(float val) {
    //  It is required to check the value of the parameter for validity (between minimum and maximum) before setting the current value
    if (val <= max && val >= min){
      this.val = val;
    } else{ // if not passed show error meesage and exit
      println("Current value " + val + " is not in between " + min + " (min) and " + max + " (max)");
      exit(); 
    } 
  }
  void setUnit(String unit) {
    this.unit = unit;
  }
  void setLocation(float x, float y) {
    this.x = x;
    this.y = y;
  }
  void setFontOffset(float xOffset, float yOffset){
    this.xOffset = xOffset;
    this.yOffset = yOffset;
  }
  void setSize(float size){
    this.size = size;
  }
  void setColor(color textColor){
    this.textColor = textColor;
  }
  
  // draws the gauge on the screen
  void display() {
    
    ellipseMode(CENTER);  // Set ellipseMode to CENTER
    stroke(255); // set border to white
    strokeWeight(4);  // Thicker
    fill(0);  // Set fill to black
    ellipse(x, y, size, size);  // Draw gray ellipse using CENTER mode

    rectMode(CENTER);  // Set rectMode to CENTER

    fill(textColor); // update text color accordingly
    textFont(font, 42);
    String valueAsString = String.format ("%.1f", val);
    text(valueAsString, x - 40, y + 5);

    textFont(font, 15);
    fill(220); // fill with grey
    text(unit, (x + xOffset)  - 40 , (y + yOffset) + 110); // display Units
    
    String maxAsString =  String.format("%.1f", max);
    fill(255, 0, 0);
    text(("Max " + unit + ": " + maxAsString), (x + xOffset) - 70, (y + yOffset) - 95); // display current max value
    
    String minAsString =  String.format("%.1f", min);
    fill(0, 255, 0);
    text(("Min " + unit + ": " + minAsString), (x + xOffset) - 70, (y + yOffset) - 110); // display current min value
    
  }
}
