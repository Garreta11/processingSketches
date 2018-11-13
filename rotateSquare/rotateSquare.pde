float count = 10;
int speed = 5;
float offset = 0.5;
float twist = 15;


void setup() {
  size(720, 1280);
  rectMode(CENTER);
  textAlign(CENTER);
}

void draw() {
  background(0);
  noFill();
  pushMatrix();
  translate(width/2, height/2);
  for (int j = 0; j < count; j += 10) {
    for (int i = 0; i < 600; i += 20) {
      float angle = sin(radians(i*offset-frameCount*speed))*twist;
      float angleOffset = map(j, 0, count, 150, 250);
      float opacity = map(j, 0, count, 255, 100);
      float roundness = max(angle, 0)*2.5;
      stroke(0,255,0);
      pushMatrix();
      strokeWeight(2);
      rotate(radians(i*angle/angleOffset));
      rect(0, 0, i/1.5, i/1.5, roundness);
      popMatrix();
    }
  }
  popMatrix();
  noStroke();
  
  saveFrame("output/trip_####.png");
}
