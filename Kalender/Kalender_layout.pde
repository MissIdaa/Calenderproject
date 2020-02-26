class Layout {
  // Variabler til layout
  String[] ugenavne = {"Mandag", "Tirsdag", "Onsdag", "Torsdag", "Fredag", "Lørdag", "Søndag"};
  String ugedag;
  int dage = 1;
  PFont font;
  color farve = color(162, 222, 232);
  boolean mus = false;
  PVector pos = new PVector();

  //Sky variabler
  float x1, x2, x3, dx; 
  PImage cloud;
  float y;

  // afslut knap
  float afslut_xpos = width-50;
  float afslut_ypos = 50;
  float afslut_w = 75;
  float afslut_h = 75;


  Layout() {
    font = createFont("Abadi", 50);
    textFont(font);

    // Skyernes opsætning
    cloud = loadImage("cloud.png");
    y=-200;
    x1=0;         // plads mellem skyer
    x2=x1+1500;   // plads mellem skyer
    x3=x2+1250;   // plads mellem skyer
    dx = -0.5; // cloud speed

    // Opsætning af kalenderens layout (i form af datoer/firkanterne)
    int dato = 0;
    int sumdato = 0;
    for (int j = 0; j < 6; j++) {
      for (int i = 0; i < 7; i++) {
        if (j != 0) {
          dato++;
          sumdato++;
          if (dato > 31) {
            dato = 1;
          }
        }
        if (i == 0 || i == 2 || i == 4 || i == 6) {
          farve = color(162, 222, 232);
        } else {
          farve = color(255);
        }
        if (j == 0) {
          ugedag = ugenavne[i];
        } else {
          ugedag = null;
        }
        bokse.add(new Boks(100+(i*(1720/7)), 200+(j*(780/6)), farve, ugedag, dato, sumdato));
      }
    }
  }

  void display() {
    // Animerede skyer
    image(cloud, x1, y);
    image(cloud, x2, y);
    image(cloud, x3, y);

    // Aflsut knap tegnes
    noFill();
    strokeWeight(4);
    stroke(0, 150);
    rect(afslut_xpos-afslut_w/2, afslut_ypos-afslut_h/2, afslut_w, afslut_h);
    line(afslut_xpos-afslut_w/4, afslut_ypos-afslut_w/4, afslut_xpos+afslut_w/4, afslut_ypos+afslut_w/4);
    line(afslut_xpos+afslut_w/4, afslut_ypos-afslut_w/4, afslut_xpos-afslut_w/4, afslut_ypos+afslut_w/4);
    fill(0);
    stroke(0);
    strokeWeight(1);
  }
  void update() {
    // Animation af skyer
    x1 += dx;
    x2 += dx;
    x3 += dx;
    if (x1 <= -1200) { // flytter skyen 
      x1 = x3 + 1200;
    } 
    if (x2 <= -1200) { // Flytter skyen 
      x2 = x1 + 1200;
    } 
    if (x3 <= -1200) { // Flytter skyen, alle 3 statements flytter skyne over på den modsatte side af canvas 
      x3 = x2 + 1200;
    }

    // Trykkes der på afslut?
    if (withinRect() && mousePressed) {
      exit();
    }
  }
  // Slet nogen af withiRect funktionerne hvis jeg kommer i tanke om det... (Generealisering af koden)
  boolean withinRect() {
    if (dist(mouseX, 0, afslut_xpos, 0)<= afslut_w/2 && dist(0, mouseY, 0, afslut_ypos) <=afslut_h/2) {
      return true;
    } else {
      return false;
    }
  }
}
