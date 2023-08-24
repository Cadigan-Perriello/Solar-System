
void saturnDraw () {
  //SOFIA'S CODE
  pushMatrix();
  translate(0, 375, 0);
  fill(201, 172, 91);
  sphere(350); 
  popMatrix(); //draw saturn from surface POV

  //CADIGAN'S CODE
  for (int i = 0; i < stars2.length; i++) {
    stars2[i].show(); //draw stars
  }
  
  //saturn rings ("saturnrings" tab) by cadigan
}
