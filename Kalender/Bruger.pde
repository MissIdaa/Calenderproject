class Bruger {
  String name;
  PFont myFont;

  Bruger(String tempName) {
    name = tempName;
    myFont = createFont("Cooper Black", 35);
    textFont(myFont);
  }

  void display() {
    text(name, 50, 100);
  }
}
