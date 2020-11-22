PImage stars, tierra, luna, sol;

int  x1, y1;
int x2, y2;
float angulo1;
float angulo2;
float counter=0.0;

void setup() {
  fullScreen();
  //Cargamos las imágenes y definimos el fondo de pantalla.
  stars = loadImage("img/stars.png");
  tierra = loadImage("img/planet_32.png");
  luna = loadImage("img/moon02.png");
  sol = loadImage("img/sun01.png");
  stars.resize(width, height);
  imageMode(CENTER);
}

void draw() {
  background(stars);
  //Imagen del sol, centrada y a tamaño adecuado
  image(sol, width/2, height/2, sol.width/3, sol.height/3);
   
  //Definimos la posición de la tierra según la fórmula para definir elipsis 
  x1 = -50 + width/2 + int(600.0 * cos(radians(angulo1)));
  y1 = height/2 + int(400.0 * sin(radians(angulo1)));
 
  //Definimos la posición de la luna con la misma fórumla y en base a la posición de la tierra que será su centro
  x2 = x1 + int(75.0 * cos(radians(angulo2)));
  y2 = y1 + int(75.0 * sin(radians(angulo2)));
  
  //Imagen de la luna
  image(luna, x2, y2, luna.width/4, luna.height/4);
 
  //Imagen de la tierra, a la que añadimos una rotación sobre su propio eje. Ha sido necesario usar la función translate para evitar colisiones de valor con la rotación.
  translate(x1, y1);
  rotate(-counter*TWO_PI/360);
  image(tierra, 0, 0, tierra.width/16, tierra.height/16);
 
  counter += 2;
  angulo1 += 1;
  angulo2 += 5;
    
}
