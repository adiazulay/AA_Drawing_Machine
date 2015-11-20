import geomerative.*;


RShape topo;

int first = 0;

void setup() {
  size(800 , 1000);
  smooth ();
  
  RG.init(this);
  
  topo = RG.loadShape("illustmap.svg");
  topo = RG.centerIn(topo, g, 100);
  
  
} 

void draw(){
  translate(width/2, height/2);
  background(#2D4D83);

  noFill();
  stroke(255, 200);
  float splitPos = map(mouseY, 0, height, 0, 1);
  
  RShape[] splitShapes = RG.split(topo, splitPos);
 
  RG.shape(splitShapes[first]);
}

void mousePressed(){
  first = (first + 1) % 2;
}