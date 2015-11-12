PShape map;

void setup() {
  size(800 , 1000);
  // The file "bot1.svg" must be in the data folder
  // of the current sketch to load successfully
  map = loadShape("mapout.svg");
} 

void draw(){
  background(255);
  shape(map, height/8, width/8, 600, 800);  // Draw at coordinate (110, 90) at size 100 x 100
  //shape(bot, 280, 40);            // Draw at coordinate (280, 40) at the default size
}