class Bruger {
  String name;
  PFont myFont;

  Bruger(String tempName) {
    name = tempName;
    myFont = createFont("Cooper Black", 35);
  }

  void display() {
    textFont(myFont);
    textSize(70);
    fill(255);
    text(name, 50, 100);
  }
}
