int gap = 0;
float[] valuesBarras;
int reScaledWidth;
int reScaledHeight;
int minValue = -1;
int maxValue = -1;

class BarChart {
  
  Barra [] barras = new Barra[50];
  
  BarChart(){
  }
  
  void dibujar() {
    noStroke();
    dibujaBarras();
    dibujaEjes();
  }
  
  void setData (float[] nuevosValores){
    valuesBarras = nuevosValores;
    reScaledWidth = width/(valuesBarras.length+1);
    reScaledHeight = (height/110);
  }  
  
  void setBarGap(int newGap){
    if(newGap > 0){
       gap = newGap; 
    }
  }
  
  void setMinMaxValor(int min, int max){
    minValue = min;
    maxValue = max;
    fill(255);  
  }
  
  void dibujaBarras(){
    int posX = 0;
    for(int i = 0; i<valuesBarras.length; i++){
      Barra barra = new Barra((int)valuesBarras[i], posX, i);
      barras[i] = barra;
      barra.dibujar();
      posX += reScaledWidth + 5;
      fill(255);  
      textSize(20);
      textAlign(RIGHT, BOTTOM);
      text((int)valuesBarras[i]+" ", margen, height - margen - (valuesBarras[i]*reScaledHeight));
    }
  }
  
  void dibujaEjes(){
    stroke(255);
    strokeWeight(4);
    if(maxValue<0){
       line(margen, height - margen - max(valuesBarras)*reScaledHeight, margen, height - margen);
    }else{
       line(margen, height - margen - maxValue*reScaledHeight, margen, height - margen);
       textSize(20);
       textAlign(RIGHT, BOTTOM);
       text(minValue+" ", margen, height - margen - (minValue*reScaledHeight));
       text(maxValue+" ", margen, height - margen - (maxValue*reScaledHeight));
    }
    
    stroke(255);
    strokeWeight(4);
    line(margen, height - margen, barras[valuesBarras.length - 1].posXinicio + (width/(valuesBarras.length+1)) , height - margen);

  }
  
} 

class Barra {
  
  color color_barra;
  int valorBarra;
  int posXextra;
  int barId;
  float posXinicio;
  float posYinicio;
  
  Barra(int valor, int posX, int identificador){ 
    color_barra = color(100);
    valorBarra = valor * reScaledHeight;
    barId = identificador;
    posXextra = posX;
    posXinicio = margen + 10 + posXextra + barId*gap;
    posYinicio = height - margen - valorBarra - 10;
  }
  
  boolean RatonEnBarra() {
    boolean resultado = false;
    if(mouseX > posXinicio && mouseX < posXinicio + reScaledWidth){
      if(mouseY > posYinicio && mouseY < posYinicio + valorBarra){
        resultado = true;
      }
    }
    return resultado;
  }
  
  void dibujar(){
    noStroke(); 
      if(RatonEnBarra()){
        fill(255, 0, 0);
      }else{
        fill(color_barra);
      } //<>//
      rect(posXinicio, posYinicio , reScaledWidth, valorBarra);
  }
}
