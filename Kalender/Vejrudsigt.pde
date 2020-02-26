class Vejrudsigt {
  String dataWemos = "Intet endnu"; 
  String vejrgrader;
  String vejrstatus;
  int xpos = 1465;
  Vejrudsigt() {


    vejrdata();
  }

  void display() {
    // Boksen og dens indhold vises
    fill(255);
    rect(xpos, 50, 200, 100, 10);
    fill(0);
    textSize(25);
    text("Vejret lige nu:", xpos+20, 75);
    text(vejrgrader+" grader", xpos+10, 105);
    text(vejrstatus, xpos+10, 130);
    textSize(50);
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
