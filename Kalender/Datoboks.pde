class Boks {
  float xpos, ypos;
  float w = 1720/7;
  float h = 780/6;
  color farve;
  String ugedag;
  int dato;
  int marked_date;


  Boks(float tempXpos, float tempYpos, color tempFarve, String tempUgedag, int tempDato, int tempMarked_date) {
    xpos = tempXpos;
    ypos = tempYpos;
    farve = tempFarve;
    ugedag = tempUgedag;
    dato = tempDato;
    marked_date = tempMarked_date;
  }

  void display() {
    fill(farve);
    rect(xpos, ypos, w, h, 10);
    fill(0);
    if (ugedag != null) {
      text(ugedag, xpos+25, ypos+70);
    }
    if (dato != 0) {
      text(dato, xpos+10, ypos+50);
    }
  }

  void update() {
    if (dato != 0 && withinRect() && mousePressed) {
      text(marked_date, mouseX, mouseY);
      bgrun = true;
      bgdato = marked_date;
    }
  }


  boolean withinRect() {
    if (dist(mouseX, 0, xpos+(w/2), 0)<= w/2 && dist(0, mouseY, 0, (ypos+h/2))<=h/2) {
      return true;
    } else {
      return false;
    }
  }
}
