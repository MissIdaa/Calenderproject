// Interaktiv Kalender
// Gruppeprojekt Aleksander, Caroline, Ida og Mads
Bruger b;
Layout l;

color tema = color(75,75,255);


void setup(){
size(1200,700);  
b = new Bruger("Caroline");
l = new Layout();
}

void draw(){
  background(tema);
  b.display();
  l.display();
  
}
