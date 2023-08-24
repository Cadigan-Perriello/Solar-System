
//SOFIA'S CODE

StormLayer[] bigRedSpot;
StormLayer[] extras;
int spotOrExtra = -1; //defines particle color

void jupiterDraw() {
  pushMatrix();
  translate(0, 375, 0);
  fill(245, 147, 105);
  sphere(350); //draw jupiter from surface POV


  bigRedSpot = new StormLayer[3]; //create main storm
  extras = new StormLayer[2]; //create additional swirls
  makeLayers(); //make all layers of storm/swirl
  for (int i = 0; i < bigRedSpot.length; i++) {
    spotOrExtra = 0; //particles are red
    bigRedSpot[i].swirl(); //move and show particles
  }
  for (int i = 0; i < extras.length; i++) {
    spotOrExtra = 1; //particles are orange
    extras[i].swirl(); //move and show particles
  }
  popMatrix(); 

//CADIGAN'S CODE
  for (int i = 0; i < stars2.length; i++) {
    stars2[i].show(); //show stars
  }
}

//SOFIA'S CODE
void makeLayers() { //make all layers of storms
  int Ybrs = -5;
  int Xbrs = -10;
  for (int i = 0; i < bigRedSpot.length; i++) {
    bigRedSpot[i] = new StormLayer(Xbrs, -1*abs(Ybrs));
    Ybrs += 5;
    Xbrs += 10; //create 3 layers in v-shape to make storm
  }
  int Yextra = 100;
  for (int i = 0; i < extras.length; i++) {
    extras[i] = new StormLayer(-10, (Yextra));
    Yextra += 20; //create 2 spread-out layers
  }
}
