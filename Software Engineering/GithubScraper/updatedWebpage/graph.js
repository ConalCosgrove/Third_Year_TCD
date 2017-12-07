var myFont;
var table;
var bars = [];
var idArray = [];
var freqArray = [];
var largest;
var graphWidth,xZero,yZero,spaceBetween;
function setup() {
   createCanvas(1300, 800);
   xZero = 50;
   yZero = height - 50;
   graphWidth = 1000;
   spaceBetween = 10;
   
   
   table = loadTable("time_vs_commits.tsv","header,tsv");

   var count = 0;
   //idArray = new int[24];
   //freqArray = new int[24];
   for (var row in table.rows()) {
    
     var id = row.getInt("letter");
     idArray[count] = id;
     
     var freq = row.getInt("frequency");
     freqArray[count] = freq;
     
     //println(" (" + id + ") has an frequency of " + freq);

  
     count++;
  }
  
   var divisions = 0;
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
    
    
  var barwidth = graphWidth/count;
  
  for(var i = 0; i < count; i++){
    var barHeight = ( (  freqArray[i])/( largest)) * 700;

    var newbar = new Bar(50 + spaceBetween + (i*barwidth),750,barwidth - spaceBetween,-barHeight,freqArray[i],i);
    bars.add(newbar);
  }
  
}
function update(){
  for(var bar in bars){
    bar.update();
  }
}

function draw() {
  background(0);
  update();

  
  //Graduations vertical 
  var graduationWidth = 700.0/800.0;
  //println("gradwidth = " + graduationWidth);
  for(var i = 0; i < 9; i++){
    textSize(18);
    myFont = createFont("Courier", 15,true);
    textFont(myFont);
    var offset = (i==0)?(0):(15);
    line(50,750 - (i*100 * graduationWidth),45,750 - (i*100 * graduationWidth));
    text(i*100,30 - offset,750 - (i*100 * graduationWidth)+5 );
  }
  
  for(var bar in bars){
     bar.drawBar();
  }
  strokeWeight(3);
  stroke(F);
  //X Axis Draw
  line(xZero,yZero,xZero + graphWidth,yZero);
  
  //Y Axis Draw
  line(xZero,yZero,xZero,50);
}


function getLargestValue(frequencies){
    var test = 0;
    for(var i in frequencies){
      if(i > test){
        test = i;
      }
      
    }
  
  println("Largest Value is" + test);
  return test;
  
}
