// Interaktiv Kalender
// Gruppeprojekt Aleksander, Caroline, Ida, Mads og Lucas

// Hans Christian hjælpesager:


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
Begivenhed bg;

// Andre
PImage[] Baggrund = new PImage[2]; 
color tema = color(75, 75, 255);
int CurrentUser;
boolean run = true;
boolean bgrun = false;
int bgdato;
int bgrunmode;
boolean click = true;
boolean oprettet = false;
PrintWriter output;
BufferedReader reader;



void setup() {
 /* for (int j = 0; j < 2; j++) {
    for (int i = 1; i < 36; i++) {
      output = createWriter("Begivenheder" + i + j + ".txt");
    }
  } */



  fullScreen();
  // String[] lines;
  // lines = loadStrings("C:/Users/aleks/Desktop/HTX 3.G/Tekningfag - Digital design/GitHub/Flappy_bird2/Calenderproject/Kalender/Begivenheder.txt");
  //  if ( lines != null) {
  //    for (int i = 0; i < lines.length; i++) {
  //      output.println(lines[i]);
  //    }
  //  }

  //  reader = createReader("Begivenheder" + dato + ".txt");

  /*
Skaber Reader som læser dokumentets oplysninger ind i array;
   Når jeg trykker gem skaber jeg min createWriter og outputter det gamle array + nye informationer;
   
   */


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
  // brugere.get(CurrentUser).display();

  //Display af kalenderens generelle layout
  l.display();
  l.update();

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
