// Juego de la vida creado por  Juan Wilches  (MadLies) 

// He tomado como guia el Sketch de guillermo (https://openprocessing.org/user/11821?view=sketches)
// Gracias a esto me he basado para darle solcuion la matriz de tal manera que los laterales de la matriz puedan ser tratados como un toroide
// He tomado guia del video de Dot CSV (https://www.youtube.com/watch?v=qPtKv9fSHZY&t=39s)
// Con ayuda de esto se han podido aplicar conceptos basicos al programa 


// Comandos (minuscula y mayuscula)
// Dar click derecho sobre el juego para activar la interacción 
// z para vaciar
// x para rellenar
// c para pausar
// click sobre alguna celula para encenderla o apagarla
// Flecha izqierda reduce la velocidad 
// Flecha derecha aumenta la velocidad
// q para cambiar el color de las celulas a rojo
// w para cambiar el color de las celulas a verde
// e para cambiar el color de las celulas a azul
// r para cambiar el color de las celulas a blanco
// 1 para generar el patron "Blinker"
// 2 para generar el patron "Rana"
// 3 para generar el patron "Baliza"
// 4 para generar el patron "Pulpo"
// 5 para generar el patron "Pentadecatlon"
// 6 para generar el patron "Planeador"
// 7 para generar el patron "Mini-nave"
// 8 para generar el patron "Nave tamaño familiar"
// 9 para generar el patron "Pan"
// 0 para generar el patron "Bote"

// nota 
// si se quiere cambiar el tamaño  de las celdas y  la cantidad  de celdas 
// se debe cambiar el tamaño de la pestaña bajo  la siguente formula:
// (T*(L+1))-1


// cantidad de celdas por lado
int T = 30 ;
// tamaño de cada lado de cada celda 
int L  = 20;
int[][] gol = new int [T][T];
int[][] toriode = new int [T+2][T+2];
boolean comandosT = false;
int random = 1 ;
int velocidad = 10; 
color  col =  color(255);
void setup(){

size(629,629);

noStroke();
celulasram(random);
//controlar velociad
frameRate(velocidad);

}

void draw(){

  
  

  
if (comandosT == true ){ 
background(150);

celulas();

}
else {
 celulas(); 
 poscion_cel(); 
}
}

void celulas(){
  
 for (int x=0; x<T; x++){
   for (int y=0; y<T ; y++){
      if (gol[x][y]==1){
      fill(col);}
      else {
      fill(0);
      }
      rect((L+1)*x,(L+1)*y,L,L) ;
      
   }
 }  
}

void poscion_cel(){
  
   for (int x = 0; x<T ; x++){
    for (int y = 0; y<T ; y++){
      toriode[x+1][y+1] = gol[x][y];
    }
   }
  for (int x = 0; x<T; x++ ){
    toriode[x+1][0] = gol [x][T-1];
    toriode[x+1][T+1] = gol[x][0];
  }
  for (int y = 0;  y<T; y++ ){
   toriode[0][y+1] = gol[T-1][y];
    toriode[T+1][y+1] = gol[0][y];
  }
  toriode[0][0] = gol[T-1][T-1];
  toriode[0][T+1] = gol[T-1][0];
  toriode[T+1][0] = gol[0][T-1];
 toriode[T+1][T+1] = gol[0][0];
  
  int cel_vivas = 0;
 
  for (int x=0; x<T; x++) {
    for (int y=0; y<T; y++) {
      cel_vivas = toriode[x][y] + toriode[x+1][y] + toriode[x+2][y] + toriode[x][y+1] + toriode[x+2][y+1] + toriode[x][y+2] + toriode[x+1][y+2] + toriode[x+2][y+2]; 
      // la posicion esfera[x+1][y+1] es el equivalente a la posición gof[x][y] 
       if (gol[x][y] == 0 && cel_vivas == 3) {
        gol[x][y] = 1;
      }
      else if (gol[x][y] == 1 && (cel_vivas < 2 || cel_vivas > 3)) {
        gol[x][y] = 0;
      }
    }
  }
}  

 



void celulasram(int  random ){
// limpiar  
if (random ==0)  {
  for (int i=0; i<T; i++) {
    for (int j=0; j<T; j++) {
      gol[i][j] = 0;
    }
  }
}
// aleatorio
if (random == 1 ) {
 for (int i=0; i<T; i++) {
    for (int j=0; j<T; j++) {
      gol[i][j] = int(random(2));
    }
  } 
}
// llenar
if (random == 2 ) {
 for (int i=0; i<T; i++) {
    for (int j=0; j<T; j++) {
      gol[i][j] = 1;
    }
  } 
}
// blinker
if (random == 3 ) {
  for (int i=0; i<T; i++) {
    for (int j=0; j<T; j++) {
      gol[i][j] = 0;
    }
  }
   gol [int((T-1)/2)][int((T-1)/2)] = 1;
   gol [int((T-1)/2)][int((T-1)/2)+1] = 1;
     gol [int((T-1)/2)][int((T-1)/2)-1] = 1;
    }
// rana    
if (random == 4 ) {
  for (int i=0; i<T; i++) {
    for (int j=0; j<T; j++) {
      gol[i][j] = 0;
    }
  }
   gol [int((T-1)/2)][int((T-1)/2)] = 1;
   gol [int((T-1)/2)][int((T-1)/2)+1] = 1;
   gol [int((T-1)/2)+1][int((T-1)/2)] = 1;
   gol [int((T-1)/2)+1][int((T-1)/2)+1] = 1;
   gol [int((T-1)/2)-1][int((T-1)/2)+1] = 1;
   gol [int((T-1)/2)+2][int((T-1)/2)] = 1;
    } 
// baliza        
if (random == 5 ) {
  for (int i=0; i<T; i++) {
    for (int j=0; j<T; j++) {
      gol[i][j] = 0;
    }
  }
   gol [int((T-1)/2)-1][int((T-1)/2)-1] = 1;
   gol [int((T-1)/2)][int((T-1)/2)-1] = 1;
   gol [int((T-1)/2)-1][int((T-1)/2)] = 1;
   gol [int((T-1)/2)][int((T-1)/2)] = 1;
   gol [int((T-1)/2)+2][int((T-1)/2)+2] = 1;
   gol [int((T-1)/2)+1][int((T-1)/2)+2] = 1;
   gol [int((T-1)/2)+2][int((T-1)/2)+1] = 1;
   gol [int((T-1)/2)+1][int((T-1)/2)+1] = 1;
    }

// pulpo 
if (random == 6 ) {
  for (int i=0; i<T; i++) {
    for (int j=0; j<T; j++) {
      gol[i][j] = 0;
    }
  }
   gol [int((T-1)/2)-2][int((T-1)/2)-1] = 1;
   gol [int((T-1)/2)-3][int((T-1)/2)-1] = 1;
   gol [int((T-1)/2)-4][int((T-1)/2)-1] = 1;
   gol [int((T-1)/2)-2][int((T-1)/2)+1] = 1;
   gol [int((T-1)/2)-3][int((T-1)/2)+1] = 1;
   gol [int((T-1)/2)-4][int((T-1)/2)+1] = 1;
   gol [int((T-1)/2)-1][int((T-1)/2)-2] = 1;
   gol [int((T-1)/2)-1][int((T-1)/2)-3] = 1;
   gol [int((T-1)/2)-1][int((T-1)/2)-4] = 1;
   gol [int((T-1)/2)+1][int((T-1)/2)-2] = 1;
   gol [int((T-1)/2)+1][int((T-1)/2)-3] = 1;
   gol [int((T-1)/2)+1][int((T-1)/2)-4] = 1;
   //
   gol [int((T-1)/2)+2][int((T-1)/2)-1] = 1;
   gol [int((T-1)/2)+3][int((T-1)/2)-1] = 1;
   gol [int((T-1)/2)+4][int((T-1)/2)-1] = 1;
   gol [int((T-1)/2)+2][int((T-1)/2)+1] = 1;
   gol [int((T-1)/2)+3][int((T-1)/2)+1] = 1;
   gol [int((T-1)/2)+4][int((T-1)/2)+1] = 1;
   gol [int((T-1)/2)-1][int((T-1)/2)+2] = 1;
   gol [int((T-1)/2)-1][int((T-1)/2)+3] = 1;
   gol [int((T-1)/2)-1][int((T-1)/2)+4] = 1;
   gol [int((T-1)/2)+1][int((T-1)/2)+2] = 1;
   gol [int((T-1)/2)+1][int((T-1)/2)+3] = 1;
   gol [int((T-1)/2)+1][int((T-1)/2)+4] = 1;
   //
   gol [int((T-1)/2)-2][int((T-1)/2)-6] = 1;
   gol [int((T-1)/2)-3][int((T-1)/2)-6] = 1;
   gol [int((T-1)/2)-4][int((T-1)/2)-6] = 1;
   gol [int((T-1)/2)-2][int((T-1)/2)+6] = 1;
   gol [int((T-1)/2)-3][int((T-1)/2)+6] = 1;
   gol [int((T-1)/2)-4][int((T-1)/2)+6] = 1;
   gol [int((T-1)/2)-6][int((T-1)/2)-2] = 1;
   gol [int((T-1)/2)-6][int((T-1)/2)-3] = 1;
   gol [int((T-1)/2)-6][int((T-1)/2)-4] = 1;
   gol [int((T-1)/2)+6][int((T-1)/2)-2] = 1;
   gol [int((T-1)/2)+6][int((T-1)/2)-3] = 1;
   gol [int((T-1)/2)+6][int((T-1)/2)-4] = 1;
   //
   gol [int((T-1)/2)+2][int((T-1)/2)-6] = 1;
   gol [int((T-1)/2)+3][int((T-1)/2)-6] = 1;
   gol [int((T-1)/2)+4][int((T-1)/2)-6] = 1;
   gol [int((T-1)/2)+2][int((T-1)/2)+6] = 1;
   gol [int((T-1)/2)+3][int((T-1)/2)+6] = 1;
   gol [int((T-1)/2)+4][int((T-1)/2)+6] = 1;
   gol [int((T-1)/2)-6][int((T-1)/2)+2] = 1;
   gol [int((T-1)/2)-6][int((T-1)/2)+3] = 1;
   gol [int((T-1)/2)-6][int((T-1)/2)+4] = 1;
   gol [int((T-1)/2)+6][int((T-1)/2)+2] = 1;
   gol [int((T-1)/2)+6][int((T-1)/2)+3] = 1;
   gol [int((T-1)/2)+6][int((T-1)/2)+4] = 1;
    
    }
    
    
// penta decatlón    
  if (random == 7) {
  for (int i=0; i<T; i++) {
    for (int j=0; j<T; j++) {
      gol[i][j] = 0;
    }
  }
   gol [int((T-1)/2)][int((T-1)/2)] = 1;
   gol [int((T-1)/2)][int((T-1)/2)-1] = 1;
   gol [int((T-1)/2)][int((T-1)/2)-2] = 1;
   gol [int((T-1)/2)+1][int((T-1)/2)-3] = 1;
   gol [int((T-1)/2)-1][int((T-1)/2)-3] = 1;
   gol [int((T-1)/2)][int((T-1)/2)-4] = 1;
   gol [int((T-1)/2)][int((T-1)/2)-5] = 1;
   gol [int((T-1)/2)][int((T-1)/2)+1] = 1;
   gol [int((T-1)/2)+1][int((T-1)/2)+2] = 1;
   gol [int((T-1)/2)-1][int((T-1)/2)+2] = 1;
   gol [int((T-1)/2)][int((T-1)/2)+3] = 1;
   gol [int((T-1)/2)][int((T-1)/2)+4] = 1;
  }
  
  
  
//planeador  
 if (random == 8) {
  for (int i=0; i<T; i++) {
    for (int j=0; j<T; j++) {
      gol[i][j] = 0;
    }
  }
   gol [int((T-1)/2)][int((T-1)/2)-1] = 1;  
  gol [int((T-1)/2)+1][int((T-1)/2)] = 1;  
  gol [int((T-1)/2)-1][int((T-1)/2)+1] = 1; 
  gol [int((T-1)/2)][int((T-1)/2)+1] = 1;  
  gol [int((T-1)/2)+1][int((T-1)/2)+1] = 1;  
 }
 
// nave espacial mini  
if (random == 9) {
  for (int i=0; i<T; i++) {
    for (int j=0; j<T; j++) {
      gol[i][j] = 0;
    }
  }
   gol [int((T-1)/2)-2][int((T-1)/2)-1] = 1;  
gol [int((T-1)/2)+1][int((T-1)/2)-1] = 1;  
gol [int((T-1)/2)+2][int((T-1)/2)] = 1;  
gol [int((T-1)/2)-2][int((T-1)/2)+1] = 1;  
gol [int((T-1)/2)+2][int((T-1)/2)+1] = 1;  
gol [int((T-1)/2)-1][int((T-1)/2)+2] = 1;  
gol [int((T-1)/2)][int((T-1)/2)+2] = 1;  
gol [int((T-1)/2)+1][int((T-1)/2)+2] = 1;  
gol [int((T-1)/2)+2][int((T-1)/2)+2] = 1;  
}

// nave espacial tamaño familiar
if (random == 10) {
  for (int i=0; i<T; i++) {
    for (int j=0; j<T; j++) {
      gol[i][j] = 0;
    }
  }
   gol [int((T-1)/2)-1][int((T-1)/2)-2] = 1;  
   gol [int((T-1)/2)][int((T-1)/2)-2] = 1;  
   gol [int((T-1)/2)-3][int((T-1)/2)-1] = 1;  
   gol [int((T-1)/2)+2][int((T-1)/2)-1] = 1;  
   gol [int((T-1)/2)+3][int((T-1)/2)] = 1;  
   gol [int((T-1)/2)-3][int((T-1)/2)+1] = 1;  
   gol [int((T-1)/2)+3][int((T-1)/2)+1] = 1;  
   gol [int((T-1)/2)-2][int((T-1)/2)+2] = 1;  
   gol [int((T-1)/2)-1][int((T-1)/2)+2] = 1;  
   gol [int((T-1)/2)][int((T-1)/2)+2] = 1;  
   gol [int((T-1)/2)+1][int((T-1)/2)+2] = 1;  
   gol [int((T-1)/2)+2][int((T-1)/2)+2] = 1;  
   gol [int((T-1)/2)+3][int((T-1)/2)+2] = 1;  
   
   
   
}

// Pan
if (random == 11) {
  for (int i=0; i<T; i++) {
    for (int j=0; j<T; j++) {
      gol[i][j] = 0;
    }
  }
   gol [int((T-1)/2)][int((T-1)/2)] = 1;
   gol [int((T-1)/2)+1][int((T-1)/2)] = 1;
   gol [int((T-1)/2)-1][int((T-1)/2)+1] = 1;
   gol [int((T-1)/2)+2][int((T-1)/2)+1] = 1;
   gol [int((T-1)/2)][int((T-1)/2)+2] = 1;
   gol [int((T-1)/2)+2][int((T-1)/2)+2] = 1;
   gol [int((T-1)/2)+1][int((T-1)/2)+3] = 1;
          
 
   
}

// bote
if (random == 12) {
  for (int i=0; i<T; i++) {
    for (int j=0; j<T; j++) {
      gol[i][j] = 0;
    }
  }
   gol [int((T-1)/2)][int((T-1)/2)] = 1;
   gol [int((T-1)/2)+1][int((T-1)/2)] = 1;
   gol [int((T-1)/2)][int((T-1)/2)+1] = 1;
   gol [int((T-1)/2)+2][int((T-1)/2)+1] = 1;
   gol [int((T-1)/2)+1][int((T-1)/2)+2] = 1;
   

}
}


void mouseClicked(){
  if (mouseButton == LEFT){
    int x = int(mouseX/(L+1));
    int y = int(mouseY/(L+1));
    gol[x][y] = 1-gol[x][y];
  }
}

void keyPressed() {
  if (key == 'z' ||key == 'Z' ){
    celulasram(0 );
  }
 if (key == 'x'||key == 'X'  ){
    celulasram(1);
    
  }
 if  (key == 'a'||key == 'A'  ){
    celulasram(2);
    
  }
if  (key == '1'  ){
    celulasram(3);
    
  }
if  (key == '2' ){
    celulasram(4);
}    
if  (key == '3' ){
    celulasram(5);    
    
  }  
if  (key == '4' ){
    celulasram(6);    
    
  }   
if  (key == '5' ){
    celulasram(7);    
    
  }
  
if  (key == '6' ){
    celulasram(8);    
    
  }  
  
if  (key == '7' ){
    celulasram(9);    
    
  }    

if  (key == '8' ){
    celulasram(10);    
    
  }    
if  (key == '9' ){
    celulasram(11);    
    
  }    
if  (key == '0' ){
    celulasram(12);          
}
if (keyCode == LEFT){
 velocidad -= 2;
  frameRate(velocidad);
  
}
if (velocidad <=2 ){
 
  velocidad = 3;
}
if (keyCode == RIGHT){
  
 velocidad +=2; 
 frameRate(velocidad);
}

if  (key == 'q'||key == 'Q' ){
 col = color(255,0,0); 
}

if  (key == 'w' ||key == 'W' ){
 col = color(0,255,0); 
}
if  (key == 'e'||key == 'E' ){
 col = color(0,0,255); 
}
if  (key == 'r'||key == 'R' ){
 col = color(255); 
}
 if (key == 'c'||key == 'C'  ) {
    if (comandosT == true) {
      comandosT = false;
    }
    else {
      comandosT = true;
    }
  }
}
