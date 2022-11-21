import 'package:flutter/material.dart';
const List<String> transmission = <String>['Automatic', 'Manual'];
const List<String> condition = <String>['New', 'Used', 'Scrap'];

class CreatePost extends StatefulWidget{
  const CreatePost({Key? key}):super(key: key);

  @override
  _CreatePostState createState() => _CreatePostState();
}

class _CreatePostState extends State<CreatePost> {

  String transmissionValue = transmission.first;
  String conditionValue = condition.first;
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
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(children: [
          const SizedBox(height: 15,),
          const Text("Vehicle", style: TextStyle(fontSize: 20),),
          Container(
            color: Colors.white,
            child: Column(children:  [
              TextFormField(
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Maker',
                ),
              ),
              TextFormField(
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Model',
                ),
              ),
              TextFormField(
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Year',
                ),
              ),
              SizedBox(height: 20,),
              Row(
                children: const [
                  Text("Transmission"),
                ],
              ),
              DropdownButton(
                items: transmission.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(), 
                  value: transmissionValue,
                  onChanged: (String? value) {
                    setState(() {
                      transmissionValue = value!;
                    });
                  },
                  isExpanded: true,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Kilometrage',
                ),
              ),
              SizedBox(height: 20,),
              Row(
                children: const [
                  Text("Condition"),
                ],
              ),
              DropdownButton(
                items: condition.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(), 
                  value: conditionValue,
                  onChanged: (String? value) {
                    setState(() {
                      conditionValue = value!;
                    });
                  },
                  isExpanded: true,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Number Of Owners',
                ),
              ),
              TextFormField(
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Number Of Accidents',
                ),
              ),
            ]), 
            )
        ],),
      )
    );
  }
}

