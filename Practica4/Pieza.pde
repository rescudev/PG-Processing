//La clase pieza de las cuales está conformado el cubo
class Pieza {
  PVector pos;
  float tam;
  //Constructor de la pieza según un punto tridimensional y el tamaño deseado
  Pieza(float x, float y, float z, float nuevoTam) {
    pos = new PVector(x, y, z);
    tam = nuevoTam;
    
  }
  
  void dibujar() {
    //Dibujamos una pieza de tipo cubo en la posición de la pieza y le agregamos valores como el grosor de línea
    fill(#FF0000);
    stroke(0);
    strokeWeight(6);
    pushMatrix();
    translate(pos.x, pos.y, pos.z);
    box(tam);
    popMatrix();
  }
  
  
}
