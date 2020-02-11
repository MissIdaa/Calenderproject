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


Bruger b;
Layout l;
PImage sol, regn, skyet;

color tema = color(75, 75, 255);
String vejrgrader;

void setup() {
  fullScreen();  
  b = new Bruger("Caroline");
  l = new Layout();

  sol = loadImage("skyet.png");
  data();
}

void draw() {
  background(sol);
  b.display();
  l.display();
}

void data() {
  String[] lines = loadStrings("https://vejr.tv2.dk/vejr/hjoerring-2620214");
  println(lines[180]);
  
      int pointst = lines[180].indexOf("<td");
      int pointsl = lines[180].indexOf("</td>", pointst);
      
      vejrgrader = (lines[180].substring(pointst+20,pointsl));
}
