class Begivenhed {
  float gem_xpos = width/2+310;
  float gem_ypos = height/2+325;
  float gem_w = 80;
  float gem_h = 50;
  String besked;
  String line;
  String[] pieces;
  int dato;
  String type = null;


  Begivenhed() {
  }

  void display() {

    // tilføje informationer om dagen
    if (bgrunmode == 1) {
      rectMode(CENTER);
      fill(255);
      rect(width/2, height/2, 750, 750);
      rect(gem_xpos, gem_ypos, gem_w, gem_h);
      fill(0);
      textSize(25);
      text("GEM", gem_xpos-28, gem_ypos+7);
      rectMode(CORNER);
    }

    // aflæse informationer om dagen
    else if (bgrunmode == 2) {
      rectMode(CENTER);
      fill(255);
      rect(width/2, height/2, 500, 300);
      rect(gem_xpos-125, gem_ypos-225, gem_w, gem_h);
      fill(0);
      textSize(25);
      text("LUK", gem_xpos-150, gem_ypos-218);
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



        // Indsæt eget brug
      }
      //     text(dato,500,500);
      if (type != null) {
        text(type, 800, 500);
      }
      //println(bgdato);
      //println(pieces.length);
    }
  }


  void update() {

    if (withinRect() && mousePressed && bgrunmode == 1) {
      bgrun = false;
      output = createWriter("Begivenheder"+ bgdato + CurrentUser + ".txt");
      //    output.println(bgdato);
      output.println(type + "/t" + besked);
      click = false;
    } else if (withinRect2() && mousePressed && bgrunmode == 2) {
      bgrun = false;
      click = false;
    }
  }
  boolean withinRect() {
    if (dist(mouseX, 0, gem_xpos, 0)<= gem_w/2 && dist(0, mouseY, 0, gem_ypos)<=gem_h/2) {
      return true;
    } else {
      return false;
    }
  }
  boolean withinRect2() {
    if (dist(mouseX, 0, gem_xpos-125, 0)<= gem_w/2 && dist(0, mouseY, 0, gem_ypos-225)<=gem_h/2) {
      return true;
    } else {
      return false;
    }
  }
}

void mouseReleased() {

  click = true;
}
