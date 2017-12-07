class Bar{
  int x,y,w,frequency,hour,offset;
  float h;
  float currentH = 0;
  Bar(int x, int y,int w,float h,int frequency,int hour){
      
      this.x = x;
      this.y = y;
      this.w = w;
      this.h = h;
      this.frequency = frequency;
      this.hour = hour;
      if(hour >= 10){
        offset = 7;
      }else{
        offset = 12;
      }
        
        
  }
    
  void update(){
    
    if(currentH >= h){
      currentH -= 5;
    }
    
  }
    
  void drawBar(){
    if(mouseX > x && mouseX < x + w && 
      mouseY < y && mouseY > y + h){
        text(frequency,x,20);
      }else{
       stroke(#000000); 
      }
    rect(x,y,w,currentH);
    
    text(hour,x+offset,y+20);
  }
  
  
}