int margen = 80;

BarChart ventas;

Barra barra1;

void setup() {
  //La ejecución se muestra a pantalla completa
  fullScreen();
  //Se crea un objeto de clase Barchart, que contiene los métodos y tipos necesarios
  ventas = new BarChart();
  ventas.setData(new float[] { 17, 50.5, 30, 40, 10, 33.24, 90.12} );
  ventas.setMinMaxValor(0, 100);
  ventas.setBarGap(10);
  ventas.setBarLabels(new String[] { "Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio"} );    
  //Al descomentar las siguientes líneas pueden probarse los métodos de cambio de color
  /*
  ventas.setBackColour(color(0, 0, 255));
  ventas.setBarColour(color(250, 0, 250));
  ventas.setAxiColour(color(0, 250, 250));
  ventas.setLabelColour(color(255));
  */
}

void draw() {  
  ventas.dibujar(); //<>//
}    
