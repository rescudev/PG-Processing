int margen = 60;
int valor1 = 100;

BarChart ventas;

Barra barra1;

void setup() {
  //size(1080, 720);
  fullScreen();
  ventas = new BarChart();
  ventas.setData(new float[] { 17, 50.5, 30, 40, 10, 33.24, 90.12} );
  ventas.setMinMaxValor(0, 100);
  ventas.setBarGap(10);
}

void draw() {
  background(0);  
  ventas.dibujar(); //<>//
  
}
