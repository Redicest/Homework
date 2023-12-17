class Triangle {
  PVector[] triVertex;
  PVector[] contourVertex;
  float contourRatio = 0.25;
  PVector center;
  PVector normal;
  boolean drawShape;
  boolean drawContour;
  
  Triangle(PVector p1, PVector p2, PVector p3) {//传递三角形的三个向量数据
    triVertex = new PVector[3];
    contourVertex = new PVector[triVertex.length];
    triVertex[0] = p1;
    triVertex[1] = p2;
    triVertex[2] = p3;
    center = ct();
    normal = calcuNormal();
    contourVertex = contour();
  }

  void run() {
    if (drawShape) {
      if (drawContour) {
        drawTriangleContour();
      } else {
        drawTriangle();
      }
      if (showNormalLine) {
        displayNormal();
      }
    }
  }

  PVector calcuNormal() {
    PVector p1p2 = PVector.sub(triVertex[1], triVertex[0]);
    PVector p1p3 = PVector.sub(triVertex[2], triVertex[0]);
    PVector norm = p1p2.cross(p1p3);
    return norm;
  }

  PVector[] contour() {
    PVector[] ctmp = new PVector[contourVertex.length];
    for (int i = 0; i < triVertex.length; i ++) {
      PVector tmp = PVector.sub(triVertex[i], center);
      float len = tmp.mag();
      len *= contourRatio;
      tmp.normalize();
      tmp.setMag(len);
      tmp.add(center);
      ctmp[i] = new PVector(tmp.x, tmp.y, tmp.z);
    }
    return ctmp;
  }

  void drawTriangleContour() {
    stroke(0);
    strokeWeight(1);
    fill(255);

    for (int i = 0; i < 3; i ++) {
      beginShape(QUAD);
      vertex(triVertex[i].x, triVertex[i].y, triVertex[i].z);
      vertex(contourVertex[i].x, contourVertex[i].y, contourVertex[i].z);
      vertex(contourVertex[(i+1)%3].x, contourVertex[(i+1)%3].y, contourVertex[(i+1)%3].z);
      vertex(triVertex[(i+1)%3].x, triVertex[(i+1)%3].y, triVertex[(i+1)%3].z);
      endShape();
    }
  }

  void drawTriangle() {
    beginShape(TRIANGLE);
    stroke(0);
    strokeWeight(1);
    fill(255);
    for (int i = 0; i < triVertex.length; i ++) {
      vertex(triVertex[i].x, triVertex[i].y, triVertex[i].z);
    }
    endShape();
  }

  PVector ct() {
    float cx = 0;
    float cy = 0;
    float cz = 0;

    for (int i = 0; i < triVertex.length; i ++) {
      cx += triVertex[i].x;
      cy += triVertex[i].y;
      cz += triVertex[i].z;
    }

    cx /= 3.0;
    cy /= 3.0;
    cz /= 3.0;
    PVector cv = new PVector(cx, cy, cz);

    return cv;
  }

  void displayNormal() {
    PVector nm = new PVector(normal.x, normal.y, normal.z);
    nm.normalize();
    nm.setMag(10);
    nm.add(center);
    stroke(0);
    strokeWeight(3);
    point(center.x, center.y, center.z);
    stroke(200, 0, 200);
    strokeWeight(1);
    line(center.x, center.y, center.z, nm.x, nm.y, nm.z);
  }
}
