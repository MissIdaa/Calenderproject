class Layout {
  String[] ugenavne = {"Mandag", "Tirsdag", "Onsdag", "Torsdag", "Fredag", "Lørdag", "Søndag"};

  Layout() {
  }

  void display() {

    //   rect(150,250,900,350,25);


    /*   for(int i = 1; i < 7;i++){
     line(100+(i*(1000/7)),200,100+(i*(1000/7)),650);
     line(100,200+(i*(450/6)),1100,200+(i*(450/6)));
     }
     */
    textSize(50);
    for (int i = 0; i < 7; i++) {
      for (int j = 0; j < 6; j++) {
        if (i == 0 || i == 2 || i == 4 || i == 6) {
          fill(162, 222, 232);
        }
        rect(100+(i*(1720/7)), 200+(j*(780/6)), 1720/7, 780/6, 10);
      }
      fill(0);
      text(ugenavne[i], 125+(i*(1720/7)), 270);
      fill(255);
    }
  }
}
