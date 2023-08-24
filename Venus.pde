
void venusDraw() {
  //SOFIA'S CODE
  translate(0, 375, 0);
  fill(199, 118, 20);
  sphere(350); //draw earth from surface POV

  //CADIGAN'S CODE
  pushMatrix();
  fill(245, 233, 66);
  rotateZ(frameCount/70.0);
  directionalLight(100, 102, 126, -1, 0, 0);
  translate(-625, -200, -200);
  sphere(50);
  popMatrix(); //sun rotating through sky

  pushMatrix();
  translate(0, -375, 0);
  for (int i = 0; i < stars2.length; i++) {
    stars2[i].show(); //draw stars
  }
  popMatrix();
}

void drawFireworks() { //create lava
  count += 1;
  for (int i = 0; i<fw.size(); i++) {
    fw.get(i).goUp();
    fw.get(i).display();
  }
  if (count == 30) {
    fw.add(new Fireworks());
    count = 0;
  }
}
