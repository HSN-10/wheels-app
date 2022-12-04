import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:wheels/services/remote_service.dart';
import 'package:wheels/views/home_page.dart';

import '../../services/globals.dart';
class Register extends StatefulWidget{
  const Register({Key? key}):super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}
class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();
  late String name;
  late String email;
  late String password;
  late String phone;

register() async{
  http.Response response = await RemoteService().register(name, email, password, phone);
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
      body: Form(
        key: _formKey,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(children: [
              const SizedBox(height: 15,),
              const Text("Register", style: TextStyle(fontSize: 26, fontWeight: FontWeight.w500),),
              const SizedBox(height: 20,),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Name',
                ),
                onChanged: (value) => name = value,
                validator: (value) {
                  if(value == null || value.isEmpty) {
                    return 'The name field is required.';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'E-mail',
                ),
                onChanged: (value) => email = value,
                validator: (value) {
                  if(value == null || value.isEmpty) {
                    return 'The e-mail field is required.';
                  }
                  return null;
                },
                keyboardType: TextInputType.emailAddress,
              ),
              TextFormField(
                obscureText: true,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Password',
                ),
                onChanged: (value) => password = value,
                validator: (value) {
                  if(value == null || value.isEmpty) {
                    return 'The password field is required.';
                  }
                },
                //keyboardType: TextInputType.
              ),
              TextFormField(
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Phone',
                ),
                onChanged: (value) => phone = value,
                validator: (value) {
                  if(value == null || value.isEmpty) {
                    return 'The phone field is required.';
                  }
                },
                keyboardType: TextInputType.phone,
              ),
              const SizedBox(height: 20,),
              TextButton(
                style: flatButtonStyle,
                onPressed: () {
                if (_formKey.currentState!.validate()) {
                  register();
                }
              },
                child: const Text("Register", style: TextStyle(fontSize: 18, color: Colors.white),)
                )
            ],),
          )
          ),
      )
    );
  }
}

