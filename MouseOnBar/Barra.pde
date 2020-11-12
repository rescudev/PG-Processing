class Barra {
  
  color color_barra;
  
  Barra(){
    color_barra = color(200, 0, 0);
  }
  
  boolean RatonEnBarra() {
    boolean resultado = false;
    if(mouseX > 10 && mouseX < 60){
      if(mouseY > (height - 100 - 10) && mouseY < (height - 10)){
        resultado = true;
      }
    }
    return resultado;
  }
  
  void dibujar() {
    noStroke();
    if(RatonEnBarra()){
      fill(0);
    }else{
      fill(color_barra);
    }
    rect(10, height - 100 - 10, 50, 100);
  }
  
}  
