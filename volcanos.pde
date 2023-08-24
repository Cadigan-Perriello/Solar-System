
//CADIGAN'S CODE

class Fireworks {
  float xPos, yPos;
  float explodeHeight;
  boolean hasExploded;
  Particles[] myPieces;

  Fireworks () {
    reset();
  }

  void reset () {
    xPos = random(-15, 15);
    yPos = -350;
    hasExploded = false;
    explodeHeight = 115;
  }

  void display () {
    if (!hasExploded) {
      fill (209, 144, 31);
      ellipse (xPos, yPos, 5, 5);
    }
  }

  void goUp () {
    if (!hasExploded) {
      yPos = yPos - 7;
    } else {
      for (int i = 0; i < myPieces.length; i++) {
        myPieces[i].p();
        myPieces[i].show();
      }
    }

    if ((!hasExploded) && yPos < explodeHeight) {
      explode ();
      hasExploded = true;
    }
  }

  void explode () {
    myPieces = new Particles [200];
    for (int i = 0; i < 200; i++) {
      myPieces[i] = new Particles(xPos, yPos);
      myPieces[i].p();
      myPieces[i].show();
    }
  }
}

class Particles {
  float xPos, yPos, xVel, yVel;
  int c;
  float GRAVITY = 0.1;

  Particles (float xPosF, float yPosF) {
    xPos = xPosF;
    yPos = yPosF;
    xVel = (random(-2, 2));
    yVel = (random(-2, 2));
  }
  void show() {
    color c = color (209, 144, 31);
    fill(c);
    ellipse (xPos, yPos, 3, 3);
  }
  void p() {
    point (xPos, yPos);
    xPos= xPos + xVel;
    yPos= yPos + yVel;
    yVel= yVel+ GRAVITY;
  }
}
