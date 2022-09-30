class Juego {
  Snake s;
  Cargas c;
  Temporizador t;
  
  boolean gameOver;
  PFont tipografia;
  PImage inicio, fin, ganar,fondo;
  String estado="inicio";
  
  Juego() {
    
    t= new Temporizador (15);
    s = new Snake ();
    c = new Cargas ();
    tipografia = createFont("maquina.ttf", 25);
    gameOver = false;
    inicio = loadImage ("inicio.jpg");
    fin = loadImage ("perdiste.jpg");
    ganar = loadImage ("2.png");
    fondo=loadImage("fondo.jpg");
  }
  void dibujar () {
    if (estado == "inicio") {
      imageMode(CENTER);
      image (inicio, width/2, height/2); 
      stroke (255);
      
    } else if (estado == "jugar") {
      image(fondo,width/2, height/2);
     // background(0);
      c.mostrar (); 
      fill (255);
      textFont (tipografia);
      textAlign(CENTER);
      text("Total de cargas obtenidas: " + s.getPuntos(), 190, 50);
      t.countDown();
      fill (255);
      text("Tiempo restante: " + t.getTiempo(), 600, 50); 
      
      if (t.getTiempo() < 0.1) {
       estado = "fin"; 
        
      }
      
      if (s.cargar(c.getPosicion())) {
        c = new Cargas();
        s.crecer ();
      }
      if (s.getF()) {
        estado = "fin";
      }
      s.mostrar (); 
      s.mover ();
      s.validarBordes();
      s.muerte();
      s.ganar(s);
         
         
    } else if (estado == "fin" ) {
      background(0);
      imageMode(CENTER);
      fill(255);
      image (fin, 400, 300);
      textFont (tipografia);
      textAlign(CENTER);
      text("Total de cargas obtenidas: " + s.getPuntos(), width/2, height/2 + 250);
  
  } else if (estado == "ganar" ) {
      imageMode(CENTER);
      fill(255);
      image (ganar, 1, 0.6);
      textFont (tipografia);
      textAlign(CENTER);
      text("Total de cargas obtenidas: " + s.getPuntos(), width/2, height/2 + 250);
    }
  } 
    
  void teclas () {
    if (estado == "inicio" &&  key == 'c')  {
      estado = "jugar"; 
    } else if (estado == "fin" && key == 'v') {
      estado = "inicio";
      ;  
    } 
  }
}
