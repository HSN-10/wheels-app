import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
const List<String> transmission = <String>['Automatic', 'Manual'];
const List<String> condition = <String>['New', 'Used', 'Scrap'];
const List<String> bodyType = <String>['Sedan', 'Pickup', 'Supercar'];
const List<String> gasType = <String>['Diesel', 'Jayyid', 'Mumtaz', 'Super'];
const List<String> postType = <String>['Sale', 'Request'];

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
  String postTypeValue = postType.first;
  File? _image;
  PickedFile? _pickedFile;
  final _picker = ImagePicker();
  Future<void> _pickedImage() async {
    _pickedFile = await _picker.getImage(source:ImageSource.gallery);
    if(_pickedFile != null){
      setState(() {
        _image = File(_pickedFile!.path);
      });
    }
  }
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final ButtonStyle flatButtonStyle = TextButton.styleFrom(
      minimumSize: const Size(500, 50),
      backgroundColor: Colors.green,
      padding: const EdgeInsets.all(5),
    );
    bool isNumeric(String s) {
    if (s == null) {
      return false;
    }
    return double.tryParse(s) != null;
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create Post"),
        backgroundColor: Colors.green,
        actions: [
          IconButton(onPressed: () {
                // Validate returns true if the form is valid, or false otherwise.
                if (_formKey.currentState!.validate()) {
                  // If the form is valid, display a snackbar. In the real world,
                  // you'd often call a server or save the information in a database.
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Processing Data')),
                  );
                }
              }, icon: const Icon(Icons.add))
        ],
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(children: [
              const SizedBox(height: 15,),
              const Text("Post Detalis", style: TextStyle(fontSize: 18),),
              Container(
                color: Colors.white,
                child: Column(children: [
                  const SizedBox(height: 15,),
                  GestureDetector(
                    child: const Text("Select An Image"),
                    onTap: ()=>{},
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Title',
                    ),
                    validator: (value) {
                      if(value == null || value.isEmpty)
                        return 'The title field is required.';
                      return null;
                    },
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
                    validator: (value) {
                      if(value == null || value.isEmpty)
                        return 'The price field is required.';
                      else if(!isNumeric(value))
                        return 'The price must be an integer.';
                      return null;
                    },
                  ),
                  const SizedBox(height: 20,),
                  Row(
                    children: const [
                      Text("Post Type"),
                    ],
                  ),
                  DropdownButton(
                    items: postType.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(), 
                      value: postTypeValue,
                      onChanged: (String? value) {
                        setState(() {
                          postTypeValue = value!;
                        });
                      },
                      isExpanded: true,
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
                        constraints: BoxConstraints.tight(const Size(170, 100)),
                        child: TextFormField(
                          decoration: const InputDecoration(
                            border: UnderlineInputBorder(),
                            labelText: 'Maker',
                          ),
                          validator: (value) {
                            if(value == null || value.isEmpty)
                              return 'The maker field is required.';
                            return null;
                          },
                        ),
                      ),
                      ConstrainedBox(
                        constraints: BoxConstraints.tight(const Size(170, 100)),
                        child: TextFormField(
                          decoration: const InputDecoration(
                            border: UnderlineInputBorder(),
                            labelText: 'Model',
                          ),
                          validator: (value) {
                            if(value == null || value.isEmpty)
                              return 'The model field is required.';
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ConstrainedBox(
                        constraints: BoxConstraints.tight(const Size(170, 100)),
                        child: TextFormField(
                          decoration: const InputDecoration(
                            border: UnderlineInputBorder(),
                            labelText: 'Year',
                          ),
                          validator: (value) {
                            if(value == null || value.isEmpty)
                              return 'The year field is required.';
                            else if(!isNumeric(value))
                              return 'The year must be an integer.';
                            return null;
                          },
                        ),
                      ),
                      ConstrainedBox(
                        constraints: BoxConstraints.tight(const Size(170, 100)),
                        child: TextFormField(
                          decoration: const InputDecoration(
                            border: UnderlineInputBorder(),
                            labelText: 'Kilometrage',
                          ),
                          validator: (value) {
                            if(value == null || value.isEmpty)
                              return 'The kilometrage field is required.';
                            else if(!isNumeric(value))
                              return 'The kilometrage must be an integer.';
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20,),
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
                  const SizedBox(height: 20,),
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
                  const SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ConstrainedBox(
                        constraints: BoxConstraints.tight(const Size(170, 100)),
                        child: TextFormField(
                          decoration: const InputDecoration(
                            border: UnderlineInputBorder(),
                            labelText: 'Number Of Owners',
                          ),
                          validator: (value) {
                            if(value == null || value.isEmpty)
                              return 'The owners field is required.';
                            else if(!isNumeric(value))
                              return 'The owners must be an integer.';
                            return null;
                          },
                        ),
                      ),
                      ConstrainedBox(
                        constraints: BoxConstraints.tight(const Size(170, 100)),
                        child: TextFormField(
                          decoration: const InputDecoration(
                            border: UnderlineInputBorder(),
                            labelText: 'Number Of Accidents',
                          ),
                          validator: (value) {
                            if(value == null || value.isEmpty)
                              return 'The accidents field is required.';
                            else if(!isNumeric(value))
                              return 'The accidents must be an integer.';
                            return null;
                          },
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
                        constraints: BoxConstraints.tight(const Size(170, 100)),
                        child: TextFormField(
                          decoration: const InputDecoration(
                            border: UnderlineInputBorder(),
                            labelText: 'Colour',
                          ),
                          validator: (value) {
                            if(value == null || value.isEmpty)
                              return 'The colour field is required.';
                            return null;
                          },
                        ),
                      ),
                      ConstrainedBox(
                        constraints: BoxConstraints.tight(const Size(170, 100)),
                        child: TextFormField(
                          decoration: const InputDecoration(
                            border: UnderlineInputBorder(),
                            labelText: 'Doors',
                          ),
                          validator: (value) {
                            if(value == null || value.isEmpty)
                              return 'The doors field is required.';
                            else if(!isNumeric(value))
                              return 'The doors must be an integer.';
                            return null;
                          },
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
                    validator: (value) {
                            if(value == null || value.isEmpty)
                              return 'The engine cylinders field is required.';
                            else if(!isNumeric(value))
                              return 'The engine cylinders must be an integer.';
                            return null;
                          },
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
        ),
      )
    );
  }
}

