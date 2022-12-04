import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:wheels/views/Auth/register.dart';
import 'package:http/http.dart' as http;
import '../../services/remote_service.dart';
import 'package:wheels/views/home_page.dart';
import '../../services/globals.dart';
class Login extends StatefulWidget{
  const Login({Key? key}):super(key: key);

  @override
  _LoginState createState() => _LoginState();
}
class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();

  late String email;
  late String password;

login() async{
  print(email);
  http.Response response = await RemoteService().login(email, password);
  Map responseMap = jsonDecode(response.body);
  if(response.statusCode == 200){
    Navigator.push(
      context,
      MaterialPageRoute(builder: (BuildContext context) => const HomePage())
      );
  }else{
    errorSnackBar(context, responseMap.values.first[0].toString());
  }
}


  @override
  Widget build(BuildContext context) {
  final ButtonStyle flatButtonStyle = TextButton.styleFrom(
    minimumSize: const Size(500, 50),
    backgroundColor: Colors.green,
    padding: const EdgeInsets.all(5),
  );
    return Scaffold(
      appBar: AppBar(
        title: const Text("Wheels"),
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Form(
          key: _formKey,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(children: [
                Image.asset(
                  fit: BoxFit.cover,
                  "assets/images/login.png",
                  width: 150,
                ),
                const SizedBox(height: 15,),
                const Text("Login", style: TextStyle(fontSize: 26, fontWeight: FontWeight.w500),),
                const SizedBox(height: 20,),
                TextFormField(
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'E-mail',
                  ),
                  onChanged: (value) => email = value,
                  validator: (value) {
                    if(value == null || value.isEmpty)
                      return 'The email field is required.';
                  },
                ),
                const SizedBox(height: 10,),
                TextFormField(
                  obscureText: true,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Password',
                  ),
                  onChanged: (value) => password = value,
                  validator: (value) {
                    if(value == null || value.isEmpty)
                      return 'The password field is required.';
                  },
                ),
                const SizedBox(height: 20,),
                TextButton(
                  style: flatButtonStyle,
                  onPressed: login,
                  child: const Text("Login", style: TextStyle(fontSize: 18, color: Colors.white),)
                  ),
                const SizedBox(height: 10,),
                TextButton(
                style: TextButton.styleFrom(
                minimumSize: const Size(500, 50),
                backgroundColor: Colors.red,
                padding: const EdgeInsets.all(5),
              ),
                onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const Register();
                },)
                ),
                child: const Text("Register", style: TextStyle(fontSize: 18, color: Colors.white),)
                )
              ],),
            )
            ),
        ),
      )
    );
  }
}

