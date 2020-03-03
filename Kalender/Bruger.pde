class Bruger {
  String name;
  PFont myFont, Font;

  Bruger(String tempName) {
    name = tempName;
    myFont = createFont("Cooper Black", 35);
    Font = createFont("SansSerif", 30);
  }

  void display() {
    // Simpel display af bruger navnet, har en anderledes font
    textFont(myFont);
    textSize(70);
    fill(0);
    text(name, 50, 100);
    textFont(Font);
  }
}
