import 'package:flutter/material.dart';

class Login extends StatefulWidget{
  const Login({Key? key}):super(key: key);

  @override
  _LoginState createState() => _LoginState();
}
class _LoginState extends State<Login> {
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
      body: Center(
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
            ),
            const SizedBox(height: 10,),
            TextFormField(
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Password',
              ),
            ),
            const SizedBox(height: 20,),
            TextButton(
              style: flatButtonStyle,
              onPressed: () { },
              child: const Text("Login", style: TextStyle(fontSize: 18, color: Colors.white),)
              )
          ],),
        )
        )
    );
  }
}

