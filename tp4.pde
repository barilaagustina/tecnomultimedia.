//INTEGRANTES: Agustina Barilá, Tomas Vesco, Jimena Contreras

Juego juego;

void setup() { 
  
  
  juego = new Juego();
  size (800, 600);
  frameRate (10);
}

void draw() {

  juego.dibujar();
  
}

void keyPressed(){
juego.teclas();


}
