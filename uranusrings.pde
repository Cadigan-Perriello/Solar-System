
//SOFIA'S CODE

class RingU {
  RingParticle[] allRingPieces; //list of particles
  float xPos;
  color currentColor;
  
  RingU (float inputX, color inputC) {
    xPos = inputX;
    currentColor = inputC;
    allRingPieces = new RingParticle[25];
    for (int i = 0; i < allRingPieces.length; i++) {
      allRingPieces[i] = new RingParticle(inputC); //create and fill list of particles
    }
  }

  void move() {
    pushMatrix();
    translate(xPos, -500, 0);
    show();
    rotateZ(frameCount/15.0);
    popMatrix(); //move and render ring
  }

  void show() {
    for (int i = 0; i < allRingPieces.length; i++) {
      pushMatrix();
      allRingPieces[i].drawParticleR(); //create particles
      popMatrix();
    }
  }
}

class RingParticle {
  float min, maj; 
  float r, theta;
  float sign;
  color currentColor;

  RingParticle (color input) {
    currentColor = input;
    min = 200; 
    maj = 215;
    r = random(min, maj);
    theta = random(0, 2*PI);
    sign = round(random(-1, 1));
  }

  void drawParticleR() {
    translate(0, sign*r*cos(theta), (sign*r*sin(theta))+400);
    theta += 0.1;
    if (sign*r*cos(theta) <= 150) { //particles only appear above planet surface (appear to go behind it)
      fill(currentColor); //change color for 1st 2nd or 3rd ring
      sphere(2); //move and draw particles
    }
  }
}
