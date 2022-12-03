import 'package:http/http.dart' as http;
import 'package:wheels/models/latest_post.dart';

import '../models/body_type.dart';

class RemoteService
{
  var apiURL = "http://192.168.100.184/api/";
  

  Future<List<LatestPost>?> getLatestPosts() async{
    var client = http.Client();
    var url = Uri.parse('${apiURL}post/latest');
    var response = await client.get(
      url,
      headers: {"Accept":"application/json", "Content-Type":"appliction/json"}
    );
    if(response.statusCode == 200){
      var json = response.body;
      return latestPostFromJson(json);
    }
    return null; 
  }

  Future<List<BodyType>?> getBodyTypes() async{
    var client = http.Client();
    var url = Uri.parse('${apiURL}bodyType');
    var response = await client.get(
      url,
      headers: {"Accept":"application/json", "Content-Type":"appliction/json"}
    );
    if(response.statusCode == 200){
      var json = response.body;
      return bodyTypeFromJson(json);
    }
    return null; 
  }
}