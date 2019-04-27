class TextField extends Gauge{
  
  String textField;
  
  void setTextField(String textField){
    this.textField = textField;
  }
  
  // override the display of gauge
  void display() {
    String valAsString =  String.format("%.1f", val);
    textFont(font, 18);
    fill(224, 65, 205);
    text((textField + ": " + valAsString + " "+ unit), x, y); // display set text field
  }

}
