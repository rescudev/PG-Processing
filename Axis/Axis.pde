int margen = 40;

EjeX eje_x;
EjeY eje_y;

void setup() {
  size(1024, 860);
  
  eje_x = new EjeX();
  eje_y = new EjeY();
}
 
void draw() {
  
  background(0);
  
  fill(200, 0, 0);
  rect(0, 0, 300, 300);
  
  eje_x.dibujar();  
  eje_y.dibujar();  
  
  textSize(24);
  textAlign(CENTER, TOP);
  text("(0, 0)", margen, height - margen);
}

class EjeX {
  EjeX(){ 
  }
  
  void dibujar(){
  stroke(255);
  strokeWeight(4);
  line(margen, margen, margen, height - margen);
  }
}

class EjeY {
  EjeY(){ 
  }
  
  void dibujar(){
  stroke(255);
  strokeWeight(4);
  line(margen, height - margen, width - margen, height - margen);
  }
}
