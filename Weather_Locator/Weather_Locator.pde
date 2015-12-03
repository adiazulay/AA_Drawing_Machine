import processing.serial.*;

Serial myPort;
float lat;
float lon;
int lonUp;
int latUp;
String location;

void setup() {
  size(400, 200);
  rectX = width/2-rectSize-10;
  rectY = height/2-rectSize/2;
  
  printArray  (Serial.list());
  String portName = Serial.list()[2];
  myPort = new Serial(this, portName, 115200);
  myPort.bufferUntil(100);
  /*
  JSONObject load = loadJSONObject(apiCall);
  println (load);
  JSONArray weather = load.getJSONArray ("weather");
  println (weather);
  JSONObject weatherOb = weather.getJSONObject(0);
  String des = weatherOb.getString("main");
  println(des);
  */
  //getData();
}

void draw(){ 
   update(mouseX, mouseY);
   rect(rectX, rectY, rectSize, rectSize);
 
}

void update (int x, int y){
  if ( overRect(rectX, rectY, rectSize, rectSize) ) {
    gpsButton = true;
  } else {
    gpsButton= false;
  }
}
void getGPS () {
  if (myPort.available()>0){
    myPort.bufferUntil('%');
   location = myPort.readStringUntil('*');
   if (location != null){
      float[] loc = float (splitTokens(location, "\n*"));
      lat = loc[0];
      lon = loc[1];
    }
    
  }
  
  latUp = int(lat);
  lonUp = int(lon);
  
  if (lonUp != 0 && latUp != 0){
  println(latUp);
  println(lonUp);
  apiLocate();
  getData();
  delay (2000);
  } else {
    println ("gps not connected");
  }
}
/*
void serialEvent (Serial myPort){
  location = myPort.readStringUntil('*');
   //println(location);
   if (location != null){
      float[] loc = float (splitTokens(location, "\n*"));
      lat = loc[0];
      lon = loc[1];
   }
}


*/