class Cargas {
  
  PVector posicion;
  int tamano;

  Cargas () {

    tamano = 20;
    posicion = new PVector (int(random(width/tamano)), int(random(height/tamano)));
    posicion.mult (tamano);
  }

  void mostrar () {
    fill (255, 0, 0);
    noStroke ();
    rectMode (CENTER);
    rect(posicion.x + tamano/2, posicion.y + tamano/2, tamano, tamano);
  }   

  PVector getPosicion () {
    return posicion;
  }
  
}
