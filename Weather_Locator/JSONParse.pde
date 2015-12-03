float fTemp;

void getData (){
  JSONObject load = loadJSONObject(apiCall);
  println (load);
  JSONObject weather = load.getJSONObject ("main");
  //println (weather);
  float temp = weather.getFloat ("temp");
  float hum = weather.getFloat ("humidity");
  JSONObject wind = load.getJSONObject ("wind");
  float wSpeed = wind.getFloat ("speed");
  float gust = wind.getFloat ("gust");
  convert(temp);
  println ("wind:" , wSpeed);
  println("temprature:" ,fTemp);
  println ("humidity:" , hum);
  println ("gust:" , gust);
  
}

void convert (float f){
 fTemp = (f - 273.15) * 1.8 +32;
}

void writeVars (){
  myPort.write('%');
  delay (1000);
  myPort.bufferUntil('*');
  char hello = myPort.readChar();
  println (hello);
}