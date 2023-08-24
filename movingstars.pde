
//CADIGAN'S CODE

class Star {  // I (Cadigan) watched video from "The Coding Train" on Youtube for inspiration and help on this code
  float x, y, z, pz, px, py;


  Star () {
    x = random(-width, width);
    y = random(-height, height);
    z = random(1, 1000); //generate random star positions
  }



  void update () {
    z = z - 15;
    if (z < 1) {
      x = random(-width, width);
      y = random(-height, height);
      z = width; //move stars forward
    }
  }

  void show () {
    fill(184, 211, 255);
    noStroke();

    // println(z);
    float sx = map(x / z, 0, 1, 0, width/1.5);
    float sy = map(y / z, 0, 1, 0, height/1.5);
    float r = map(z, 0, width, 16, 0);
    ellipse(sx, sy, r, r); //draw stars
  } 
}
