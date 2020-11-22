int gap = 0;
float[] valuesBarras;
String[] labels = new String[] { " ", " ", " ", " ", " ", " ", " " };
int reScaledWidth;
int reScaledHeight;
int minValue = 0;
int maxValue = -1;
color backColor = color(0, 0, 0);
color barColor = color(100);
color axisColor = color(255);
color labelColor = color(255);
float[] axisPositions;

class BarChart {
  
  //Creamos un array con un tamaño determinado que contendrá todos los objetos de tipo barra que creemos
  Barra [] barras = new Barra[24];
  
  BarChart(){
  }
  
  //Llamamos a los métodos de dibujo y coloreamos el fondo de pantalla
  void dibujar() {
    background(backColor);
    dibujaBarras();
    dibujaEjes();
  }
  
  //Introducimos los valores de las barras y definimos las variables de reescalado que usaremos en el resto del código
  void setData (float[] nuevosValores){
    valuesBarras = nuevosValores;
    reScaledWidth = width/(valuesBarras.length+2);
    //Al dividir por 110 conseguimos un poco más de espacio por encima del valor máximo 100
    reScaledHeight = (height/110);
  }  
  
  //Método para definir la separación entre barras
  void setBarGap(int newGap){
    if(newGap > 0){
       gap = newGap; 
    }
  }
  
  //Método para definir el máximo y mínimo en las gráficas
  void setMinMaxValor(int min, int max){
    minValue = min;
    maxValue = max;  
  }
  
  //Método para definir los nombres de las barras
  void setBarLabels(String[] nuevosLabels){
    labels = nuevosLabels;
  }
  
  //Método para definir el color del fondo de pantalla
  void setBackColour(color nuevoColor){
    backColor = nuevoColor;
  }
  
  //Método para definir el color de las barras
  void setBarColour(color nuevoColor){
    barColor = nuevoColor;
  }
  
  //Método para definir el color de los ejes
  void setAxiColour(color nuevoColor){
    axisColor = nuevoColor;
  }
  
  //Método para definir el color de los nombres
  void setLabelColour(color nuevoColor){
    labelColor = nuevoColor;
  }
  
  //Método para dibujar las barras
  void dibujaBarras(){
    int posX = 0;
    //Dibujaremos una barra por cada valor que encontremos en el array de valores
    for(int i = 0; i<valuesBarras.length; i++){
      //Creamos cada barra en base al valor y en una posición x que iremos aumentando según avanza el bucle
      Barra barra = new Barra((int)valuesBarras[i], posX, i);
      barras[i] = barra;
      barra.dibujar();
      //Sumamos a la posición x el tamaño relativo del ancho de nuestras barras para posicionar correctamente la siguiente
      posX += reScaledWidth + 5;
      fill(labelColor);  
      //En este mismo método dibujamos los nombres relativos a la barra en cuestión
      textSize(20);
      textAlign(RIGHT, BOTTOM);
      //se dibujan si no superan el valor máximo y tampoco son menores que el valor mínimo
      if(valuesBarras[i]>=minValue && valuesBarras[i]<maxValue){
        //Valor de la barra en el eje y
        text((int)valuesBarras[i]+" ", margen, height - margen - (valuesBarras[i]*reScaledHeight));   
      }
      textAlign(CENTER, TOP);
      //Nombre de la barra en el eje x
      if(labels.length>i){
        text(labels[i], margen + barra.posXinicio + (reScaledWidth/8) , height - margen - (minValue*reScaledHeight));
      }
    }
  }
  
  //Dibujamos los ejes de la gráfica
  void dibujaEjes(){
    stroke(axisColor);
    strokeWeight(4);
    //en caso de no definir un valor máximo, el valor por defecto es -1 y se redefine aquí al valor máximo encontrado en las barras
    if(maxValue<0){
       maxValue = (int)max(valuesBarras);
       //Eje y
       line(margen, height - margen - max(valuesBarras)*reScaledHeight, margen, height - margen);
    }else{
       //eje y. Según el margen, máximo y mínimo definidos
       line(margen, height - margen - maxValue*reScaledHeight, margen, height - margen - (minValue*reScaledHeight));
       //Si se han definido valores máximo y mínimo se dibujan en el eje
       textSize(20);
       textAlign(RIGHT, BOTTOM);
       text(minValue+" ", margen, height - margen - (minValue*reScaledHeight));
       text(maxValue+" ", margen, height - margen - (maxValue*reScaledHeight));
    }
    stroke(axisColor);
    strokeWeight(4);
    //Eje x, según el margen y la cantidad de barras que se van a dibujar
    line(margen, height - margen - (minValue*reScaledHeight), barras[valuesBarras.length - 1].posXinicio + reScaledWidth , height - margen - (minValue*reScaledHeight));
  }
  
} 

//La clase de tipo Barra
class Barra {
  
  int valorBarra;
  int posXextra;
  int barId;
  float posXinicio;
  float posYinicio;
  
  //Constructor de las barras
  Barra(int valor, int posX, int identificador){ 
    //Valor de las barras, se reescala para mostrar según el tamaño de la pantalla
    valorBarra = (valor-minValue) * reScaledHeight;
    if(valorBarra>(maxValue*reScaledHeight)){
      valorBarra = (maxValue*reScaledHeight);
    }
    //atributos de cada barra. Su identificador, posición inicial de dibujo y el offset de posición en el eje x
    barId = identificador;
    posXextra = posX;
    posXinicio = margen + 10 + posXextra + barId*gap;
    posYinicio = height - margen - valorBarra - 10  - (minValue*reScaledHeight);
  }
  
  //Método que devuelve true cuando el ratón se posiciona encima de la barra
  boolean RatonEnBarra() {
    boolean resultado = false;
    if(mouseX > posXinicio && mouseX < posXinicio + reScaledWidth){
      if(mouseY > posYinicio && mouseY < posYinicio + valorBarra){
        resultado = true;
      }
    }
    return resultado;
  }
  
  //Método propio de la barra para ser dibujada
  void dibujar(){
    noStroke(); 
    //Si el ratón está encima de la barra, resaltamos su color y mostramos encima de ella su valor
    if(RatonEnBarra()){          
      textSize(20);
      textAlign(CENTER, BOTTOM);
      fill(255);  
      //valor de la barra, float redondeado a dos decimales
      text(nf(valuesBarras[this.barId], 2, 2), margen + this.posXinicio + (reScaledWidth/8), height - margen - this.valorBarra - 20 - (minValue*reScaledHeight));
      fill(255, 0, 0);
    }else{
      //color de la barra
      fill(barColor);
    } //<>//
    if(valorBarra>0){
      //Dibujamos la barra directamente con los valores correctos definidos anteriormente
      rect(posXinicio, posYinicio, reScaledWidth, valorBarra);
    }      
  }
}
