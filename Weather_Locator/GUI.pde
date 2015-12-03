boolean gpsButton = false;
int rectSize = 90;
int rectX, rectY; 

boolean overRect(int x, int y, int width, int height)  {
  if (mouseX >= x && mouseX <= x+width && 
      mouseY >= y && mouseY <= y+height) {
    return true;
  } else {
    return false;
  }
}

void mousePressed() {
 
  if (gpsButton) {
    getGPS();
    writeVars();
    
  }
}