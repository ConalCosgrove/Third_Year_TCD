Table table;
ArrayList<Bar> bars;
void setup() {
  size(600, 600);
  table = loadTable("time_vs_commits.tsv","header,tsv");
  
   for (TableRow row : table.rows()) {
    
    int id = row.getInt("letter");
    int freq = row.getInt("frequency");
    
    
    println(" (" + id + ") has an frequency of " + freq);
    
  
  }
}


void draw() {
  strokeWeight(3);
  line(50,550,550,550);
  line(50,550,50,50);
  

}