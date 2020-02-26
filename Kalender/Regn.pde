// For sjov animation vi lavede, kan aktiveres under draw løkken

class droplet {
  PImage drop;
  PVector pos;
  PVector v; 

  droplet(PVector tempPos, PVector tempV) {
    pos = tempPos.copy();
    v = tempV.copy();
    drop = loadImage("drop.png");
    drop.resize(10, 20);
  }

  void display() {
    image(drop, pos.x, pos.y);
  }

  void update() {
    pos.add(v);
  }
}
