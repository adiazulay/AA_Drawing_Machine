import processing.serial.*;

Serial myPort;
float lat;
float lon;
int lonUp;
int latUp;
String location;


void setup() {
  JSONObject load = loadJSONObject("http://api.openweathermap.org/data/2.5/weather?q=London&appid=2de143494c0b295cca9337e1e96b00e0");
  println (load);
  JSONArray weather = load.getJSONArray ("weather");
  println (weather);
  JSONObject weatherOb = weather.getJSONObject(0);
  String des = weatherOb.getString("main");
  println(des);
  String portName = Serial.list()[2];
  myPort = new Serial(this, portName, 115200);
  delay (5000);

  
  
}

void draw(){
    getGPS();
  
}

void getGPS () {
  if (myPort.available()>0){
    myPort.buffer(3);
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