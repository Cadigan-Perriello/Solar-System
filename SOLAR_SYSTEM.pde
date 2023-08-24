
//SHARED CODE
final float SUNRADIUS = 1090.0/2;
final float MERCRADIUS = 3.85/2;
final float VENUSRADIUS = 9.49/2;
final float EARTHRADIUS = 10/2;
final float MARSRADIUS = 5.32/2;
final float JUPIRADIUS = 112.1/2;
final float SATURNRADIUS = 94.5/2;
final float URANRADIUS = 40.1/2;
final float NEPTRADIUS = 38.8/2; 
//scientifically accurate radii of all planets (sun excluded)

//CADIGAN'S CODE
ArrayList<Fireworks>fw;       //For Venus
Fireworks[]f = new Fireworks[30];   //Venus Array Fireworks
int count; //adding new fireworks
Star[]stars = new Star[1000];  //Neptune Stars
Star2[]stars2 = new Star2[500]; //solar system stars

int counter = 0; //how many times a key was clicked on mars
PImage imgRover;
PImage imgDome;
PImage imgHouse;
PImage imgCity; //mars images


RingS []rings = new RingS [50];//Saturn Rings

RocketFire rocketEngines1 = new RocketFire(65, 5);
RocketFire rocketEngines2 = new RocketFire(-55, 5); //2 rocket engines (earth)

//SHARED CODE
boolean canPlanetsDraw;     
//allows creation of planets to be in "draw" function: if no planet has been selected, all 8 may draw; 
//if one is selected, none draw (making room for new sphere representing chosen planet) 
boolean canBackgroundClear; 
//allows background(0) to be called once, clearing current screen
int currentPlanet; 
//keeps track of which planet has been selected: mercury = 1, venus = 2, etc.

PImage imgR; //rocket image (earth)

void setup () {
  size(1000, 1000, P3D);
  background(0);
  
 //SHARED CODE
  imgRover = loadImage ("rover2.png");
  imgDome = loadImage ("dome2.png");
  imgHouse = loadImage ("house.png");
  imgCity = loadImage ("city.png");
  imgR = loadImage ("rocket.png"); //load images for mars & earth

//CADIGAN'S CODE
  fw=  new ArrayList<Fireworks>(); // For the Venus Fireworks
  for (int i = 0; i < f.length; i++) {
    f[i] = new Fireworks();
  }

  for (int i = 0; i < stars.length; i++) {   // create Neptune Stars
    stars[i] = new Star();
  }
  for (int i = 0; i < stars2.length; i++) {   //create Solar System Stars
    stars2[i] = new Star2();
  }
  for (int i = 0; i < rings.length; i++) {   //create Saturn Rings
    rings[i] = new RingS();
  }

//SOFIA'S CODE
  rocketEngines1.youCanStart(); 
  rocketEngines1.whenYouStart(); 
  rocketEngines2.youCanStart(); 
  rocketEngines2.whenYouStart(); //set up fire particles for earth rocket

  canPlanetsDraw = true; 
  //all 8 planets + sun may appear at launch
  currentPlanet = 0; 
  //no planet has been selected at launch
}

void draw () {
  clear();
  lights();
  noStroke();
  translate(width/2, height/2, 0);
  //sets origin to center of screen
  scale(2);
  //adjusts size for factual accuracy + easy viewing 

//SHARED CODE
  SolarSystemButton();

  if (canPlanetsDraw == true) { //if whole system is allowed to appear
    drawPlanets(); //draw all
  } else { //if a planet has been selected
    canBackgroundClear = true; //background(0) may run once
  }

  if (currentPlanet == 1) { //if mercury was clicked
    clearPlanets(); //background(0) clears screen and whole system can no longer draw
    mercuryDraw(); //shift POV to mercury surface
  }

  if (currentPlanet == 2) { //if venus was clicked
    clearPlanets();
    venusDraw(); //shift POV to venus surface
    //CADIGAN'S CODE
    count+= 1;
    for (int i = 0; i<fw.size(); i++) {
      fw.get(i).goUp();
      fw.get(i).display();
    }
    if (count == 30) {
      fw.add(new Fireworks());
      count = 0;
    }
  }

//SHARED CODE
  if (currentPlanet == 3) { //if earth was clicked
    clearPlanets();
    earthDraw(); //shift POV to earth surface
  }

  if (currentPlanet == 4) {
    clearPlanets();
    marsDraw();
    imageAdd(); //when a key is pressed, add an image (up to 4)
  }

  if (currentPlanet == 5) { //if jupiter was clicked
    clearPlanets();
    jupiterDraw(); //shift POV to jupiter surface
  }

  if (currentPlanet == 6) { //if saturn was clicked
    clearPlanets();
    saturnDraw(); //shift POV to saturn surface
    //CADIGAN'S CODE
    for (int i = 0; i < rings.length; i++) {
      rings[i].appear(); //show rings
    }
  }

//SHARED CODE
  if (currentPlanet == 7) { //if uranus was clicked
    clearPlanets();
    uranusDraw(); //shift POV to uranus surface
  }

  if (currentPlanet == 8) { //if neptune was clicked
    for (int i = 0; i < stars.length; i++) {
      clearPlanets();
      neptuneDraw(); //shift POV to neptune surface
      //CADIGAN'S CODE
      stars[i].update(); //show moving stars
      stars[i].show();
    }
  }
  
//SHARED CODE
  if (currentPlanet == 9) { //if solar system was clicked
    clearPlanets(); //clear planet-surface POV
    canPlanetsDraw = true; //allow all planets to draw
    drawPlanets(); //draw solar system
  }
}

//CADIGAN'S CODE
void drawPlanets() {
  for (int i = 0; i < stars2.length; i++) {
    stars2[i].show(); //show scattered stars
  }

//SHARED CODE
  pushMatrix();
  rotateX(frameCount/10.0);
  translate(-800.0, 0, 0); //move to sun position
  fill(252, 219, 3);
  sphere(SUNRADIUS); //draw sun
  popMatrix();

  pushMatrix();
  rotateX(frameCount);
  translate(-180.0, 0, 0); //move to mercury position
  fill(156, 134, 109);
  sphere(MERCRADIUS); //draw mercury
  popMatrix();

  push();
  rotateX(frameCount);
  translate(-162.5, 0, 0); //move to venus position
  fill(199, 118, 20);
  sphere(VENUSRADIUS); //draw venus
  popMatrix();


  pushMatrix();
  rotateX(frameCount);
  translate(-140.0, 0, 0); //move to earth position
  fill(54, 84, 217);
  sphere(EARTHRADIUS); //draw earth
  popMatrix();


  pushMatrix();
  rotateX(frameCount);
  translate(-117.5, 0, 0); //move to mars position
  fill(158, 87, 57);
  sphere(MARSRADIUS); //draw mars
  popMatrix();


  pushMatrix();
  rotateX(frameCount);
  translate(-42.5, 0, 0); //move to jupiter position
  fill(245, 147, 105);
  sphere(JUPIRADIUS); //draw jupiter
  popMatrix();


  pushMatrix();
  rotateX(frameCount);
  translate(70.0, 0, 0); //move to saturn position
  fill(201, 172, 91);
  sphere(SATURNRADIUS); //draw saturn
  popMatrix();


  pushMatrix();
  rotateX(frameCount);
  translate(157.5, 0, 0); //move to uranus position
  fill(125, 186, 227);
  sphere(URANRADIUS); //draw uranus
  popMatrix();


  pushMatrix();
  rotateX(frameCount);
  translate(212.5, 0, 0); //move to neptune
  fill(62, 59, 255);
  sphere(NEPTRADIUS); //draw neptune
  popMatrix();
}

//SHARED CODE
void mouseClicked() {

  if (mouseX > 136.15 && mouseX < 143.85 && mouseY > 496.15 && mouseY < 503.85) {
    currentPlanet = 1;
  } //if mouse is within mercury's furthest points when clicked, current planet is 1 (mercury)

  if (mouseX > 165.51 && mouseX < 184.49 && mouseY > 490.51 && mouseY < 509.49) {
    currentPlanet = 2;
  } //if mouse is within venus's furthest points when clicked, current planet is 2 (venus)

  if (mouseX > 210 && mouseX < 230 && mouseY > 490 && mouseY < 510) {
    currentPlanet = 3;
  } //if mouse is within earth's furthest points when clicked, current planet is 3 (earth)

  if (mouseX > 259.68 && mouseX < 270.32 && mouseY > 494.68 && mouseY < 505.32) {
    currentPlanet = 4;
  } //if mouse is within mars's furthest points when clicked, current planet is 4 (mars)

  if (mouseX > 302.9 && mouseX < 527.1 && mouseY > 387.9 && mouseY < 612.1) {
    currentPlanet = 5;
  } //if mouse is within jupiter's furthest points when clicked, current planet is 5 (jupiter)

  if (mouseX > 545.5 && mouseX < 734.5 && mouseY > 405.5 && mouseY < 594.5) {
    currentPlanet = 6;
  } //if mouse is within saturn's furthest points when clicked, current planet is 6 (saturn)

  if (mouseX > 774.9 && mouseX < 855.1 && mouseY > 459.9 && mouseY < 540.1) {
    currentPlanet = 7;
  } //if mouse is within uranus's furthest points when clicked, current planet is 7 (uranus)

  if (mouseX > 886.2 && mouseX < 963.8 && mouseY > 461.2 && mouseY < 538.8) {
    currentPlanet = 8;
  } //if mouse is within neptune's furthest points when clicked, current planet is 8 (neptune)

  if ((mouseX > 0) && (mouseX < 205) && (mouseY > 0) && (mouseY < 80)) {  //Solar System Button
    currentPlanet = 9;
  } //if mouse is within button's furthest points when clicked, current planet is 9 (reset)
}

//SHARED CODE
void clearPlanets() {
  canPlanetsDraw = false; //full solar system can no longer draw
  if (canBackgroundClear == true) {
    background(0); //background clears once
    SolarSystemButton();
  }
  canBackgroundClear = false; //background may not clear again
}

//CADIGAN'S CODE
void SolarSystemButton() { //draw solar system button
  fill(151, 158, 186);
  rect(-250, -250, 102.5, 40);
  fill(235, 211, 237);
  textSize(15);
  text("Solar System", -245, -225);
}
