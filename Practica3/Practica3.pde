PImage stars, tierra, luna, sol;

int  x1, y1;
int x2, y2;
float angulo1;
float angulo2;
float counter=0.0;

void setup() {
  fullScreen();
  stars = loadImage("img/stars.png");
  tierra = loadImage("img/planet_32.png");
  luna = loadImage("img/moon02.png");
  sol = loadImage("img/sun01.png");
  stars.resize(width, height);
  imageMode(CENTER);
}

void draw() {
  background(stars);
  image(sol, width/2, height/2, sol.width/3, sol.height/3);
   
  x1 = -50 + width/2 + int(600.0 * cos(radians(angulo1)));
  y1 = height/2 + int(400.0 * sin(radians(angulo1)));
 
  x2 = x1 + int(75.0 * cos(radians(angulo2)));
  y2 = y1 + int(75.0 * sin(radians(angulo2)));
 
  image(luna, x2, y2, luna.width/4, luna.height/4);
 
  translate(x1, y1);
  rotate(-counter*TWO_PI/360);
  image(tierra, 0, 0, tierra.width/16, tierra.height/16);
 
  counter += 2;
  angulo1 += 1;
  angulo2 += 5;
    
}
