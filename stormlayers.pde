
//SOFIA'S CODE

class StormLayer {

  StormParticle[] allStormPieces; //list of particles
  float X;
  float Y;

  StormLayer (float inputX, float inputY) {
    X = inputX;
    Y = inputY; //stormlayer position
    allStormPieces = new StormParticle[12];
    for (int i = 0; i < 12; i++) {
      allStormPieces[i] = new StormParticle(); //create and fill list of particles
    }
  }

  void swirl() {
    pushMatrix();
    translate(X, -500 + Y, 0);
    show();
    rotateZ(frameCount/20.0);
    popMatrix(); //move and render stormlayer
  }

  void show() {
    for (int i = 0; i < allStormPieces.length; i++) {
      pushMatrix();
      if (spotOrExtra == 0) {
        allStormPieces[i].drawParticleSpot(); //create particles for main storm
      }
      if (spotOrExtra == 1) {
        allStormPieces[i].drawParticleExtra(); //create particles for surrounding motion
      }
      popMatrix();
    }
  }
}

class StormParticle {
  float min, maj; 
  float r, theta;
  float sign;

  StormParticle () {
    min = 50; 
    maj = 75;
    r = random(min, maj);
    theta = random(0, 2*PI);
    sign = round(random(-1, 1));
  }

  void drawParticleSpot() {
    translate((r*cos(theta)+15), 155, (r*sin(theta)+150));
    theta += 0.01;
    fill(194, 61, 47);
    sphere(2); //move and draw particles for storm
  }

  void drawParticleExtra() {
    translate((3*r*cos(theta)+15), 75, (3*r*sin(theta)+150));
    theta += 0.01;
    fill(245, 203, 66);
    sphere(2); //move and draw particles for motion
  }
}
