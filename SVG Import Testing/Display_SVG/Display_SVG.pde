<<<<<<< HEAD
PShape topo;

void setup() {
  size(800 , 1000);
  // The file "bot1.svg" must be in the data folder
  // of the current sketch to load successftopoy
  topo = loadShape("mapout.svg");
} 

void draw(){
  background(255);
  shape(topo, height/8, width/8, 600, 800);  // Draw at coordinate (110, 90) at size 100 x 100
  //shape(bot, 280, 40);            // Draw at coordinate (280, 40) at the default size
=======
import geomerative.*;

//test

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
>>>>>>> Dev
}