import peasy.*;
PeasyCam cam;
float rotX, rotY;
float tam = 50;
int dim = 3;
float corrigePos = (dim - 1) * tam * 0.5;

Pieza[][][] cubo = new Pieza[dim][dim][dim];

void setup(){
   size(1200, 800, P3D);
   //cam = new PeasyCam(this, 500);
   for(int i=0; i<dim; i++){
     for(int j=0; j<dim; j++){
       for(int k=0; k<dim; k++){
         float x = tam*i - corrigePos;
         float y = tam*j - corrigePos;
         float z = tam*k - corrigePos;
         cubo[i][j][k] = new Pieza( x, y, z, tam);
       }
     }
   }  
}

void draw(){  
   background(0);
   translate(width/2, height/2); 
   rotateY(rotY);
   rotateX(rotX); 
   for(int i=0; i<dim; i++){
     for(int j=0; j<dim; j++){
       for(int k=0; k<dim; k++){
         cubo[i][j][k].dibujar();
       }
     }
   } 
}

void mouseDragged(){
   float vel = 0.01;
   rotX += (pmouseY-mouseY) * vel;
   rotY += (mouseX-pmouseX) * vel;
}
