PImage fondo, i1, i2, i3, i4, i5, i6, i7, i8;
int ct1= 0;
int ct2= 0;
boolean back = false;

PImage[] animacion;

void setup() {
  fullScreen();
  //Cargamos el fondo y las imágenes de la animación
  fondo = loadImage("cityscene/background.png");
  i1 = loadImage("cityscene/0001.png");
  i2 = loadImage("cityscene/0002.png");
  i3 = loadImage("cityscene/0003.png");
  i4 = loadImage("cityscene/0004.png");
  i5 = loadImage("cityscene/0005.png");
  i6 = loadImage("cityscene/0006.png");
  i7 = loadImage("cityscene/0007.png");
  i8 = loadImage("cityscene/0008.png");
  //metemos las imágenes en un array
  animacion = new PImage[] {i1, i2, i3, i4, i5, i6, i7, i8};
  //ajustamos el tamaño de la imagen de fondo
  fondo.resize(width, height);
  //definimos el ratio de refresco de frames
  frameRate(12);
}

void draw() {
  background(fondo);
  //En este bucle el personaje comienza andando de izquierda a derecha, cuando llega al final de la pantalla se da la vuelta y comienza a andar en sentido contrario. Este bucle se repite indefinidamente
  if(!back){
    //escogemos la imagen del array según el frame actual. Para ello aplicamos el módulo al total de frames por la cantidad de imágenes de nuestro array. Le damos su posicionamiento en x e y. la y será estática.
    image(animacion[frameCount % animacion.length], (-100) + ct1, height/2.1 );
    ct1+=15;
    //LLegado el final de la pantalla, la variable back se activa
    if((-100) + ct1 > width){
      back = true;
    }
  }else{
    pushMatrix();  
    //invertimos la imagen
    scale(-1,1);
    //La hacemos avanzar de nuevo ahora en sentido inverso. Necesitamos contar con que al invertir la imagen, el valor de suma de la posición seguirá siendo positivo.
    image(animacion[frameCount % animacion.length], (-width - 100) + ct2, height/2.1);
    ct2+=15;
    popMatrix();
    //Reiniciamos todo el bucle al volver al comienzo de la pantalla
    if(-width - 100 + ct2 > 0){
      back = false;
      ct1 = 0;
      ct2 = 0;
    }
  }  
    
}
