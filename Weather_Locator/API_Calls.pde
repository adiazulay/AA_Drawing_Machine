String apiCall;
String apiKey = "&appid=2de143494c0b295cca9337e1e96b00e0";
String apiAddress = "http://api.openweathermap.org/data/2.5/weather?lat=";
String apiMid = "&lon=";

void apiLocate (){
  String apiLon = str (lonUp);
  String apiLat = str (latUp);
  String [] apiArray = new String [5];
  apiArray[0] = apiAddress;
  apiArray[1] = apiLat;
  apiArray[2] = apiMid;
  apiArray[3] = apiLon;
  apiArray[4] = apiKey;
  apiCall = join(apiArray,"");
}