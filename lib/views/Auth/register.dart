import 'package:flutter/material.dart';

class Register extends StatefulWidget{
  const Register({Key? key}):super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}
class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();
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
      body: Form(
        key: _formKey,
        child: Center(
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
                validator: (value) {
                  if(value == null || value.isEmpty)
                    return 'The name field is required.';
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'E-mail',
                ),
                validator: (value) {
                  if(value == null || value.isEmpty)
                    return 'The e-mail field is required.';
                },
                keyboardType: TextInputType.emailAddress,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Password',
                ),
                validator: (value) {
                  if(value == null || value.isEmpty)
                    return 'The password field is required.';
                },
                //keyboardType: TextInputType.
              ),
              TextFormField(
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Phone',
                ),
                validator: (value) {
                  if(value == null || value.isEmpty)
                    return 'The phone field is required.';
                },
                keyboardType: TextInputType.phone,
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
                child: const Text("Register", style: TextStyle(fontSize: 18, color: Colors.white),)
                )
            ],),
          )
          ),
      )
    );
  }
}

