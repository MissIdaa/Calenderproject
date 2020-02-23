class Vejrudsigt {
  String dataWemos = "Intet endnu"; 
  String vejrgrader;
  String vejrstatus;
  Vejrudsigt() {

    
    vejrdata();
  }

  void display() {
    fill(255);
    rect(1500,50,200,100);
    fill(0);
    textSize(25);
    text("Vejret lige nu:",1520,75);
   text(vejrgrader+" grader", 1510, 105);
   text(vejrstatus, 1510, 130);
   textSize(50);
  }

  // Datamining for vejrstatus, grader osv
  void vejrdata() {
    String[] lines = loadStrings("https://vejr.tv2.dk/vejr/hjoerring-2620214");

   // println(lines[180]);

    int pointst = lines[183].indexOf("<td");
    int pointsl = lines[183].indexOf("</td>", pointst);


      vejrgrader = (lines[183].substring(pointst+20, pointsl));
     println(vejrgrader);

    pointst = lines[182].indexOf("alt");
    pointsl = lines[182].indexOf("/></td>", pointst); 

     vejrstatus = (lines[182].substring(pointst+5, pointsl-2));
      println(vejrstatus);
  }
}
