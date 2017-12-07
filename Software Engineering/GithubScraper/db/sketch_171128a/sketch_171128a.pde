PFont myFont;
Table table;
ArrayList<Bar> bars;
int idArray[];
int freqArray[];
int largest;
int graphWidth,xZero,yZero,spaceBetween;
void setup() {
   size(1300, 800);
   xZero = 50;
   yZero = height - 50;
   graphWidth = 1000;
   spaceBetween = 10;
   
   
   table = loadTable("time_vs_commits.tsv","header,tsv");
   bars = new ArrayList<Bar>();
   int count = 0;
   idArray = new int[24];
   freqArray = new int[24];
   for (TableRow row : table.rows()) {
    
     int id = row.getInt("letter");
     idArray[count] = id;
     
     int freq = row.getInt("frequency");
     freqArray[count] = freq;
     
     //println(" (" + id + ") has an frequency of " + freq);

  
     count++;
  }
  
   int divisions = 0;
   largest = getLargestValue(freqArray);
    while(largest > 10){
       largest /= 10;
       divisions++;
       println("largest = " + largest + " divisions = " + divisions);
     }
    
    largest++;
    while(divisions != 0){
      largest *= 10;
      divisions--;
    }
    println("rounded up = " + largest);
    
    
  int barwidth = graphWidth/count;
  
  for(int i = 0; i < count; i++){
    float barHeight = ( ( (float) freqArray[i])/( (float) largest)) * 700;

    Bar newbar = new Bar(50 + spaceBetween + (i*barwidth),750,barwidth - spaceBetween,-barHeight,freqArray[i],i);
    bars.add(newbar);
  }
  
}
void update(){
  for(Bar bar : bars){
    bar.update();
  }
}

void draw() {
  background(#AAAAAA);
  update();

  
  //Graduations vertical 
  float graduationWidth = 700.0/800.0;
  //println("gradwidth = " + graduationWidth);
  for(int i = 0; i < 9; i++){
    textSize(18);
    myFont = createFont("Courier", 15,true);
    textFont(myFont);
    int offset = (i==0)?(0):(15);
    line(50,750 - (i*100 * graduationWidth),45,750 - (i*100 * graduationWidth));
    text(i*100,30 - offset,750 - (i*100 * graduationWidth)+5 );
  }
  
  for(Bar bar : bars){
     bar.drawBar();
  }
  strokeWeight(3);
  stroke(#000000);
  //X Axis Draw
  line(xZero,yZero,xZero + graphWidth,yZero);
  
  //Y Axis Draw
  line(xZero,yZero,xZero,50);
}


int getLargestValue(int frequencies[]){
    int test = 0;
    for(int i : frequencies){
      if(i > test){
        test = i;
      }
      
    }
  
  println("Largest Value is" + test);
  return test;
  
}