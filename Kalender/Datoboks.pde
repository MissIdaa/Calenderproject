class Boks {
  float xpos, ypos;
  float w = 1720/7;
  float h = 780/6;
  color farve;

  // Dato tildeling
  String ugedag;
  int dato;
  int marked_date;

  // Variabler til små ikoner på dagene
  String pieces[];
  String type;
  String line;

  // Reader til filerne, som den skal hente ikonerne fra
  BufferedReader reader2;


  Boks(float tempXpos, float tempYpos, color tempFarve, String tempUgedag, int tempDato, int tempMarked_date) {
    xpos = tempXpos;
    ypos = tempYpos;
    farve = tempFarve;
    ugedag = tempUgedag;
    dato = tempDato;
    marked_date = tempMarked_date;

  }

  void display() {
    // Selve boksen bliver skabt
    fill(farve);
    rect(xpos, ypos, w, h, 10);
    fill(0);

    // Ugedagene bliver skabt (Mandag, tirsdag, onsdag,...)
    if (ugedag != null) {
      text(ugedag, xpos+25, ypos+70);
    }
    // Tallet til datoen bliver skabt
    if (dato != 0) {
      text(dato, xpos+10, ypos+50);
    }

    // Laver reader til dagene i kalenderen
    if (marked_date != 0) {
      reader2 = createReader("Begivenheder" + marked_date + CurrentUser + ".txt");
    }

    // Her læser den dokumentet og ser om der et ikon tilgængeligt
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

      // Hvis der data i dokumentet så display det ikon der passer til det
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
      type = null;
    }
  }

  void update() {
    // Hvis der trykkes på en dato/boks
    if (dato != 0 && withinRect() && mousePressed && bgrun == false && click == true) {
      bgrun = true;
      bgdato = marked_date;
      // Hvis der med venstreklik
      if (mouseButton == LEFT) { 
        bgrunmode = 2;
        bg.dato = dato;
        // Hvis der er med højreklik
      } else if (mouseButton == RIGHT) {
        bgrunmode = 1;
      }
    }
  }

  // Simpel withinRect funktion til at tjekke om der bliver klikket i firkanterne
  boolean withinRect() {
    if (dist(mouseX, 0, xpos+(w/2), 0)<= w/2 && dist(0, mouseY, 0, (ypos+h/2))<=h/2) {
      return true;
    } else {
      return false;
    }
  }
}
