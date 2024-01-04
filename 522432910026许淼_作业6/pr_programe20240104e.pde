class Particle{
  //eccential elements
  PVector position;
  color col;
  //other
  float incr;
  float angle;
  
  Particle(){
    position = new PVector(random(width), random(height));
    float adj = map(position.x, 0, width, 0, 255);
    col = color(255, adj, 255);
  }
  
  public void update(){
    incr += 0.001;
    angle = noise(position.x * 0.006, position.y * 0.004, incr) * PI ;
    position.x += 2 * cos(angle);
    position.y += 2 * sin(angle);
}
  
  public void boundaryDetect(){
    if (position.x <= 0)position.x = width - 1;
    if (position.x >= width)position.x = 0;
    if (position.y <= 0)position.y = height - 1;
    if (position.y >= height)position.y = 0;
  }
  
  public void display(){
    pixels[(int)position.x + (int)position.y * width] = col;
  }
}
