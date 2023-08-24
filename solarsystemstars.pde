
//CADIGAN'S CODE

class Star2 {  
  float x, y, z, pz, px, py;


  Star2 () {
    x = random(-width/2, width/2);
    y = random(-height/2, height);
    z = random(1, 1000);
  }



  void show () {
    fill(255);
    noStroke();
    float size = random(1, 3);
    ellipse(x, y, size, size); //generate randomly scattered static stars
  }
}
