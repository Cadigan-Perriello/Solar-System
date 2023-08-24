
//CADIGAN'S CODE

class RingPieces {
  float min, maj;
  float r, theta;

  RingPieces () {
    min = 670 - 100;
    maj = 700 - 100;
    r = random(min, maj);
    theta = random(0, 2 * PI);
  }
  void construct() {
    fill(255);
    translate(cos(theta)*r, sin(theta)*r + 400);
    theta += 0.02;
    fill(146, 186, 209);
    sphere(3); //draw ring of particles, rotating
  }
}
class RingPieces2 {
  float min2, maj2;
  float r2, theta2;

  RingPieces2 () {
    min2 = 700 - 100;
    maj2 = 735 - 100;
    r2 = random(min2, maj2);
    theta2 = random(0, 2 * PI);
  }
  void construct2() {
    fill(255);
    translate(cos(theta2)*r2, sin(theta2)*r2+400);
    theta2 += 0.04;
    fill(221, 197, 227);
    sphere(2.5); //draw ring of particles, rotating
  }
}
class RingPieces3 {
  float min3, maj3;
  float r3, theta3;

  RingPieces3 () {
    min3 = 630 - 100;
    maj3 = 670 - 100;
    r3 = random(min3, maj3);
    theta3 = random(0, 2 * PI);
  }
  void construct3() {
    fill(255);
    translate(cos(theta3)*r3, sin(theta3)*r3+400);
    theta3 += 0.01;
    fill(163, 131, 138);
    sphere(1.5); //draw ring of particles, rotating
  }
}

class RingS {
  RingPieces[] Rings;
  RingPieces2[] Ring2;
  RingPieces3[] Ring3;

  RingS () {
    Rings = new RingPieces [10];
    Ring2 = new RingPieces2[10];
    Ring3 = new RingPieces3[15];

    for (int i = 0; i < Rings.length; i++) {
      Rings[i] = new RingPieces();
    }
    for (int i = 0; i < Ring2.length; i++) {
      Ring2[i] = new RingPieces2();
    }
    for (int i = 0; i < Ring3.length; i++) {
      Ring3[i] = new RingPieces3();
    }
  }

  void appear () {

    for (int i = 0; i < Rings.length; i++) {
      pushMatrix();
      Rings[i].construct();
      popMatrix();
      pushMatrix();
      Ring2[i].construct2();
      popMatrix();
      pushMatrix();
      Ring3[i].construct3();
      popMatrix();
    }
  }
}
