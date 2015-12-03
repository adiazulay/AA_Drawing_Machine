float fTemp;

void getData (){
  JSONObject load = loadJSONObject(apiCall);
  //println (load);
  JSONObject weather = load.getJSONObject ("main");
  //println (weather);
  float temp = weather.getFloat ("temp");
  float hum = weather.getFloat ("humidity");
  JSONObject wind = load.getJSONObject ("wind");
  float wSpeed = wind.getFloat ("speed");
  convert(temp);
  println ("wind:" , wSpeed);
  println("temprature:" ,fTemp);
  println ("humidity:" , hum);
  
  
  /*JSONArray weather = load.getJSONArray ("weather");
  println (weather);
  JSONObject weatherOb = weather.getJSONObject();
  println(weatherOb);
  String des = weatherOb.getString("temp");
  println (des);
*/
  
}

void convert (float f){
 fTemp = (f - 273.15) * 1.8 +32;
}