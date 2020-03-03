class Begivenhed {
  // variabler til posistion
  float gem_xpos = width/2+310;
  float gem_ypos = height/2+325;
  float gem_w = 80;
  float gem_h = 50;

  // Variabler til boksfunktionalitet
  String besked = "";
  String line;
  String[] pieces;
  int dato;
  String typevalg = null;
  String type = null;
  boolean typing = false;
  int selected = 0;
  String message = null;


  Begivenhed() {
  }

  void display() {
    // Kode til at tilføje informationer om dagen (højreklik)
    if (bgrunmode == 1) {
      // Det yderste design for boksen til højreklik
      rectMode(CENTER);
      fill(255);
      rect(width/2, height/2, 750, 250, 20);
      rect(gem_xpos, gem_ypos-250, gem_w, gem_h);
      rect(gem_xpos-100, gem_ypos-250, gem_w, gem_h);
      fill(0);
      textSize(40);
      text("Ny begivenhed - skriv titel og vælg type", 600, 475);
      textSize(25);
      text("LUK", gem_xpos-28, gem_ypos-243);
      text("GEM", gem_xpos-128, gem_ypos-243);

      // Tjek om jeg har klikket på teksfelt
      if (withinRect(mouseX, mouseY, 900, gem_ypos-340, 500, 50) && mousePressed) {
        typing = true;
      } 
      if (typing) {
        strokeWeight(4);
      }
      fill(255);
      rect(900, gem_ypos-340, 550, 50);
      strokeWeight(1);
      textSize(30);
      fill(0);
      text(besked, 640, gem_ypos-330);

      // Koden for de 6 knapper hvor man kan vælge ikon til ens begivenhed
      if (withinRect(mouseX, mouseY, 1000, gem_ypos-250, 50, 50) && mousePressed) {
        typevalg = "abcdef";
        oprettet = true;
        selected = 6;
      } else if (withinRect(mouseX, mouseY, 930, gem_ypos-250, 50, 50) && mousePressed) {
        typevalg = "abcde";
        oprettet = true;
        selected = 5;
      } else if (withinRect(mouseX, mouseY, 860, gem_ypos-250, 50, 50) && mousePressed) {
        typevalg = "abcd";
        oprettet = true;
        selected = 4;
      } else if (withinRect(mouseX, mouseY, 790, gem_ypos-250, 50, 50) && mousePressed) {
        typevalg = "abc";
        oprettet = true;
        selected = 3;
      } else if (withinRect(mouseX, mouseY, 720, gem_ypos-250, 50, 50) && mousePressed) {
        typevalg = "ab";
        oprettet = true;
        selected = 2;
      } else if (withinRect(mouseX, mouseY, 650, gem_ypos-250, 50, 50) && mousePressed) {
        typevalg = "a";
        oprettet = true;
        selected = 1;
      } 

      // Koden for boksene der viser man har selected et ikon
      if (selected == 6) {
        strokeWeight(4);
      }
      rect(1000, gem_ypos-250, 50, 50);
      image(work, 1000-25, gem_ypos-275);
      strokeWeight(1);
      if (selected == 5) {
        strokeWeight(4);
      }
      rect(930, gem_ypos-250, 50, 50);
      image(travel, 930-25, gem_ypos-275);
      strokeWeight(1);
      if (selected == 4) {
        strokeWeight(4);
      }
      rect(860, gem_ypos-250, 50, 50);
      image(sport, 860-25, gem_ypos-275);
      strokeWeight(1);
      if (selected == 3) {
        strokeWeight(4);
      }
      rect(790, gem_ypos-250, 50, 50);
      image(party, 790-25, gem_ypos-275);
      strokeWeight(1);
      if (selected == 2) {
        strokeWeight(4);
      }
      rect(720, gem_ypos-250, 50, 50);
      image(homework, 720-25, gem_ypos-275);
      strokeWeight(1);
      if (selected == 1) {
        strokeWeight(4);
      }
      rect(650, gem_ypos-250, 50, 50);
      image(birthday, 650-25, gem_ypos-275);
      strokeWeight(1);

      rectMode(CORNER);
    }

    // Kode til at aflæse informationerne om dagen (Venstreklik)
    else if (bgrunmode == 2) {

      // Generelt design
      rectMode(CENTER);
      fill(255);
      rect(width/2, height/2, 400, 200, 20);
      rect(gem_xpos-175, gem_ypos-275, gem_w, gem_h);
      fill(0);
      textSize(25);
      text("LUK", gem_xpos-200, gem_ypos-268);
      rectMode(CORNER);

      // Aflæser til dokumentet begivenhederne er gemt på
      reader = createReader("Begivenheder" + bgdato + CurrentUser + ".txt");

      // Læs dokumentet tilhørende datoen
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
        if (pieces.length == 2) {
          message = pieces[1];
        }
      }

      // Hvis der er gemt noget på dokumentet om dagen, så displayer den her hvad der er gemt
      // Ikon
      if (type != null) {
        textSize(35);
        if (type.length() == 1) {
          image(birthday, 780, 450);
          text("Fødselsdag", 845, 486);
          textSize(25);
        } else if (type.length() == 2) {
          image(homework, 780, 450);
          text("Aflevering/Lektier", 845, 486);
          textSize(25);
        } else if (type.length() == 3) {
          image(party, 780, 450);
          text("Fest", 845, 486);
          textSize(25);
        } else if (type.length() == 4) {
          image(sport, 780, 450);
          text("Sport", 845, 486);
          textSize(25);
        } else if (type.length() == 5) {
          image(travel, 780, 450);
          text("Rejse", 845, 486);
        } else if (type.length() == 6) {
          image(work, 780, 450);
          text("Arbejdsrelateret", 845, 486);
        }
      }
      type = null;
      // Besked
      if (message != null) {
        textSize(25);
        text(message, 790, 535);
      }
      message = null;
    }
  }

  // Klikker man ud af tekstfelt?
  void update() {
    if (!withinRect(mouseX, mouseY, 900, gem_ypos-340, 500, 50) && mousePressed) {
      typing = false;
    } 
    // Klikkes på gem knap
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
      besked = "";
      selected = 0;
      bgrunmode = 0;
    } 
    // Klikkes på luk ved venstreklik
    else if (withinRect3() && mousePressed && bgrunmode == 1) {
      bgrun = false;
      click = false;
      besked = "";
      selected = 0;
      bgrunmode = 0;
    } 
    // klikkes på luk ved højreklik
    else if (withinRect2() && mousePressed && bgrunmode == 2) {
      bgrun = false;
      click = false;
      bgrunmode = 0;
    }
  }

  // Laves om hvis jeg får overskud
  boolean withinRect3() {
    if (dist(mouseX, 0, gem_xpos, 0)<= gem_w/2 && dist(0, mouseY, 0, gem_ypos-250)<=gem_h/2) {
      return true;
    } else {
      return false;
    }
  }
  // Laves om hvis jeg får overskud
  boolean withinRect2() {
    if (dist(mouseX, 0, gem_xpos-175, 0)<= gem_w/2 && dist(0, mouseY, 0, gem_ypos-275)<=gem_h/2) {
      return true;
    } else {
      return false;
    }
  }
  // Laves om hvis jeg får overskud
  boolean withinRect1() {
    if (dist(mouseX, 0, gem_xpos-100, 0)<= gem_w/2 && dist(0, mouseY, 0, gem_ypos-250)<=gem_h/2) {
      return true;
    } else {
      return false;
    }
  }
  // Generel funktion for at tjekke om man har trykket på en firkant
  boolean withinRect(float x, float y, float xpos, float ypos, float w, float h) {
    if (dist(x, 0, xpos, 0)<= w/2 && dist(0, y, 0, ypos)<=h/2) {
      return true;
    } else {
      return false;
    }
  }
}

// Kode for at kunne skrive en custom titel
void keyPressed() {
  if (bg.typing) {
    if (key==BACKSPACE) {
      if (bg.besked.length()>0) {
        bg.besked=bg.besked.substring(0, bg.besked.length()-1);
      }
    } else if (key==RETURN || key==ENTER) {
      println ("ENTER");
      bg.typing = false;
    } else {
      bg.besked +=key;
    } 
    println (bg.besked);
  }
}


void mouseReleased() {
  click = true;
  clickcounter ++;
}
