class Layout {
  String[] ugenavne = {"Mandag", "Tirsdag", "Onsdag", "Torsdag", "Fredag", "Lørdag", "Søndag"};
  String ugedag;
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
    textFont(font);

    // Skyernes variabel opsætning
    cloud = loadImage("cloud.png");
    y=-200;
    x1=0;         // plads mellem skyer
    x2=x1+1500;   // plads mellem skyer
    x3=x2+1250;   // plads mellem skyer
    dx = -0.5; // cloud speed

    // Opsætning af layout
    int dato = 0;
    for (int j = 0; j < 6; j++) {
      for (int i = 0; i < 7; i++) {
        if (j != 0) {
          dato++;
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
        bokse.add(new Boks(100+(i*(1720/7)), 200+(j*(780/6)), farve, ugedag, dato));
      }
    }
  }

  void display() {


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
}
