import peasy.*;
PeasyCam cam;
float rotX, rotY;
float tam = 50;
int dim = 3;
//Para posicionar correctamente las piezas
float corrigePos = (dim - 1) * tam * 0.5;

//En este array de 3 dimensiones guardaremos las piezas del cubo en orden
Pieza[][][] cubo = new Pieza[dim][dim][dim];

void setup(){
   size(1200, 800, P3D);
   //Podríamos usar la librería peasy de processing, que nos permite definir fácilmente una cámara. En este ejemplo se escrito de forma manual pero se deja comentado el uso de la librería como ejemplo.
   //cam = new PeasyCam(this, 500);
   //Creamos una pieza por cada posición existente mediante un bucle anidado.
   for(int i=0; i<dim; i++){
     for(int j=0; j<dim; j++){
       for(int k=0; k<dim; k++){
         //Definimos los valores de los puntos tridimensionales teniendo en cuenta la corrección de tamaño de las piezas y construimos la pieza.
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
   //Centramos el cubo
   translate(width/2, height/2); 
   //Lo rotamos según arrastramos con el ratón
   rotateY(rotY);
   rotateX(rotX); 
   //Dibujamos cada pieza del cubo
   for(int i=0; i<dim; i++){
     for(int j=0; j<dim; j++){
       for(int k=0; k<dim; k++){
         cubo[i][j][k].dibujar();
       }
     }
   } 
}

//Definimos el punto de rotación en base al ratón siendo arrastrado
void mouseDragged(){
   float vel = 0.01;
   rotX += (pmouseY-mouseY) * vel;
   rotY += (mouseX-pmouseX) * vel;
}
