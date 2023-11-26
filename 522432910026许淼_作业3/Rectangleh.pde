class Rectangle {//矩形 属性：大小，颜色类型，边缘厚度，伸缩速度, 边缘暂停， 碰撞变色
  float rX, rY;
  float len, wid;
  color fC;
  float colorValue;
  int colorType;
  
  float strokeValue;
  int strokeType;
  
  float expendSpeed;
  float moveSpeed;

  Rectangle(float x, float y, float d1, float d2, float s) {
    rX=x;
    rY=y;
    len=d1;
    wid=d2;
    
    s=1;
    expendSpeed=s;
    moveSpeed=s/2;
    
    colorValue=random(4);
    colorType=floor(colorValue);
    switch (colorType) {
    case 0:
      fC=color(255, 0, 0);
      break;
    case 1:
      fC=color(255, 225, 0);
      break;
    case 2:
      fC=color(0, 0, 225);
      break;
    case 3:
      fC=color(255, 255, 255);
    }
    
    strokeValue=random(1);
    strokeType=floor(strokeValue);
    switch (strokeType){
    case 0:
    strokeWeight(8);
    break;
    case 1:
    strokeWeight(4);
    }
  }
  void show() {
    fill(fC);
    rect(rX, rY, len, wid);
  }//显示函数

  void expend() {
    len+=expendSpeed;
    wid+=expendSpeed;
  }//扩张函数

  void move() {
    rX-=moveSpeed;
    rY-=moveSpeed;
  }

  void edge() {
    if (rX<2||rX+len>width-2||rY<2||rY+wid>height-2) {
      moveSpeed=0;
      expendSpeed=0;
    }
  }

  void interaction() {
    for (int i=0; i<ret.size(); ++i) {
      Rectangle other=(Rectangle)ret.get(i);
      if (rX<other.rX) {
        fill(color(0, 0, 0));
      }
    }
    //  for(Rectangle other:theRectangle){
    //    }

    //  }
  }
}
