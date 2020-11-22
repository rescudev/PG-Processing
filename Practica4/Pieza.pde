
class Pieza {
  PVector pos;
  float tam;
  
  Pieza(float x, float y, float z, float nuevoTam) {
    pos = new PVector(x, y, z);
    tam = nuevoTam;
    
  }
  
  void dibujar() {
    fill(#FF0000);
    stroke(0);
    strokeWeight(6);
    pushMatrix();
    translate(pos.x, pos.y, pos.z);
    box(tam);
    popMatrix();
  }
  
  
}
