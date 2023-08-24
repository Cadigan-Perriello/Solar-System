
void earthDraw() {
  //SOFIA'S CODE
  pushMatrix();
  translate(0, 375, 0);
  fill(54, 84, 217);
  sphere(350); //draw earth from surface POV
  popMatrix();

  image(imgR, 45, -50, imgR.width/20, imgR.height/20); 
  image(imgR, -75, -50, imgR.width/20, imgR.height/20); //draw rockets
  rocketEngines1.doIt(); 
  rocketEngines2.doIt(); //rocket engine sprays fire
  rocketEngines1.whenYouStart(); 
  rocketEngines2.whenYouStart(); //fire particles reset

  //CADIGAN'S CODE
  for (int i = 0; i < stars2.length; i++) {
    stars2[i].show(); //show stars
  }
}



//SOFIA'S CODE
class RocketFire {
  float xPosR, yPosR; //position of "engine", rocket base
  boolean haveIExploded;
  boolean startMoving;
  int particlesAtBottom;
  FireParticle[] allFireParticles; //particles class

  RocketFire (float xInput, float yInput) {
    xPosR = xInput;
    yPosR = yInput; //all particles start at rocket base
  }

  void youCanStart() { //particles can reset position
    startMoving = true;
  }

  void whenYouStart() { //reset variables
    if (startMoving == true) {
      haveIExploded = false;
    }
    startMoving = false; //particles may not reset position
  }

  void doIt () {
    if (!haveIExploded) { //if not exploded yet, explode
      explode();
      haveIExploded = true;
    } 
    if (haveIExploded == true) { //if exploded, disperse particles
      particlesAtBottom = 0;
      for (int i = 0; i < 50; i++) {
        allFireParticles[i].fireShower(); //move particles
        allFireParticles[i].fireRender(); //draw particles
        if (allFireParticles[i].yPosFire > (yPosR + 5)) {
          particlesAtBottom++;
        }
        if (particlesAtBottom == 50) {
          startMoving = true; //after one set of particles falls, reset position
        }
      }
    }
  }


  void explode() { 

    allFireParticles = new FireParticle[50]; //construct particle list
    for (int i = 0; i < 50; i++) {
      allFireParticles[i] = new FireParticle(xPosR, yPosR); //fill list with particles
    }
  }
}


class FireParticle {
  float xPosFire, yPosFire;
  float xVelFire, yVelFire;
  final float EGRAVITY = 0.08; //gravity for earth

  FireParticle(float xInput, float yInput) { //reset position, speed
    xPosFire = xInput;
    yPosFire = yInput;
    xVelFire = random(-1, 1);
    yVelFire = random(-1, -0.5);
  }

  void fireShower() { //fire particles spray
    xPosFire = xPosFire + xVelFire; //go left or right consistently
    yPosFire = yPosFire + yVelFire; //go up then down
    yVelFire = yVelFire + EGRAVITY;
  }

  void fireRender() { //draw fire particles
    fill(245, 141, 66);
    circle(xPosFire, yPosFire, 3);
  }
}

//image from https://www.seekpng.com/ipng/u2q8w7q8a9u2e6q8_cartoon-rocket-png-cartoon-rocket/
