import processing.serial.*;

Serial myPort;
String loc;



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
  
}

void draw(){
  getGPS();
  
}

void getGPS () {
  if (myPort.available()>0){
    myPort.bufferUntil('-');
    loc = myPort.readStringUntil('+');
  }
  println(loc);
  delay (1000);
}