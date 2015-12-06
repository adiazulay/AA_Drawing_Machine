boolean gpsButton = false;
boolean sendButton = false;
int rectSize = 90;
int getButtonX, getButtonY; 

int sendDataX, sendDataY;

void drawGUI(){
  fill (0,0,255);
  rect(getButtonX, getButtonY, rectSize, rectSize);
  fill (0,255,255);
  rect(sendDataX, sendDataY, rectSize, rectSize);
}

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
    myPort.clear();
    getGPS();
    //writeVars();
  }
  if (sendButton){
  writeVars();
  }
}