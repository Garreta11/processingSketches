int frame_number = 0;
float c = 0;
void setup() {
  size(720, 1280);
  strokeWeight(5);
  stroke(255);
  smooth();
  colorMode(HSB);
}

void draw() {
  translate(width/2, height/2);
  background(0);

  for (int r = 10; r < 250; r+=15) {
    rotate(radians(frame_number));
    for (int deg = 30; deg < 300; deg++) {
      float x1 = r * cos(radians(deg));
      float y1 = r * sin(radians(deg));
      float x2 = r * cos(radians(deg + 1));
      float y2 = r * sin(radians(deg + 1));
      stroke(c, 255, 255);
      line(x1, y1, x2, y2);
      c+=0.005;
      if (c > 350) {
        c = 0;
      }
    }
  }
  frame_number++;
}
