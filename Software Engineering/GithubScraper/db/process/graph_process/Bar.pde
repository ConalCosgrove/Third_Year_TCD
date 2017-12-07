int x,y,w,h;
int currentH = 0;
void Bar(int x, int y,int w,int h){
    
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    
}
  
void update(){
  
  if(currentH != h){
    currentH++;
  }
  
}
  
void drawBar(){
  
  rect(x,y,w,h);
  
}