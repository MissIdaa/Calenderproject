// Interaktiv Kalender
// Gruppeprojekt Aleksander, Caroline, Ida, Mads og Lucas

// Hans Christian hjælpesager:
// Datamine vejrudsigten tjek
// se datamining

// Hvordan skal vi lave objekterne/begivenhedsgem
//Vi laver hver begivenhed som et objekt
// Hvert objekt har deres ejer og dato som variabler


// Gemme objekternes begivenheder til en bruger
// Objekterne/begivenhederne gemmes i hver deres fil, med deres dato og deres ejer(bruger)
// Brug PrintWriter, createWriter, createrReader og libary til at vælge den rigtige fil.
// Lave en smart måde at tilegne begivenhederne navne.

import processing.serial.*;

ArrayList<Bruger> brugere = new ArrayList<Bruger>();
Layout l;
PImage sol, regn, skyet;

Serial myPort;
String dataWemos = "Intet endnu";
String kortNum = "Intet endnu"; 

color tema = color(75, 75, 255);
int CurrentUser;
String vejrgrader;
String vejrstatus;

void setup() {
  fullScreen();
  //size(1920,1080);
  brugere.add(new Bruger("Caroline"));
  brugere.add(new Bruger("Ida"));

  l = new Layout();

  String portName = Serial.list() [2];
  println("Proever: " + portName);
  myPort = new Serial(this, portName, 115200);

  sol = loadImage("sol.jpg");
  vejrdata();
  // nyhedsdata();
}

void draw() {
  background(sol);
  chiplogin();
  brugere.get(CurrentUser).display();
  l.display();
  text(vejrgrader, 200, 200);
}

void vejrdata() {
  String[] lines = loadStrings("https://vejr.tv2.dk/vejr/hjoerring-2620214");
  // println(lines[180]);

  int pointst = lines[180].indexOf("<td");
  int pointsl = lines[180].indexOf("</td>", pointst);

  vejrgrader = (lines[180].substring(pointst+20, pointsl));

  pointst = lines[179].indexOf("alt");
  pointsl = lines[179].indexOf("/></td>", pointst); 

  vejrstatus = (lines[179].substring(pointst+4, pointsl-1));

  println(vejrstatus);
}

void nyhedsdata() {
  String[] lines = loadStrings("https://www.dr.dk/nyheder"); 
  //println(lines[i]);
  // println(lines.length);
  for (int i = 1600; i < 1800; i++) {
    //  String[] timeMatch = match(lines[i], "Seneste nyt");
    println(lines[i]);
  }
}

void chiplogin() {
  if (myPort.available() > 0) {
    dataWemos = myPort.readStringUntil ('\n');
    println("Received: " + dataWemos);
    if (dataWemos != null) {
      if (dataWemos.charAt(10) == '#') {
        kortNum = dataWemos.substring(11, dataWemos.length()-3);
      }
    }
  }
  CurrentUser = int(kortNum);
  println(kortNum);
  text(CurrentUser, 500, 100);
}
