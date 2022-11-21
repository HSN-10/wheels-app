import 'package:http/http.dart' as http;
import '../models/post.dart';

class RemoteService
{
  var apiURL = "http://localhost/api/";

  Future<Post?> getLatestPosts() async{
    var client = http.Client();

    var url = Uri.parse('${apiURL}post/latest');
    var response = await client.get(
      url,
      headers: {"Accept":"application/json", "Content-Type":"appliction/json"}
    );
    if(response.statusCode == 200){
      var json = response.body;
      return postFromJson(json);
    }
    return null;
  }
}