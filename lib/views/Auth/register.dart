import 'package:flutter/material.dart';

class Register extends StatefulWidget{
  const Register({Key? key}):super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}
class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
  final ButtonStyle flatButtonStyle = TextButton.styleFrom(
    minimumSize: Size(500, 50),
    backgroundColor: Colors.green,
    padding: EdgeInsets.all(5),
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
            SizedBox(height: 15,),
            const Text("Register", style: TextStyle(fontSize: 26, fontWeight: FontWeight.w500),),
            SizedBox(height: 20,),
            TextFormField(
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Name',
              ),
            ),
            TextFormField(
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'E-mail',
              ),
            ),
            TextFormField(
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Password',
              ),
            ),
            TextFormField(
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Phone',
              ),
            ),
            SizedBox(height: 20,),
            TextButton(
              style: flatButtonStyle,
              onPressed: () { },
              child: const Text("Register", style: TextStyle(fontSize: 18, color: Colors.white),)
              )
          ],),
        )
        )
    );
  }
}

