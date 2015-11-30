import processing.serial.*;

Serial myPort;
String lat;
String lon;
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
  myPort.write(665566);
  
  
}

void draw(){
  getGPS();
  
}

void getGPS () {
  if (myPort.available()>0){
    location = myPort.readString();
    if (location != null){
      String[] loc = splitTokens(location, ",");
      lat = loc[0];
      lon = loc[1];
    }
  }
  println(lat);
  println(lon);
  delay (2000);
}