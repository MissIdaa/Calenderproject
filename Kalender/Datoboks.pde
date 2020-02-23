class Boks{
  float xpos,ypos;
  float w = 1720/7;
  float h = 780/6;
  color farve;
  String ugedag;
  
  Boks(float tempXpos, float tempYpos, color tempFarve, String tempUgedag){
    xpos = tempXpos;
    ypos = tempYpos;
    farve = tempFarve;
    ugedag = tempUgedag;
    
  }
  
  void display(){
    fill(farve);
    rect(xpos, ypos, w, h, 10);
    if (ugedag != null){
      fill(0);
    text(ugedag,xpos+25,ypos+70);
    }
  }
  
  
}
