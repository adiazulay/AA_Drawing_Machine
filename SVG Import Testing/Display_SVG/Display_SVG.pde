import geomerative.*;

RShape map;

int first = 0;

void setup() {
  size(800 , 1000);
  smooth ();
  map = RG.loadShape("mapout.svg");
  map = RG.centerIn(map, g, 100);
  
  
} 

void draw(){
  background(255);
  shape(map, height/8, width/8, 600, 800);  // Draw at coordinate (110, 90) at size 100 x 100
  //shape(bot, 280, 40);            // Draw at coordinate (280, 40) at the default size
}