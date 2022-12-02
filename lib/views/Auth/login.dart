import 'package:flutter/material.dart';
import 'package:wheels/views/Auth/register.dart';

class Login extends StatefulWidget{
  const Login({Key? key}):super(key: key);

  @override
  _LoginState createState() => _LoginState();
}
class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
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
              Image.network(
                fit: BoxFit.cover,
                "https://cdn2.iconfinder.com/data/icons/player-rounded-set/154/user-login-player-function-name-avatar-512.png",
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
                validator: (value) {
                  if(value == null || value.isEmpty)
                    return 'The email field is required.';
                },
              ),
              const SizedBox(height: 10,),
              TextFormField(
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Password',
                ),
                validator: (value) {
                  if(value == null || value.isEmpty)
                    return 'The password field is required.';
                },
              ),
              const SizedBox(height: 20,),
              TextButton(
                style: flatButtonStyle,
                onPressed: () {
                // Validate returns true if the form is valid, or false otherwise.
                if (_formKey.currentState!.validate()) {
                  // If the form is valid, display a snackbar. In the real world,
                  // you'd often call a server or save the information in a database.
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Processing Data')),
                  );
                }
              },
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
      )
    );
  }
}

