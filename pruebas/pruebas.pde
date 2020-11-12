int margen = 40;

void setup() {
  size(1024, 860);
  //frameRate(60);
}
 
void draw() {
  
  background(0);
  
  //fill(255, 255, 255);
  //rectMode(CENTER);
  //rect(width/2, height/2, 50, 50);
  //rect(mouseX, mouseY, 50, 50);
  
  stroke(255);
  strokeWeight(4);
  
  //variables line(x0, y0, x1, y1)
  //line(0, 0, 100, 100);
  line(margen, margen, margen, height - margen);
  line(margen, height - margen, width - margen, height - margen);
  
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
