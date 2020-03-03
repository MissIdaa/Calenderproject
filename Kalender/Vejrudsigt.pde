class Vejrudsigt {
  String dataWemos = "Intet endnu"; 
  String vejrgrader;
  String vejrstatus;
  int xpos = 1465+50+50+25;

  PImage Skyet, Regnbyer, Nogen_sol, Sol;

  Vejrudsigt() {
   
    Skyet = loadImage("Skyet1.png");
    Regnbyer = loadImage("Regnbyer.png");
    Nogen_sol = loadImage("Nogen_sol.png");
    Sol = loadImage("Sol1.png");

    vejrdata();
  }

  void display() {
    // Boksen og dens indhold vises
    fill(255);
    strokeWeight(2);
    rect(xpos, 65, 200, 85, 10);
    strokeWeight(1);
    fill(0);
    textSize(25);
   // text("Vejret lige nu:", xpos+10, 75);
    text(vejrgrader+" grader", xpos+10, 105);
    text(vejrstatus, xpos+10, 130);
    textSize(50);
    if (vejrstatus.length() == 5) {
  //    println("test");
      image(Skyet, xpos+85, 40);
    } else if (vejrstatus.length() == 8) {
      image(Regnbyer, xpos+110, 40);
    } else if (vejrstatus.length() == 9) {
      image(Nogen_sol, xpos+110, 40);
    } else if (vejrstatus.length() == 3) {
      image(Sol, xpos+110, 40);
    }
  }

  // Datamining for vejrstatus, grader osv
  void vejrdata() {

    // Loader hjemmesidens kode
    String[] lines = loadStrings("https://vejr.tv2.dk/vejr/hjoerring-2620214");

    /*for(int i = 180; i < 190;i++){
     println(lines[i]);
     } */

    // Hvor i koden skal jeg lede?
    int pointst = lines[183].indexOf("<td");
    int pointsl = lines[183].indexOf("</td>", pointst);

    // Klipper det ud jeg bruger og putter i varabel
    vejrgrader = (lines[183].substring(pointst+20, pointsl));
    println(vejrgrader);

    // Samme process her
    pointst = lines[182].indexOf("alt");
    pointsl = lines[182].indexOf("/></td>", pointst); 

    vejrstatus = (lines[182].substring(pointst+5, pointsl-2));
    println(vejrstatus);
  }
}
