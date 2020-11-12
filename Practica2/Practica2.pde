PImage fondo, i1, i2, i3, i4, i5, i6, i7, i8;
int ct1= 0;
int ct2= 0;
boolean back = false;

PImage[] animacion;

void setup() {
  fullScreen();
  fondo = loadImage("cityscene/background.png");
  i1 = loadImage("cityscene/0001.png");
  i2 = loadImage("cityscene/0002.png");
  i3 = loadImage("cityscene/0003.png");
  i4 = loadImage("cityscene/0004.png");
  i5 = loadImage("cityscene/0005.png");
  i6 = loadImage("cityscene/0006.png");
  i7 = loadImage("cityscene/0007.png");
  i8 = loadImage("cityscene/0008.png");
  animacion = new PImage[] {i1, i2, i3, i4, i5, i6, i7, i8};
  fondo.resize(width, height);
  frameRate(12);
}

void draw() {
  background(fondo);

  if(!back){
    image(animacion[frameCount % animacion.length], (-100) + ct1, height/2.1 );
    ct1+=15;
    if((-100) + ct1 > width){
      back = true;
    }
  }else{
    pushMatrix();  
    scale(-1,1);
    image(animacion[frameCount % animacion.length], (-width - 100) + ct2, height/2.1);
    ct2+=15;
    popMatrix();
    if(-width - 100 + ct2 > 0){
      back = false;
      ct1 = 0;
      ct2 = 0;
    }
  }  
    
}
