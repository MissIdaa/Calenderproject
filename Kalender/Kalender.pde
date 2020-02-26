// Interaktiv Kalender
// Gruppeprojekt Aleksander, Caroline, Ida, Mads og Lucas

// Bibliotek af objekter og metoder vi skal bruge
import processing.serial.*;
import java.util.Calendar;

// Arraylister og objkter til klasser
ArrayList<droplet> regn = new ArrayList<droplet>();
ArrayList<Bruger> brugere = new ArrayList<Bruger>();
ArrayList<Boks> bokse = new ArrayList<Boks>();
Serial myPort;
Layout l;
Calendar calendar;
Vejrudsigt vejr;
Begivenhed bg;

// Andre
PImage[] Baggrund = new PImage[2]; 
color tema = color(75, 75, 255);
int CurrentUser = 0;
boolean run = true;
boolean bgrun = false;
int bgdato = 1;
int bgrunmode;
boolean click = true;
boolean oprettet = false;
PrintWriter output;
BufferedReader reader;
PImage birthday, work, travel, party, sport, homework;


void setup() {
  // opsætning af billeder
  birthday = loadImage("birthday.PNG");
  birthday.resize(50, 50);
  work = loadImage("work.PNG");
  work.resize(50, 50);
  travel = loadImage("travel.PNG");
  travel.resize(50, 50);
  party = loadImage("party.PNG");
  party.resize(50, 50);
  sport = loadImage("sport.PNG");
  sport.resize(50, 50);
  homework = loadImage("homework.PNG");
  homework.resize(50, 50);

  fullScreen();

  // Tilføjelse af brugere, mulighed for tilføjelse af flere skal implementeres
  brugere.add(new Bruger("Caroline"));
  brugere.add(new Bruger("Ida"));

  // Oprettelse af objekter
  l = new Layout();
  vejr = new Vejrudsigt();
  bg = new Begivenhed();

  /*
// Opsætning af serial port
   String portName = Serial.list() [2];
   println("Proever: " + portName);
   myPort = new Serial(this, portName, 115200);
   */

  // Indlæsning af de forskellige baggrundsmuligheder
  Baggrund[0] = loadImage("sol.png");
  Baggrund[1] = loadImage("skyet.png");
}

// Her køres funktionerne
void draw() {
  background(Baggrund[CurrentUser]);
  // chiplogin();
 

  //Display af kalenderens generelle layout
  l.display();
  l.update();

// Display af bruger
 brugere.get(CurrentUser).display();

  // Display af vejret
  vejr.display();

  // Display af dagene
  for (Boks b : bokse) {
    b.display();
    b.update();
  }
  if (bgrun == true) {
    bg.display();
    bg.update();
  }

  /*
  // Regn animation
   regn.add(new droplet( new PVector (random(0, width), -100), new PVector(random(0, -100), random(20, 40))));
   for (droplet d : regn) {
   d.display();
   d.update();
   }
   */
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
