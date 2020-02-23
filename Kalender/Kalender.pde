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
ArrayList<Boks> bokse = new ArrayList<Boks>();
Serial myPort;
Layout l;
Calendar calendar;
Vejrudsigt vejr;

// Andre
PImage[] Baggrund = new PImage[2]; 
color tema = color(75, 75, 255);
int CurrentUser;
boolean run = true;

void setup() {
  fullScreen();

  // Tilføjelse af brugere, mulighed for tilføjelse af flere skal implementeres
  brugere.add(new Bruger("Caroline"));
  brugere.add(new Bruger("Ida"));

  // Oprettelse af objekter
  l = new Layout();
  vejr = new Vejrudsigt();

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
  // brugere.get(CurrentUser).display();
  
  //Display af kalenderens generelle layout
  l.display();
  
  // Display af vejret
  vejr.display();
  
  // Display af dagene
  for (Boks b : bokse) {
    b.display();
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

//-----------------------------------------------------------------
// Til begivenhedsbokse
/*
void mousePressed() {
 if (l.mus == false) {
 l.mus = true;
 } else if (l.mus == true) { 
 l.mus = false;
 }
 l.pos.x = mouseX;
 l.pos.y = mouseY;
 }
 */
