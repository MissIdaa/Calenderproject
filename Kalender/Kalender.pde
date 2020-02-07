// Interaktiv Kalender
// Gruppeprojekt Aleksander, Caroline, Ida og Mads

// Hans Christian hjælpesager:
// Datamine vejrudsigten
// Hvordan skal vi lave objekterne/begivenhedsgem
// Gemme objekternes begivenheder til en bruger


Bruger b;
Layout l;
PImage sol,regn,skyet;

color tema = color(75,75,255);


void setup(){
fullScreen();  
b = new Bruger("Caroline");
l = new Layout();

sol = loadImage("sol.jpg");
}

void draw(){
  background(sol);
  b.display();
  l.display();
  
}
