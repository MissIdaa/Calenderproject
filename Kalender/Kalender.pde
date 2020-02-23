// Interaktiv Kalender
// Gruppeprojekt Aleksander, Caroline, Ida, Mads og Lucas

// Hans Christian hjælpesager:

// Hvordan skal vi lave objekterne/begivenhedsgem
//Vi laver hver begivenhed som et objekt
// Hvert objekt har deres ejer og dato som variabler


// Gemme objekternes begivenheder til en bruger
// Objekterne/begivenhederne gemmes i hver deres fil, med deres dato og deres ejer(bruger)
// Brug PrintWriter, createWriter, createrReader og libary til at vælge den rigtige fil.
// Lave en smart måde at tilegne begivenhederne navne.

// Bibliotek af objekter og metoder vi skal bruge
import processing.serial.*;
import java.util.Calendar;

// Arraylister og objkter til klasser
ArrayList<droplet> regn = new ArrayList<droplet>();
ArrayList<Bruger> brugere = new ArrayList<Bruger>();
Layout l;
Calendar calendar;

PImage[] Baggrund = new PImage[2]; 

// Datamining variabler
Serial myPort;
String dataWemos = "Intet endnu";
String kortNum = "Intet endnu"; 
String vejrgrader;
String vejrstatus;

//Cloud
float x1, x2, x3, dx; 
PImage cloud;
float y;

// Andre
color tema = color(75, 75, 255);
int CurrentUser;
boolean run = true;

void setup() {
  fullScreen();

  // Tilføjelse af brugere, mulighed for tilføjelse af flere skal implementeres
  brugere.add(new Bruger("Caroline"));
  brugere.add(new Bruger("Ida"));

  // Layoutsobjekt, her kunne det bedre spredes ud
  l = new Layout();

  /*
// Opsætning af serial port
   String portName = Serial.list() [2];
   println("Proever: " + portName);
   myPort = new Serial(this, portName, 115200);
   */

  // Indlæsning af de forskellige baggrundsmuligheder
  Baggrund[0] = loadImage("sol.png");
  Baggrund[1] = loadImage("skyet.png");

  // indlæser vejrudsigtens status
  vejrdata();

  // Cloud variabler 
  cloud = loadImage("cloud.png");
  y=-200;
  x1=0;         // plads mellem skyer
  x2=x1+1500;   // plads mellem skyer
  x3=x2+1250;   // plads mellem skyer
  dx = -2; // cloud speed
}

// Her køres funktionerne
void draw() {
  background(Baggrund[CurrentUser]);
  Cloud();
  // chiplogin();
  // brugere.get(CurrentUser).display();
  l.display();
  //  text(vejrgrader, 200, 200);

  /*
  // Regn animation
   regn.add(new droplet( new PVector (random(0, width), -100), new PVector(random(0, -100), random(20, 40))));
   for (droplet d : regn) {
   d.display();
   d.update();
   }
   */
}

//--------------------------------------------------------------------------------------------
// Datamining for vejrstatus, grader osv
void vejrdata() {
  String[] lines = loadStrings("https://vejr.tv2.dk/vejr/hjoerring-2620214");
  println(lines[180]);

  int pointst = lines[180].indexOf("<td");
  int pointsl = lines[180].indexOf("</td>", pointst);


  //  vejrgrader = (lines[180].substring(pointst+20, pointsl));

  pointst = lines[179].indexOf("alt");
  pointsl = lines[179].indexOf("/></td>", pointst); 

  // vejrstatus = (lines[179].substring(pointst+4, pointsl-1));

  //  println(vejrstatus);
}

//-------------------------------------------------------------------------
/*
// Arduino chips
void chiplogin() {
 if (myPort.available() > 0) {
 dataWemos = myPort.readStringUntil ('\n');
 //   println("Received: " + dataWemos);
 if (dataWemos != null) {
 if (dataWemos.charAt(10) == '#') {
 kortNum = dataWemos.substring(11, dataWemos.length()-3);
 }
 }
 }
 CurrentUser = int(kortNum);
 // println(kortNum);
 text(CurrentUser, 500, 100);
 }
 */

//-----------------------------------------------------------------
// Skyanimation
void Cloud () {
  x1 += dx;
  x2 += dx;
  x3 += dx;
  image(cloud, x1, y);
  image(cloud, x2, y);
  image(cloud, x3, y);

  if (x1 <= -1200) { // flytter skyen 
    x1 = x3 + 1200;
  } 
  if (x2 <= -1200) { // Flytter skyen 
    x2 = x1 + 1200;
  } 
  if (x3 <= -1200) { // Flytter skyen, alle 3 statements flytter skyne over på den modsatte side af canvas 
    x3 = x2 + 1200;
  }
}

//-----------------------------------------------------------------
// Til begivenhedsbokse
void mousePressed() {
  if (l.mus == false) {
    l.mus = true;
  } else if (l.mus == true) { 
    l.mus = false;
  }
  l.pos.x = mouseX;
  l.pos.y = mouseY;
}
