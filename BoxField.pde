class BoxField extends Gauge{
  
  String strText;
  
  // override set value to take string input
  void setValue(String strText){
    this.strText = strText;
  }
  
  // override the display of gauge
  void display() {
    rectMode(CENTER);  // Set rectMode to CENTER
    stroke(random(50, 255), random(50, 255), random(50, 255)); // set border to random color
    strokeWeight(4);  // Thicker
    fill(0);  // Set fill to black
    rect(x, y, size, size, 7);
    
    rectMode(CORNER);  // set rectMode to CORNER

    fill(textColor);
    textFont(font, 42);
    text(strText, x - (size/4) , y + (size/4));

    
    
  }

}
