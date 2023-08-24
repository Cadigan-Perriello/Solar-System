
//SOFIA'S CODE

RingU[] myRings;
color ring1 = color(201, 254, 255);
color ring2 = color(200, 224, 224);
color ring3 = color(255); //different colors for 1st 2nd or 3rd ring

void uranusDraw() {
  myRings = new RingU[3];
  pushMatrix();
  translate(0, 375, 0);
  fill(125, 186, 227);
  sphere(350);
  makeRings(); //create all rings
  for (int i = 0; i <(myRings.length); i++) {
    myRings[i].move(); //move and render all rings
  }
  popMatrix(); //draw uranus from surface POV
  
  //CADIGAN'S CODE
  for (int i = 0; i < stars2.length; i++) {
    stars2[i].show(); //draw stars
  }
}

//SOFIA'S CODE
void makeRings() {
  int X = -50;
  for (int i = 0; i < (myRings.length); i++) {
    if (X == -50) {
    myRings[i] = new RingU(X, ring1);
    }
    if (X == 0) {
    myRings[i] = new RingU(X, ring2);
    }
    if (X == 50) {
    myRings[i] = new RingU(X, ring3);
    }
    X += 50; //make 3 rings 50p apart
  }
}
