class Layout {
  String[] ugenavne = {"Mandag", "Tirsdag", "Onsdag", "Torsdag", "Fredag", "Lørdag", "Søndag"};
  int dage = 1;
  PFont font;
  color farve = color(162, 222, 232);
  boolean mus = false;
  PVector pos = new PVector();
  Layout() {
    font = createFont("Abadi", 50);
  }

  void display() {

    //   rect(150,250,900,350,25);

    /*   for(int i = 1; i < 7;i++){
     line(100+(i*(1000/7)),200,100+(i*(1000/7)),650);
     line(100,200+(i*(450/6)),1100,200+(i*(450/6)));
     }
     */
    textSize(50);
    textFont(font);
    for (int i = 0; i < 7; i++) {
      for (int j = 0; j < 6; j++) {
        if (i == 0 || i == 2 || i == 4 || i == 6) {
          fill(farve);
        }
        rect(100+(i*(1720/7)), 200+(j*(780/6)), 1720/7, 780/6, 10);
      }
      fill(0);
      text(ugenavne[i], 125+(i*(1720/7)), 270);
      fill(255);
    }
    for (int j = 1; j < 6; j++) {
      for (int i = 0; i < 7; i++) {
        fill(0);
        text(dage, 110+(i*(1720/7)), 250+((j)*(780/6)));
        dage++;
        if (dage > 31) {
          dage = 1;
        }
      }
    }
    dage = 1;
    fill(0);
    for (int i = 0; i < 6; i++) {
      for (int j = 0; j < 4; j++) {
        if (withinRect(mouseX, mouseY, 100+((1+i)*(1720/7)), 200+((j+2)*(780/6)), 1720/7, 780/6) && mus ) {
          /*    if (i == 0 || i == 2 || i == 4 || i == 6) {
           farve = color(255,0,0);
           } else{
           farve = color(162, 222, 232); 
           }
           */
          //   text(mouseX+ " " + mouseY,mouseX,mouseY);
          fill(255);
          rect(pos.x, pos.y, 500, 500);
        }
      }
    }
    fill(255);
  }
  boolean withinRect(float x, float y, float a, float b, float w, float h) {
    if (dist(x, 0, a, 0)<= w && dist(0, y, 0, b)<=h) {
      return true;
    } else {
      return false;
    }
  }
}
