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
  delay (5000);
  //getGPS();
  //apiLocate();
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
    myPort.buffer(5);
   /*location = myPort.readStringUntil('*');
   println(location);
   if (location != null){
      float[] loc = float (splitTokens(location, "\n*"));
      lat = loc[0];
      lon = loc[1];
    }
    */
  }
  
  latUp = int(lat);
  lonUp = int(lon);
  println(latUp);
  println(lonUp);
  delay (2000);
}

void serialEvent (Serial myPort){
  location = myPort.readStringUntil('*');
   //println(location);
   if (location != null){
      float[] loc = float (splitTokens(location, "\n*"));
      lat = loc[0];
      lon = loc[1];
   }
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
    getGPS();
    apiLocate();
    getData();
  }
}