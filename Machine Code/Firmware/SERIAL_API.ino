 
 void listenSerial () {
   if(Serial.available() > 0) {
    char readByte = Serial.read();
    if(readByte == 'f') { // move arm forward
      manualMoveBackward = false;
      manualMoveForward  = true;
      
    } else if(readByte == 'k') { // move arm backward
      manualMoveForward  = false;
      manualMoveBackward = true;
       
    }
    
    else {
      manualMoveForward  = false;
      manualMoveBackward = false;
    }
  }
}
