

void mercuryDraw() {
  //SOFIA'S CODE
  pushMatrix();
  translate(0, 375, 0);
  fill(156, 134, 109);
  sphere(350);
  //draw mercury from surface POV

  //CADIGAN'S CODE
  pushMatrix();
  fill(245, 233, 66);
  rotateZ(frameCount/30.0 * -1);
  directionalLight(100, 102, 126, -1, 0, 0);
  translate(-625, -200, -200);
  sphere(85);
  popMatrix();
  //draw sun rotating through sky
  popMatrix();


  for (int i = 0; i < stars2.length; i++) {
    stars2[i].show(); //draw stars
  }
}
