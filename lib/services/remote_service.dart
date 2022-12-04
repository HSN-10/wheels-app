import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:wheels/models/latest_post.dart';
import 'package:wheels/views/Auth/login.dart';

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

  Future<http.Response> register(String name, String email, String password, String phone) async{
    Map data = {
      "name":name,
      "email":email,
      "password":password,
      "phone":phone,
    };
    var body = json.encode(data);
    var url = Uri.parse("${apiURL}auth/register");
    http.Response response = await http.post(
      url,
      headers:  {"Accept":"application/json", "Content-Type":"appliction/json"},
      body: body
    );
    return response;
  }
  Future<http.Response> login(String email, String password) async{
    Map data = {
      "email":email,
      "password":password,
    };
    var body = json.encode(data);
    var url = Uri.parse("${apiURL}auth/login");
    http.Response response = await http.post(
      url,
      headers:  {"Accept":"application/json", "Content-Type":"appliction/json"},
      body: body
    );
    print(response.body);
    return response;
  }
}