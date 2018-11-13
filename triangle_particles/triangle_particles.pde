final int NB_PARTICLES = 300;
ArrayList<Triangle> triangles;
Particle[] parts = new Particle[NB_PARTICLES];
PImage image;
MyColor myColor = new MyColor();

void setup(){
  size(600, 450, P2D);
  for (int i = 0; i < NB_PARTICLES; i++) {
    parts[i] = new Particle();
  }
}

void draw(){
  myColor.update();
  noStroke();
  fill(120, 1);
  background(50);
  triangles = new ArrayList<Triangle>();
  Particle p1, p2;

  for (int i = 0; i < NB_PARTICLES; i++) {
    parts[i].move();
  }

  for (int i = 0; i < NB_PARTICLES; i++){
    p1 = parts[i];
    p1.neighboors = new ArrayList<Particle>();
    p1.neighboors.add(p1);
    for (int j = i+1; j < NB_PARTICLES; j++){
      p2 = parts[j];
      float d = PVector.dist(p1.pos, p2.pos); 
      if (d > 0 && d < Particle.DIST_MAX){
        p1.neighboors.add(p2);
      }
    }
    if(p1.neighboors.size() > 1){
      addTriangles(p1.neighboors);
    }
  }
  drawTriangles();
}

void drawTriangles(){
  noStroke();
  fill(myColor.R, myColor.G, myColor.B, 13);
  stroke(max(myColor.R-15, 0), max(myColor.G-15, 0), max(myColor.B-15, 0), 13);
  //noFill();
  beginShape(TRIANGLES);
  for (int i = 0; i < triangles.size(); i ++){
    Triangle t = triangles.get(i);
    t.display();
  }
  endShape();  
}

void addTriangles(ArrayList<Particle> p_neighboors){
  int s = p_neighboors.size();
  if (s > 2){
    for (int i = 1; i < s-1; i ++){ 
      for (int j = i+1; j < s; j ++){ 
         triangles.add(new Triangle(p_neighboors.get(0).pos, p_neighboors.get(i).pos, p_neighboors.get(j).pos));
      }
    }
  }
}

void mousePressed(){
   myColor.init(); 
}
