class Snake 
{
 
  Temporizador t;
  PVector posicion, velocidad;
  int tamano, puntos;
  boolean f;
  ArrayList<PVector> cuerpo= new ArrayList<PVector> ();
  PImage ganar,pacman;
  
  Snake ( ){    
   
    t= new Temporizador (15);
    f = false;
    tamano= 20;
    puntos = 0;
   ;
    ganar = loadImage ("2.png");
    posicion = new PVector (width/2, height/2);
    velocidad = new PVector (1,1);
    cuerpo.add (new PVector (posicion.x, posicion.y));
    pacman=loadImage("pacman.png");
  }
  
  void mostrar () {
    fill (255);
    noStroke ();
    rectMode (CENTER);
    
    for (PVector c : cuerpo) {
      image (pacman,c.x + tamano/2, c.y + tamano/2, tamano, tamano);
    }
  }
 
   void mover () {
    if (key == 'w') {
      posicion.y -= velocidad.y * tamano;
    } else if (key == 's') {
      posicion.y += velocidad.y * tamano;
    } else if (key == 'a') {
      posicion.x -= velocidad.x * tamano;
    }else if (key == 'd') {
      posicion.x += velocidad.x * tamano;
    } 

    cuerpo.add (new PVector (posicion.x, posicion.y));
    cuerpo.remove (0);
    }
 
    boolean cargar (PVector Cargas) {
    PVector cabeza = cuerpo.get (cuerpo.size() - 1);
    float distancia = dist (cabeza.x, cabeza.y, Cargas.x, Cargas.y);
  
    if (distancia < 1) {
    return true;
    } else {
      return false;
    }
  }

  void muerte() {
    PVector cabeza = cuerpo.get(cuerpo.size() - 1);
      for (int i = 0; i < (cuerpo.size() - 1); i++) {
       PVector cuerpo = this.cuerpo.get(i);
       float distancia = dist(cuerpo.x, cuerpo.y, cabeza.x, cabeza.y);
     
     if (distancia < 1) {
       f = true;
      } 
     } 
  }

 void ganar (Snake s) {
    
  if (s.getPuntos() > 9) {
      
    fill (0);
    image (ganar, 400, 300);      
     }
   }

  void crecer () {
      cuerpo.add(new PVector (posicion.x, posicion.y));
      puntos++;  
  }
  

  void validarBordes () {
   PVector cabeza = cuerpo.get (cuerpo.size() - 1);
   
   if(cabeza.x > width - tamano/2 || cabeza.x < tamano/2 || cabeza.y > height - tamano/2 || cabeza.y < tamano/2){
     f = true;
   }   
  }

  int getPuntos () {
  return puntos;
  }
  
  boolean getF() {
   return f; 
  }
}
