PImage img;
PImage img2;
float start_x=0;
float distance=1;
boolean reverse=false;

void setup() {
  size(1000, 500);
  img=loadImage("Anim.png");
  img2=loadImage("Block.png");
}

void draw() {
  background(255);
  image(img, 100, 100);
  moveAndShow(img2, start_x);
 // delay(1000);
}
void moveAndShow(PImage img, float start) {
  if(start+300>400)
  reverse=true;
  if(start<0)
  reverse=false;
  if(reverse){
  start-=distance;
  }
  else{
  start+=distance;
  }
  image(img, start, 100);
  start_x=start;
}
