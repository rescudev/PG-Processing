PImage fondo;

void setup() {
  fullScreen();
  fondo = loadImage("fondo.png");
  fondo.resize(width, height);
  frameRate(30);
}

void draw() {
  background(fondo);
}
