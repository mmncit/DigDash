import org.gicentre.utils.stat.*;
import java.util.Queue;
import java.util.LinkedList;

class Chart extends BarChart {

  float[] sample_data;
  int n_samples = 0; // number of samples for showing history
  Queue<Float> historyQueue; // queue for the storing chart's history
  String stringText;
  float maxValue;
  float x, y; // x,y location of the chart
  
  Chart(PApplet parentSketch) {
    super(parentSketch);
    if (n_samples == 0) n_samples = 40;
    sample_data = new float[n_samples];
    historyQueue = new LinkedList<Float>(); 
  }
  void setNumberOfSamples(int n_samples){
    this.n_samples = n_samples;
  }
  void addHistoryData(float dataVal){
    if (historyQueue.size() == n_samples) {
      historyQueue.remove(); // dequeue
    }
    historyQueue.add(dataVal); // enqueue into storage
    
    // get float array from queue
    int i = 0; //index of sample data
    for(float data : historyQueue){
    sample_data[i++] = data;
  }
    
  }
  void setText(String stringText){
    this.stringText = stringText;
  }
  void setMax(float maxValue){
    this.maxValue = maxValue;
  }
  void setLocation(float x, float y){
    this.x = x;
    this.y = y;
  }

  void display() {

    super.setData(sample_data);
    // Scaling
    super.setMinValue(0);
    super.setMaxValue(maxValue);
    // Axis appearance
    fill(255, 190, 40);
    textFont(createFont("Arial", 4),8);
    super.showValueAxis(true);
    super.setValueFormat("#");
    super.showCategoryAxis(true);
    // Bar colours and appearance
    super.setBarColour(color(250, 100, 20, 200));
    super.setBarGap(5);
    super. draw(x, y, 500, 180);
    // title
    textSize(20);
    text(stringText, x + 60, y + 210);
  }
}
