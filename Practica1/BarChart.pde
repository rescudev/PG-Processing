int gap = 0;
float[] valuesBarras;
String[] labels = new String[] { " ", " ", " ", " ", " ", " ", " " };
int reScaledWidth;
int reScaledHeight;
int minValue = -1;
int maxValue = -1;
color backColor = color(0, 0, 0);
color barColor = color(100);
color axisColor = color(255);
color labelColor = color(255);
float[] axisPositions;

class BarChart {
  
  Barra [] barras = new Barra[24];
  
  BarChart(){
  }
  
  void dibujar() {
    background(backColor);
    noStroke();
    dibujaBarras();
    dibujaEjes();
  }
  
  void setData (float[] nuevosValores){
    valuesBarras = nuevosValores;
    reScaledWidth = width/(valuesBarras.length+2);
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
  }
  
  void setBarLabels(String[] nuevosLabels){
    labels = nuevosLabels;
  }
  
  void setBackColour(color nuevoColor){
    backColor = nuevoColor;
  }
  
  void setBarColour(color nuevoColor){
    barColor = nuevoColor;
  }
  
  void setAxiColour(color nuevoColor){
    axisColor = nuevoColor;
  }
  
  void setLabelColour(color nuevoColor){
    labelColor = nuevoColor;
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
      textAlign(CENTER, TOP);
      text(labels[i], margen + barra.posXinicio + (reScaledWidth/8) , height - margen);
    }
  }
  
  void dibujaEjes(){
    stroke(axisColor);
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
    
    stroke(axisColor);
    strokeWeight(4);
    line(margen, height - margen, barras[valuesBarras.length - 1].posXinicio + reScaledWidth , height - margen);

  }
  
} 

class Barra {
  
  int valorBarra;
  int posXextra;
  int barId;
  float posXinicio;
  float posYinicio;
  
  Barra(int valor, int posX, int identificador){ 
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
        textSize(20);
        textAlign(CENTER, BOTTOM);
        fill(255);  
        text(valuesBarras[this.barId], margen + this.posXinicio + (reScaledWidth/8), height - margen - this.valorBarra - 20);
        fill(255, 0, 0);
      }else{
        fill(barColor);
      } //<>//
      rect(posXinicio, posYinicio , reScaledWidth, valorBarra);
  }
}
