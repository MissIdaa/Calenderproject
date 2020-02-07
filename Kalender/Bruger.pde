class Bruger {
  String name;
  PFont myFont;

  Bruger(String tempName) {
    name = tempName;
    myFont = createFont("Cooper Black", 35);
    textFont(myFont);
  }

  void display() {
    textSize(35);
    text(name, 50, 100);
  }
}
