// Interaktiv Kalender
// Gruppeprojekt Aleksander, Caroline, Ida og Mads

// Hans Christian hjælpesager:
// Datamine vejrudsigten
// Hvordan skal vi lave objekterne/begivenhedsgem
// Gemme objekternes begivenheder til en bruger


Bruger b;
Layout l;
//PImage sol,regn,skyet;

color tema = color(75,75,255);


void setup(){
size(x,y);  
b = new Bruger("Caroline");
l = new Layout();

//sol = loadImage("sol.png");
}

void draw(){
  background(tema);
  b.display();
  l.display();
  
}
