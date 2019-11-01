//declaramos las variables
//paleta1
int posXp1 = 10;
int posYp1 = 200;
int sizeP1 = 40;
//paleta2
int posXp2 = 380;
int posYp2 = 200;
int sizeP2 = 40;
//pelota
int radio = 20;
float posXpel = 200;
float posYpel = 100;
float vel = 2;
float dirXpel = 1;
float dirYpel = 1;
//marcador
int marcador = 3;
int marcador2 = 3;
void setup() {
  size(400, 400);
}


void draw() {
  background(0);
  paleta1();
  paleta2();
  pelota();
  condicion();
  marcador();
  campo();
 
}
void paleta1() {
  fill(255);
  rect(posXp1, posYp1, 10, sizeP1);
  if (keyPressed) {
    if (key == 's') {
      posYp1 = posYp1 + 1;
    }
    if (key == 'w') {
      posYp1 = posYp1 - 1;
    }
  }
}
void paleta2() {
  fill(255);
  rect(posXp2, posYp2, 10, sizeP2);
  if (keyPressed) {
    if (key == 'l') {
      posYp2 = posYp2 + 1;
    }
    if (key == 'o') {
      posYp2 = posYp2 - 1;
    }
  }
}
void pelota(){
  fill(255);
ellipse(posXpel,posYpel,radio,radio);
posXpel = posXpel + dirXpel * vel;
posYpel = posYpel + dirYpel * vel;
if(posXpel + radio/2 >= width || posXpel + radio/2 <= 15 ){
dirXpel *= -1;
}
if( posYpel + radio/2 >= height || posYpel + radio/2 <= 15){
dirYpel *= -1;
}
}
void condicion(){
 if(posXpel <= 20 && posYpel <= sizeP1 + posYp1 && posYpel >= posYp1){
   dirXpel *= -1;
   dirYpel *= -1;
 }
 if(posXpel >= width - 20 && posYpel <= sizeP2 + posYp2 && posYpel >= posYp2){
   dirXpel *= -1;
   dirYpel *= -1;
 }
  
}
void marcador(){
  textSize(50);
  fill(255);
  text(marcador,250,50);
  text(marcador2,100,50);
  if(posXpel + radio/2 >= width ){
  marcador -= 1;

  }
  if(marcador == 0){
    fill(255);
    textSize(15);
    text("JUGADOR 1 GANA    JUGADOR 2 PIERDE",60,100);
  }
  if(posXpel + radio/2 <=  15 ){
  marcador2 -= 1;

  }
  if(marcador2 == 0){
    fill(255);
    textSize(15);
    fill(255);
    text("JUGADOR 1 PIERDE    JUGADOR 2 GANA",60,100);
  }
  if(marcador == 0 || marcador2 == 0){
    textSize(50);
    text(marcador2,100,50);
    text(marcador,250,50);
    posXpel = 200;
    posYpel = 200;
  }
}
void campo(){
stroke(255);
line(200,0,200,400);
 noFill();
 ellipse(200,200,100,100);

}
