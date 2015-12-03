

void getData (){
  JSONObject load = loadJSONObject(apiCall);
  println (load);
  JSONObject weather = load.getJSONObject ("main");
  println (weather);
  float temp = weather.getFloat ("temp");
  println(temp);
  
  
  /*JSONArray weather = load.getJSONArray ("weather");
  println (weather);
  JSONObject weatherOb = weather.getJSONObject();
  println(weatherOb);
  String des = weatherOb.getString("temp");
  println (des);
*/
  
}