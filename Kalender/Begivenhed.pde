class Begivenhed {
  float gem_xpos = width/2+310;
  float gem_ypos = height/2+325;
  float gem_w = 80;
  float gem_h = 50;
  int type;
  String besked;
  

  Begivenhed() {
    
  }

void display(){
  rectMode(CENTER);
  fill(255);
  rect(width/2,height/2,750,750);
  rect(gem_xpos,gem_ypos,gem_w,gem_h);
  fill(0);
  textSize(25);
  text("GEM",gem_xpos-28,gem_ypos+7);
  
  rectMode(CORNER);
}


  void update() {
    
    if (withinRect() && mousePressed){
      bgrun = false;
      output.println(bgdato);
      output.println(brugere.get(CurrentUser).name + "t" + type + "t" + besked);
    }
    
  }
  boolean withinRect() {
    if (dist(mouseX, 0, gem_xpos, 0)<= gem_w/2 && dist(0, mouseY, 0, gem_ypos)<=gem_h/2) {
      return true;
    } else {
      return false;
    }
  }

}
