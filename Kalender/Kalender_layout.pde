class Layout {
  String[] ugenavne = {"Mandag", "Tirsdag", "Onsdag", "Torsdag", "Fredag", "Lørdag", "Søndag"};
  int dage = 1;
  PFont font;
  color farve = color(162, 222, 232);
  boolean mus = false;
  PVector pos = new PVector();

  // Baggrund
  //Skyer
  float x1, x2, x3, dx; 
  PImage cloud;
  float y;

  Layout() {
    font = createFont("Abadi", 50);

    // Skyernes variabel opsætning
    cloud = loadImage("cloud.png");
    y=-200;
    x1=0;         // plads mellem skyer
    x2=x1+1500;   // plads mellem skyer
    x3=x2+1250;   // plads mellem skyer
    dx = -2; // cloud speed
  }

  void display() {
    baggrund();

    // Her skal der seriøst laves om og gøres rent
    //----------------------------------------------------------
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

  void baggrund() {


    
    
    // Animerede skyer
    x1 += dx;
    x2 += dx;
    x3 += dx;
    image(cloud, x1, y);
    image(cloud, x2, y);
    image(cloud, x3, y);

    if (x1 <= -1200) { // flytter skyen 
      x1 = x3 + 1200;
    } 
    if (x2 <= -1200) { // Flytter skyen 
      x2 = x1 + 1200;
    } 
    if (x3 <= -1200) { // Flytter skyen, alle 3 statements flytter skyne over på den modsatte side af canvas 
      x3 = x2 + 1200;
    }
  }


  boolean withinRect(float x, float y, float a, float b, float w, float h) {
    if (dist(x, 0, a, 0)<= w && dist(0, y, 0, b)<=h) {
      return true;
    } else {
      return false;
    }
  }
}
