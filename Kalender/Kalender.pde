// Interaktiv Kalender
// Gruppeprojekt Aleksander, Caroline, Ida, Mads og Lucas

// I kalenderen kan man tilføje en begivenhed til en dag ved at højreklikke på datoen og skrive en besked og vælge et ikon/type
// Man kan se mere info om datoen ved at venstreklikke på det
// Afslutknap i øverste højre hjørne
// Man kan skifte bruger med arduino chip, Det kræver bare man skal fjerne kommentarene i koden og tilkoble RFID Scanneren
// Vejrudsigten er opdateret med de nuværende vejrmeldinger, hvis den giver error er det fordi de har ændret koden på hjemmesiden (det er for det meste ikke flyttet mere end 3 linjer)
// Det er en prototype, så der er kun en enkelt (fiktionel) måned lige nu
// Have fun! 


// Bibliotek vi skal bruge til interaktion med arduino
import processing.serial.*;

// Arraylister og objkter til klasser
ArrayList<droplet> regn = new ArrayList<droplet>();
ArrayList<Bruger> brugere = new ArrayList<Bruger>();
ArrayList<Boks> bokse = new ArrayList<Boks>();
Serial myPort;
Layout l;
Vejrudsigt vejr;
Begivenhed bg;

// Andre
PImage[] Baggrund = new PImage[2]; 
color tema = color(75, 75, 255);
int CurrentUser;
boolean run = true;
boolean bgrun = false;
int bgdato = 1;
int bgrunmode;
boolean click = true;
boolean oprettet = false;
PrintWriter output;
BufferedReader reader;
PImage birthday, work, travel, party, sport, homework;
String dataWemos = "";
String kortNum = "0";
int clickcounter;


void setup() {
  // opsætning af billeder der bruges til ikoner (Omskrives til arrayliste og resizing hvis jeg har ekstra tid)
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

  // Baggrundsbilleder
  Baggrund[0] = loadImage("sol.png");
  Baggrund[1] = loadImage("skyet.png");
  fullScreen();

  // Tilføjelse af brugere, omskrives senere hvis der skal implementeres system for oprettelse
  brugere.add(new Bruger("Caroline"));
  brugere.add(new Bruger("Ida"));

  // Oprettelse af objekterne
  l = new Layout();
  vejr = new Vejrudsigt();
  bg = new Begivenhed();

  //  Udstreget så længe man ikke kan tilkoble en arduino
  // Opsætning af serial port
  String portName = Serial.list() [2];
  println("Proever: " + portName);
  myPort = new Serial(this, portName, 115200);
}

// Her køres funktionerne
void draw() {
  background(Baggrund[CurrentUser]);
  chiplogin();   // Igen køres kun hvis vi har arduino tilkoblet

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

  // Display af boks om begivenheder (både venstre og højreklik
  if (bgrun == true) {
    bg.display();
    bg.update();
  }
  
  println(clickcounter);
  
  /*
    // Ekstra ting vi legede med
   // Regn animation
   regn.add(new droplet( new PVector (random(0, width), -100), new PVector(random(0, -100), random(20, 40))));
   for (droplet d : regn) {
   d.display();
   d.update();
   }
   */
}

//-------------------------------------------------------------------------
// Slås til hvis vi har arduiono
// Arduino chips
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
}
