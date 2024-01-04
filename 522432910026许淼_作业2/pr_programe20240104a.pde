float oldX = 0, oldY = 0.5;
float a = -2, b = -2, c = -1.2, d = 2, mag = 150;
void setup() {
  size(800, 800);
}

void draw() {
  background(255);
  stroke(0);
  translate(width/2, height/2);
  for (int i = 0; i < 200000; i++) {

    float newX= sin(a * oldY) - cos(b * oldX);
    float newY= sin(c * oldX) - cos(d * oldY);


    point(newX * mag, newY * mag);


    oldX=newX;
    oldY=newY;
  }
}

void mousePressed() {
  background(255);
  float x = random(-0.2, 0.2);
  float y = random(-0.2, 0.2);
  a = random(-2.5, 2.5);
  b = random(-2.5, 2.5);
  c = random(-2.5, 2.5);
  d = random(-2.5, 2.5);
}
