import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:wheels/models/alert.dart';
import 'package:wheels/models/latest_post.dart';
import 'package:image_picker/image_picker.dart';

import '../models/body_type.dart';

const apiURL = "http://192.168.100.184/api/";
class RemoteService {

  Future<List<LatestPost>?> getLatestPosts() async {
    var client = http.Client();
    var url = Uri.parse('${apiURL}post/latest');
    var response = await client.get(url, headers: {
      "Accept": "application/json",
      "Content-Type": "appliction/json"
    });
    if (response.statusCode == 200) {
      var json = response.body;
      return latestPostFromJson(json);
    }
    return null;
  }

  Future<List<LatestPost>?> getFavotites() async {
    var client = http.Client();
    var url = Uri.parse('${apiURL}favorites');
    final storage = new FlutterSecureStorage();
    String? token = await storage.read(key: 'token');
    var response = await client.get(url, headers: {
      "Accept": "application/json",
      "Content-Type": "appliction/json",
      "Authorization": "Bearer $token"
    });
    if (response.statusCode == 200) {
      var json = response.body;
      return latestPostFromJson(json);
    }
    return null;
  }

Future<List<Alert>?> getAlerts() async {
    var client = http.Client();
    var url = Uri.parse('${apiURL}alerts');
    final storage = new FlutterSecureStorage();
    String? token = await storage.read(key: 'token');
    var response = await client.get(url, headers: {
      "Accept": "application/json",
      "Content-Type": "appliction/json",
      "Authorization": "Bearer $token"
    });
    if (response.statusCode == 200) {
      var json = response.body;
      return alertFromJson(json);
    }
    return null;
  }
  Future<List<BodyType>?> getBodyTypes() async {
    var client = http.Client();
    var url = Uri.parse('${apiURL}bodyType');
    var response = await client.get(url, headers: {
      "Accept": "application/json",
      "Content-Type": "appliction/json"
    });
    if (response.statusCode == 200) {
      var json = response.body;
      return bodyTypeFromJson(json);
    }
    return null;
  }
  Future<http.Response> register(
      String name, String email, String password, String phone) async {
    Map data = {
      "name": name,
      "email": email,
      "password": password,
      "phone": phone,
    };
    var body = json.encode(data);
    var url = Uri.parse("${apiURL}auth/register");
    http.Response response = await http.post(url,
        headers: {
          "Accept": "application/json",
          "Content-Type": "appliction/json"
        },
        body: body);
    return response;
  }

  Future<http.Response> login(String email, String password) async {
    Map data = {
      "email": email,
      "password": password,
    };
    var body = json.encode(data);
    var url = Uri.parse("${apiURL}auth/login");
    http.Response response = await http.post(url,
        headers: {
          "Accept": "application/json",
          "Content-Type": "appliction/json"
        },
        body: body);
    return response;
  }

  Future<http.Response> logout() async {
    var url = Uri.parse("${apiURL}auth/logout");
    http.Response response = await http.post(url, headers: {
      "Accept": "application/json",
      "Content-Type": "appliction/json"
    });
    return response;
  }

  Future<http.Response> create_post(
      String title,
      String description,
      int price,
      int negotiable,
      XFile image,
      String maker,
      String model,
      String colour,
      int years,
      int body_type_id,
      int transmission_type,
      int kilometrage,
      int gas_type,
      int doors,
      int engine_cylinders,
      int condition,
      int number_of_owners,
      int number_of_accidents,
      int type_post) async {
    Map data = {
      "title": title,
      "description": description,
      "price": price,
      "negotiable": negotiable,
      "image":image,
      "maker":maker,
      "model":model,
      "colour":colour,
      "years":years,
      "body_type_id":body_type_id,
      "transmission_type":transmission_type,
      "kilometrage":kilometrage,
      "gas_type":gas_type,
      "doors":doors,
      "engine_cylinders":engine_cylinders,
      "condition":condition,
      "number_of_owners":number_of_owners,
      "number_of_accidents":number_of_accidents,
      "type_post":type_post,
    };
    final storage = new FlutterSecureStorage();
    String? token = await storage.read(key: 'token');
    var body = json.encode(data);
    var url = Uri.parse("${apiURL}post/create");
    http.Response response = await http.post(url,
        headers: {
          "Accept": "application/json",
          "Content-Type": "appliction/json",
          "Authorization": "Bearer $token"
        },
        body: body);
    return response;
  }
}
