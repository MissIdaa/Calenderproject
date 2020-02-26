class Begivenhed {
  float gem_xpos = width/2+310;
  float gem_ypos = height/2+325;
  float gem_w = 80;
  float gem_h = 50;
  String besked;
  String line;
  String[] pieces;
  int dato;
  String typevalg;
  String type = null;


  Begivenhed() {
  }

  void display() {
    // tilføje informationer om dagen
    if (bgrunmode == 1) {
      rectMode(CENTER);
      fill(255);
      rect(width/2, height/2, 750, 250, 20);
      rect(gem_xpos, gem_ypos-250, gem_w, gem_h);
      rect(gem_xpos-100, gem_ypos-250, gem_w, gem_h);

      // Her skal knapperne designes
      rect(1000, gem_ypos-250, 50, 50);
      image(work, 1000-25, gem_ypos-275);
      rect(930, gem_ypos-250, 50, 50);
      image(travel, 930-25, gem_ypos-275);
      rect(860, gem_ypos-250, 50, 50);
      image(sport, 860-25, gem_ypos-275);
      rect(790, gem_ypos-250, 50, 50);
      image(party, 790-25, gem_ypos-275);
      rect(720, gem_ypos-250, 50, 50);
      image(homework, 720-25, gem_ypos-275);
      rect(650, gem_ypos-250, 50, 50);
      image(birthday, 650-25, gem_ypos-275);


      fill(0);
      textSize(40);
      text("Ny begivenhed - skriv titel og vælg type", 600, 475);
      textSize(25);
      text("LUK", gem_xpos-28, gem_ypos-243);
      text("GEM", gem_xpos-128, gem_ypos-243);

      //     text();
      //    text();
      //    text();
      rectMode(CORNER);

      // Her skal der skrives kode der gør man kan skrive en custom titel



      // Her skal koden for knapperne hvor man kan vælge ikon/type begivenhed skrives
      if (withinRect(mouseX, mouseY, 1000, gem_ypos-250, 50, 50) && mousePressed) {
        typevalg = "abcdef";
        oprettet = true;
      } else if (withinRect(mouseX, mouseY, 930, gem_ypos-250, 50, 50) && mousePressed) {
        typevalg = "abcde";
        oprettet = true;
      } else if (withinRect(mouseX, mouseY, 860, gem_ypos-250, 50, 50) && mousePressed) {
        typevalg = "abcd";
        oprettet = true;
      } else if (withinRect(mouseX, mouseY, 790, gem_ypos-250, 50, 50) && mousePressed) {
        typevalg = "abc";
        oprettet = true;
      } else if (withinRect(mouseX, mouseY, 720, gem_ypos-250, 50, 50) && mousePressed) {
        typevalg = "ab";
        oprettet = true;
      } else if (withinRect(mouseX, mouseY, 650, gem_ypos-250, 50, 50) && mousePressed) {
        typevalg = "a";
        oprettet = true;
      }
    }

    // aflæse informationer om dagen
    else if (bgrunmode == 2) {
      rectMode(CENTER);
      fill(255);
      rect(width/2, height/2, 400, 200, 20);
      rect(gem_xpos-175, gem_ypos-275, gem_w, gem_h);
      fill(0);
      textSize(25);
      text("LUK", gem_xpos-200, gem_ypos-268);
      rectMode(CORNER);

      reader = createReader("Begivenheder" + bgdato + CurrentUser + ".txt");

      try {
        line = reader.readLine();
      } 
      catch (IOException e) {
        e.printStackTrace();
        line = null;
      }
      if (line == null) {
        //   println("test");
      } else {
        pieces = split(line, "/t");
        fill(0);
        type = pieces[0];
        //    besked = pieces[1];

        // Her skal der skrives kode for visning af kalenderdatoens oplysninger

        // Vis kun hvis bruger er lig med currentUser
        // Vis ikon på kalenderforsiden <-- Skal nok skrives under KalenderLayout istedet.
        // Vis ikon og dens navn + customtitel under detaljeret oversigt
      }
      if (type != null) {
        textSize(35);
        if (type.length() == 1) {
          image(birthday, 780, 450);
          text("Fødselsdag", 845, 486);

          textSize(25);
          //  text(besked,,);
        } else if (type.length() == 2) {
          image(homework, 780, 450);
          text("Aflevering/Lektier", 845, 486);

          textSize(25);
          //  text(besked,,);
        } else if (type.length() == 3) {
          image(party, 780, 450);
          text("Fest", 845, 486);

          textSize(25);
          //  text(besked,,);
        } else if (type.length() == 4) {
          image(sport, 780, 450);
          text("Sport", 845, 486);

          textSize(25);
          //  text(besked,,);
        } else if (type.length() == 5) {
          image(travel, 780, 450);
          text("Rejse", 845, 486);

          textSize(25);
          //  text(besked,,);
        } else if (type.length() == 6) {
          image(work, 780, 450);
          text("Arbejdsrelateret", 845, 486);

          textSize(25);
          //  text(besked,,);
        }
      }
      type = null;
    }
  }


  void update() {

    if (withinRect1() && mousePressed && bgrunmode == 1) {
      bgrun = false;
      if (oprettet) {
        output = createWriter("Begivenheder"+ bgdato + CurrentUser + ".txt");
        output.println(typevalg + "/t" + besked);
        output.flush();
        output.close();
      } else {
        output = createWriter("Begivenheder"+ bgdato + CurrentUser + ".txt");
        output.flush();
        output.close();
      }
      oprettet = false;
      click = false;
    } else if (withinRect3() && mousePressed && bgrunmode == 1) {
      bgrun = false;
      click = false;
    } else if (withinRect2() && mousePressed && bgrunmode == 2) {
      bgrun = false;
      click = false;
    }
  }
  boolean withinRect3() {
    if (dist(mouseX, 0, gem_xpos, 0)<= gem_w/2 && dist(0, mouseY, 0, gem_ypos-250)<=gem_h/2) {
      return true;
    } else {
      return false;
    }
  }
  boolean withinRect2() {
    if (dist(mouseX, 0, gem_xpos-175, 0)<= gem_w/2 && dist(0, mouseY, 0, gem_ypos-275)<=gem_h/2) {
      return true;
    } else {
      return false;
    }
  }
  boolean withinRect1() {
    if (dist(mouseX, 0, gem_xpos-100, 0)<= gem_w/2 && dist(0, mouseY, 0, gem_ypos-250)<=gem_h/2) {
      return true;
    } else {
      return false;
    }
  }
  boolean withinRect(float x, float y, float xpos, float ypos, float w, float h) {
    if (dist(x, 0, xpos, 0)<= w/2 && dist(0, y, 0, ypos)<=h/2) {
      return true;
    } else {
      return false;
    }
  }
}

void mouseReleased() {
  click = true;
}
