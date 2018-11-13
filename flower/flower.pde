int numRect = 40;
float tiltAngle = 5;
int minLen = 10;
float speed = 0.005;

void setup() {
  size(600, 600);
  rectMode(CENTER);
  colorMode(HSB, numRect);
  noStroke();
}

void draw() {
  background(0, 0, 0);
  for (int i = 0; i < numRect; i++) {
    pushMatrix();
    translate(width/2, height/2);
    fill(i, numRect, 25, 25);
    if (i%2 == 0) {
      rotate(-tiltAngle*(i+1));
    } else {
      rotate(tiltAngle*(i+1));
    }
    rect(0, 0, minLen*(numRect-i), minLen*(numRect-i), 50);
    popMatrix();
  }
  tiltAngle += speed;
  //saveFrame("output/flower_####.png");
}
