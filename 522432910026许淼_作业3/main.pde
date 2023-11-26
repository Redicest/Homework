ArrayList ret;

int expendSpeed;
//final int timegap=120;
/*void initiatize() {
  ret=new ArrayList<Rectangle>();
  for (int i=0; i<ret.size(); ++i) {
    float xx=random(width);
    float yy=random(height);
    float ll=random(20, 30);
    float ww=random(20, 30);
    ret.add(new Rectangle(xx, yy, ll, ww, expendSpeed));
  }
}
//ret=new Rectangle[num];
int j=1;
*/
void setup() {
  size(500, 500);
  background(255);
  
  frameRate(60);
  ret= new ArrayList();
  //initiatize();
}

void draw() {
  // boolean sign=false;
  //if(mousePressed){
  //sign=true;
  //}
  //if(sign==true){++j;}
  for (int i=0; i<ret.size(); ++i) {
    Rectangle mR=(Rectangle)ret.get(i);
    mR.show();
    mR.expend();
    mR.move();
    mR.edge();
  //  mR.interaction();
    //ret[i].edge();
  }
}
void mousePressed() {
  float xx=random(width);
  float yy=random(height);
  float ll=random(20, 30);
  float ww=random(20, 30);
  ret.add(new Rectangle(xx, yy, ll, ww, expendSpeed));
}

void keyPressed(){

}
