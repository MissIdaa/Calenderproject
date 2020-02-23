class Vejrudsigt {
  String dataWemos = "Intet endnu"; 
  String vejrgrader;
  String vejrstatus;
  Vejrudsigt() {


    vejrdata();
  }

  void display() {
//    text(vejrgrader, 200, 200);
//   text(vejrstatus, 200, 300);
  }

  // Datamining for vejrstatus, grader osv
  void vejrdata() {
    String[] lines = loadStrings("https://vejr.tv2.dk/vejr/hjoerring-2620214");
    println(lines[180]);

    int pointst = lines[180].indexOf("<td");
    int pointsl = lines[180].indexOf("</td>", pointst);


    //  vejrgrader = (lines[180].substring(pointst+20, pointsl));
    // println(vejrgrader);

    pointst = lines[179].indexOf("alt");
    pointsl = lines[179].indexOf("/></td>", pointst); 

    // vejrstatus = (lines[179].substring(pointst+4, pointsl-1));
    //  println(vejrstatus);
  }
}
