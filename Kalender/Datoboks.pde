class Boks {
  float xpos, ypos;
  float w = 1720/7;
  float h = 780/6;
  color farve;
  String ugedag;
  int dato;
  int marked_date;

  String pieces[];
  String type;
  String line;

  BufferedReader reader2;


  Boks(float tempXpos, float tempYpos, color tempFarve, String tempUgedag, int tempDato, int tempMarked_date) {
    xpos = tempXpos;
    ypos = tempYpos;
    farve = tempFarve;
    ugedag = tempUgedag;
    dato = tempDato;
    marked_date = tempMarked_date;

    if (marked_date != 0) {
      reader2 = createReader("Begivenheder" + marked_date + CurrentUser + ".txt");
    }
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

    if (marked_date != 0) {
      try {
        line = reader2.readLine();
      } 
      catch (IOException e) {
        e.printStackTrace();
        line = null;
      }
      if (line == null) {
        //   println("test");
      } else {
        pieces = split(line, "/t");
        type = pieces[0];
      }
      if (type != null) {
        if (type.length() == 1) {
          image(birthday, xpos+185, ypos+8);
        } else if (type.length() == 2) {
          image(homework, xpos+185, ypos+8);
        } else if (type.length() == 3) {
          image(party, xpos+185, ypos+8);
        } else if (type.length() == 4) {
          image(sport, xpos+185, ypos+8);
        } else if (type.length() == 5) {
          image(travel, xpos+185, ypos+8);
        } else if (type.length() == 6) {
          image(work, xpos+185, ypos+8);
        }
      }
    }
  }

  void update() {
    if (dato != 0 && withinRect() && mousePressed && bgrun == false && click == true) {
      //    text(marked_date, mouseX, mouseY);
      bgrun = true;
      bgdato = marked_date;
      if (mouseButton == LEFT) {
        bgrunmode = 2;
        bg.dato = dato;
      } else if (mouseButton == RIGHT) {
        bgrunmode = 1;
      }
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
