
void marsDraw () {
  //SOFIA'S CODE
  pushMatrix();
  translate(0, 375, 0);
  fill(158, 87, 57);
  sphere(350); //draw mars from surface POV
  popMatrix();

  //CADIGAN'S CODE
  pushMatrix();
  fill(171, 171, 171);
  rotateZ(frameCount/70.0);
  translate(-337.5, -100, -50);
  sphere(17.5);
  popMatrix(); //draw rotating mars moon 1

  pushMatrix();
  fill(94, 94, 94);
  rotateZ(frameCount/60.0);
  translate(-350, -112.5, -50);
  sphere(25);
  popMatrix(); //draw rotating mars moon 2


  for (int i = 0; i < stars2.length; i++) {
    stars2[i].show(); //draw stars
  }
}

void keyTyped () {
  counter = counter + 1; //add image when key pressed
}

void imageAdd() {
  if (counter == 1) {
    image(imgRover, 45, -80, width/6, height/6); //key pressed once -> 1 image
  }
  if (counter == 2) {
    image(imgRover, 45, -80, width/6, height/6);
    image(imgDome, -195, -50, width/8, height/8.5); //key pressed 2 times -> 2 images
    ;
  }
  if (counter == 3) {
    image(imgRover, 45, -80, width/6, height/6);    
    image(imgDome, -195, -50, width/8, height/8.5);
    image(imgHouse, -135, -175, width/3.5, height/4); //key pressed 3 times -> 3 images
  }
  if (counter == 4) {
    image(imgCity, -290, -340, 600, 450); //key pressed 4 times -> city
  }
}
