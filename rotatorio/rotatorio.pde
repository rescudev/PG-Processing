int  x1, y1;
float angulo1;
int x2, y2;
float angulo2;

void setup() {
  fullScreen();
  angulo1 = 0.0;
  angulo2 = 0.0;
}

void draw() {
  background(0);
  
  x1 = width/2 + int(300.0 * cos(radians(angulo1)));
  y1 = height/2 + int(300.0 * sin(radians(angulo1)));
  
  fill (255, 0, 0);
  ellipse(x1, y1, 100, 100);
  
  angulo1 += 1;
  
  x2 = x1 + int(100.0 * cos(radians(angulo1)));
  y2 = y1 + int(100.0 * sin(radians(angulo1)));
  
  fill (0, 255, 0);
  ellipse(x2, y2, 30, 30);
  
  angulo2 += 3;
  
}
