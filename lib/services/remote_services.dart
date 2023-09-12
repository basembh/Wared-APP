import 'package:wared_app/models/wared.dart';
import 'package:http/http.dart' as http;


class RemoteServices
{
  Future<List<Wared>?> getwardes() async {
    var client = http.Client();
      var json="z";
    var uri = Uri.parse('https://hajj.gov.jo/ewahiqaapi/api/wared');
    var response   = await client.get(uri);
    if ( response.statusCode ==200){
       json = response.body;
       //json[0].sort((a, b) => a.compareTo(b));        
      return waredFromJson(json);      
    } 
   return waredFromJson(json);    
  }

}