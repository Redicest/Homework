ArrayList<Particle> particles;

void setup(){
  size(1600, 900);
  background(0);
  noStroke();
  
  particles = new ArrayList<Particle>();
  for (int i = 0; i < 6000; i++){
    Particle p = new Particle();
    particles.add(p);
  }
}

void draw(){
  frameRate(40);
  fill(0, 10);
  rect(0, 0, width, height);
  
  loadPixels();
  for (Particle p : particles){
    p.update();
    p.boundaryDetect();
    p.display();
  }
  updatePixels();
}
