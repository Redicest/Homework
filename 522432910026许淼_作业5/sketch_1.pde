ArrayList<Triangle> triangles;

PVector[][] vp;

int heightSection = 36;
int laySection = 72;
float radiu = 200;
float layerHeight = 20;
float d=0;
float tight=0;
  float color1=0;
  float color2=0;
  float color3=0;
int Color=0;
int lastColor=0;

float rotateRange = PI;

boolean showNormalLine;

float ProbOfShowShape = 0.75;
float ProbOfShowContourShape = 0.5;

void setup() {
  size(1200, 1200, P3D);
  surface.setLocation(50, 50);

  UI();

  setSystem();
}

void setSystem() {
  initiateModelData();
  buildMesh(vp);

  for (Triangle t : triangles) {
    if (random(1)<ProbOfShowShape) {
      t.drawShape = true;
      if (random(1)<ProbOfShowContourShape) {
        t.drawContour = true;
      }
    }
  }
}

void draw() {
  background(100);
  pointLight(255, 0, 0, 35, 40, 0);
  colorChange(Color);
  // lights();

  for (Triangle t : triangles) {

    t.run();
  }

  cam.beginHUD();
  slider.draw();
  cam.endHUD();

  if ((mouseX<360 && mouseY< 340) || (mouseX<150 && mouseY > height-150)) {//此限定区域为滑块所在位置
    cam.setActive(false);
  } else {
    cam.setActive(true);
  }
}

void initiateModelData() {
  vp= new PVector[heightSection][laySection];
  float angSection =0;
  float sectionPhaseAngle =0;
  for (int i = 0; i < vp.length; i ++) {
    if (i<vp.length/2) {
      angSection = TWO_PI / vp[0].length+10;
      sectionPhaseAngle = rotateRange / vp.length;
    } else {
      angSection = TWO_PI / vp[0].length+10;
      sectionPhaseAngle = rotateRange / vp.length;
    }
    for (int j = 0; j < vp[0].length; j ++) {
      float xx=0;
      float yy=0;
      float zz=0;
      if (i>tight-10&&i<tight+10) {
        xx=0;
        yy=0;
        zz=0;
      } else {
        xx = (radiu+d) * cos(angSection * j + sectionPhaseAngle * i);
        yy = radiu * sin(angSection * j + sectionPhaseAngle * i);
        zz = layerHeight * i;
      }
      vp[i][j] = new PVector(xx, yy, zz);
    }
  }
}

void buildMesh(PVector[][] model) {
  triangles = new ArrayList<Triangle>();

  for (int i = 0; i < model.length-1; i ++) {
    for (int j = 0; j < model[0].length; j ++) {
      PVector p1 = new PVector(model[i][j].x, model[i][j].y, model[i][j].z);
      PVector p2 = new PVector(model[i+1][j].x, model[i+1][j].y, model[i+1][j].z);
      PVector p3 = new PVector(model[i][(j+1)%model[0].length].x, model[i][(j+1)%model[0].length].y, model[i][(j+1)%model[0].length].z);
      PVector p4 = new PVector(model[i+1][(j+1)%model[0].length].x, model[i+1][(j+1)%model[0].length].y, model[i+1][(j+1)%model[0].length].z);
      triangles.add(new Triangle(p1, p3, p2));
      triangles.add(new Triangle(p2, p3, p4));
    }
  }
}
void colorChange(int Color) {

  if (Color!=lastColor) {
    color1=random(0, 255);
    color2=random(0, 255);
    color3=random(0, 255);
  }
  lastColor=Color;
  ambientLight(color1, color2, color3, -1, 0, 0);
}
