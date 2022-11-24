import 'package:flutter/material.dart';
const List<String> transmission = <String>['Automatic', 'Manual'];
const List<String> condition = <String>['New', 'Used', 'Scrap'];
const List<String> bodyType = <String>['Sedan', 'Pickup', 'Supercar'];
const List<String> gasType = <String>['Diesel', 'Jayyid', 'Mumtaz', 'Super'];

class CreatePost extends StatefulWidget{
  const CreatePost({Key? key}):super(key: key);

  @override
  _CreatePostState createState() => _CreatePostState();
}

class _CreatePostState extends State<CreatePost> {

  String transmissionValue = transmission.first;
  String conditionValue = condition.first;
  String bodyTypeValue = bodyType.first;
  String gasTypeValue = gasType.first;
  @override
  Widget build(BuildContext context) {
  final ButtonStyle flatButtonStyle = TextButton.styleFrom(
    minimumSize: Size(500, 50),
    backgroundColor: Colors.green,
    padding: EdgeInsets.all(5),
  );

    return Scaffold(
      appBar: AppBar(
        title: const Text("Create Post"),
        backgroundColor: Colors.green,
        actions: [
          IconButton(onPressed: (){}, icon: const Icon(Icons.add))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(children: [
            const SizedBox(height: 15,),
            const Text("Post Detalis", style: TextStyle(fontSize: 18),),
            Container(
              color: Colors.white,
              child: Column(children: [
                TextFormField(
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Title',
                  ),
                ),
                TextFormField(
                  keyboardType: TextInputType.multiline,
                  minLines: 2,
                  maxLines: 5,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Description (optional)',
                  ),
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Price',
                  ),
                ),
              ]),
            ),
            const SizedBox(height: 20,),
            const Text("Vehicle", style: TextStyle(fontSize: 18),),
            Container(
              color: Colors.white,
              child: Column(children:  [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ConstrainedBox(
                      constraints: BoxConstraints.tight(const Size(170, 50)),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: 'Maker',
                        ),
                      ),
                    ),
                    ConstrainedBox(
                      constraints: BoxConstraints.tight(const Size(170, 50)),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: 'Model',
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ConstrainedBox(
                      constraints: BoxConstraints.tight(const Size(170, 50)),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: 'Year',
                        ),
                      ),
                    ),
                    ConstrainedBox(
                      constraints: BoxConstraints.tight(const Size(170, 50)),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: 'Kilometrage',
                        ),
                      ),
                    ),
                  ],
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
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ConstrainedBox(
                      constraints: BoxConstraints.tight(const Size(170, 50)),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: 'Number Of Owners',
                        ),
                      ),
                    ),
                    ConstrainedBox(
                      constraints: BoxConstraints.tight(const Size(170, 50)),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: 'Number Of Accidents',
                        ),
                      ),
                    ),
                  ],
                ),
              ]), 
              ),
              const SizedBox(height: 20,),
              const Text("Body", style: TextStyle(fontSize: 18),),
              Container(
              color: Colors.white,
              child: Column(children:  [
                Row(
                  children: const [
                    Text("Body Type"),
                  ],
                ),
                DropdownButton(
                  items: bodyType.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(), 
                    value: bodyTypeValue,
                    onChanged: (String? value) {
                      setState(() {
                        bodyTypeValue = value!;
                      });
                    },
                    isExpanded: true,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ConstrainedBox(
                      constraints: BoxConstraints.tight(const Size(170, 50)),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: 'Colour',
                        ),
                      ),
                    ),
                    ConstrainedBox(
                      constraints: BoxConstraints.tight(const Size(170, 50)),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: 'Doors',
                        ),
                      ),
                    ),
                  ],
                ),
              ])
              ),
              const SizedBox(height: 20,),
              const Text("Engine", style: TextStyle(fontSize: 18),),
              Container(
              color: Colors.white,
              child: Column(children:  [
                TextFormField(
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Engine Cylinders',
                  ),
                ),
                SizedBox(height: 20,),
                Row(
                  children: const [
                    Text("Body Type"),
                  ],
                ),
                DropdownButton(
                  items: gasType.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(), 
                    value: gasTypeValue,
                    onChanged: (String? value) {
                      setState(() {
                        gasTypeValue = value!;
                      });
                    },
                    isExpanded: true,
                ),
              ])
              )
          ],),
        ),
      )
    );
  }
}

