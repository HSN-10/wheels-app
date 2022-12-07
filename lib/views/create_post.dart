import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

import '../services/globals.dart';
import '../services/remote_service.dart';

const List<String> transmission = <String>['Manual', 'Automatic'];
const List<String> condition = <String>['New', 'Used', 'Scrap'];
const List<String> gasType = <String>['Diesel', 'Jayyid', 'Mumtaz', 'Super'];
const List<String> postType = <String>['Request', 'Sale'];
const List<String> negotiable = <String>['Non-negotiable', 'Negotiable'];
const apiURL = "http://192.168.100.184/api/";
class CreatePost extends StatefulWidget {
  const CreatePost({Key? key}) : super(key: key);

  @override
  _CreatePostState createState() => _CreatePostState();
}

class _CreatePostState extends State<CreatePost> {
  List bodyType = [];
  bool loading = true;
  
  late String title;
  late String? description = "";
  late int price;
  late String postTypeValue = postType.first;
  late String negotiableValue = negotiable.first;
  late String maker;
  late String model;
  late int years;
  late int kilometrage;
  late String transmissionValue = transmission.first;
  late String conditionValue = condition.first;
  late int number_of_owners;
  late int number_of_accidents;
  late int bodyTypeValue;
  late String colour;
  late int doors;
  late int engine_cylinders;
  late String gasTypeValue = gasType.first;
  
create_post() async {
    http.Response response = await RemoteService().create_post(
      title,
      description!,
      price,
      negotiable.indexOf(negotiableValue),
      maker,
      model,
      colour,
      years,
      bodyTypeValue,
      transmission.indexOf(transmissionValue),
      kilometrage,
      gasType.indexOf(gasTypeValue),
      doors,
      engine_cylinders,
      condition.indexOf(conditionValue),
      number_of_owners,
      number_of_accidents,
      postType.indexOf(postTypeValue)
    );
    Map responseMap = jsonDecode(response.body);
    if (response.statusCode == 201) {
      print(responseMap.values.last);
      Navigator.pop(context);
    } else {
      print(response.statusCode);
      errorSnackBar(context, responseMap.values.first[0].toString());
    }
  }

  Future getBodyTypes() async {
    var baseUrl = "${apiURL}bodyType";

    http.Response response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      setState(() {
        bodyType = jsonData;
      });
    }
  }
@override
  void initState() {
    setState(() {
      bodyTypeValue = 1;
    });
    getBodyTypes();
    loading = false;
    super.initState();
  }

  PickedFile? _pickedFile;
  ImagePicker _picker = ImagePicker();

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
            IconButton(
                onPressed: create_post,
                icon: const Icon(Icons.add))
          ],
        ),
        body: loading? CircularProgressIndicator() : SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    "Post Detalis",
                    style: TextStyle(fontSize: 18),
                  ),
                  Container(
                    color: Colors.white,
                    child: Column(children: [
                      const SizedBox(
                        height: 15,
                      ),
                      GestureDetector(
                        child: const Text("Select An Image"),
                        onTap: () async {
                          _pickedFile = await _picker.getImage(
                              source: ImageSource.gallery);
                          if (_pickedFile != null) {
                          }
                        },
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: 'Title',
                        ),
                        onChanged: (value) => title = value,
                        validator: (value) {
                          if (value == null || value.isEmpty)
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
                        onChanged: (value) => description = value,
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: 'Price',
                        ),
                        onChanged: (value) => price = int.parse(value),
                        validator: (value) {
                          if (value == null || value.isEmpty)
                            return 'The price field is required.';
                          else if (!isNumeric(value))
                            return 'The price must be an integer.';
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: const [
                          Text("Post Type"),
                        ],
                      ),
                      DropdownButton(
                        items: postType
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        hint: const Text("Select Post Type"),
                        value: postTypeValue,
                        onChanged: (String? value) {
                          setState(() {
                            postTypeValue = value!;
                          });
                        },
                        isExpanded: true,
                      ),
                      SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: const [
                            Text("Negotiable"),
                          ],
                        ),
                        DropdownButton(
                          hint: const Text("Select Negotiable"),
                          items: negotiable
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          value: negotiableValue,
                          onChanged: (String? value) {
                            setState(() {
                              negotiableValue = value!;
                            });
                          },
                          isExpanded: true,
                        ),
                    ]),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Vehicle",
                    style: TextStyle(fontSize: 18),
                  ),
                  Container(
                    color: Colors.white,
                    child: Column(children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ConstrainedBox(
                            constraints:
                                BoxConstraints.tight(const Size(170, 100)),
                            child: TextFormField(
                              decoration: const InputDecoration(
                                border: UnderlineInputBorder(),
                                labelText: 'Maker',
                              ),
                              onChanged: (value) => maker = value,
                              validator: (value) {
                                if (value == null || value.isEmpty)
                                  return 'The maker field is required.';
                                return null;
                              },
                            ),
                          ),
                          ConstrainedBox(
                            constraints:
                                BoxConstraints.tight(const Size(170, 100)),
                            child: TextFormField(
                              decoration: const InputDecoration(
                                border: UnderlineInputBorder(),
                                labelText: 'Model',
                              ),
                              onChanged: (value) => model = value,
                              validator: (value) {
                                if (value == null || value.isEmpty)
                                  return 'The model field is required.';
                                return null;
                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ConstrainedBox(
                            constraints:
                                BoxConstraints.tight(const Size(170, 100)),
                            child: TextFormField(
                              decoration: const InputDecoration(
                                border: UnderlineInputBorder(),
                                labelText: 'Year',
                              ),
                              onChanged: (value) => years = int.parse(value),
                              validator: (value) {
                                if (value == null || value.isEmpty)
                                  return 'The year field is required.';
                                else if (!isNumeric(value))
                                  return 'The year must be an integer.';
                                return null;
                              },
                            ),
                          ),
                          ConstrainedBox(
                            constraints:
                                BoxConstraints.tight(const Size(170, 100)),
                            child: TextFormField(
                              decoration: const InputDecoration(
                                border: UnderlineInputBorder(),
                                labelText: 'Kilometrage',
                              ),
                              onChanged: (value) => kilometrage = int.parse(value),
                              validator: (value) {
                                if (value == null || value.isEmpty)
                                  return 'The kilometrage field is required.';
                                else if (!isNumeric(value))
                                  return 'The kilometrage must be an integer.';
                                return null;
                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: const [
                          Text("Transmission"),
                        ],
                      ),
                      DropdownButton(
                        items: transmission
                            .map<DropdownMenuItem<String>>((String value) {
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
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: const [
                          Text("Condition"),
                        ],
                      ),
                      DropdownButton(
                        items: condition
                            .map<DropdownMenuItem<String>>((String value) {
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
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ConstrainedBox(
                            constraints:
                                BoxConstraints.tight(const Size(170, 100)),
                            child: TextFormField(
                              decoration: const InputDecoration(
                                border: UnderlineInputBorder(),
                                labelText: 'Number Of Owners',
                              ),
                              onChanged: (value) => number_of_owners = int.parse(value),
                              validator: (value) {
                                if (value == null || value.isEmpty)
                                  return 'The owners field is required.';
                                else if (!isNumeric(value))
                                  return 'The owners must be an integer.';
                                return null;
                              },
                            ),
                          ),
                          ConstrainedBox(
                            constraints:
                                BoxConstraints.tight(const Size(170, 100)),
                            child: TextFormField(
                              decoration: const InputDecoration(
                                border: UnderlineInputBorder(),
                                labelText: 'Number Of Accidents',
                              ),
                              onChanged: (value) => number_of_accidents = int.parse(value),
                              validator: (value) {
                                if (value == null || value.isEmpty)
                                  return 'The accidents field is required.';
                                else if (!isNumeric(value))
                                  return 'The accidents must be an integer.';
                                return null;
                              },
                            ),
                          ),
                        ],
                      ),
                    ]),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Body",
                    style: TextStyle(fontSize: 18),
                  ),
                  Container(
                      color: Colors.white,
                      child: Column(children: [
                        Row(
                          children: const [
                            Text("Body Type"),
                          ],
                        ),
                        DropdownButton(
                          hint: const Text("Select Body Type"),
                          items: bodyType
                              .map((value) {
                            return DropdownMenuItem(
                              value: value['id'],
                              child: Text(value['name']),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              bodyTypeValue = value as int;
                            });
                          },
                          value: bodyTypeValue,
                          isExpanded: true,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            ConstrainedBox(
                              constraints:
                                  BoxConstraints.tight(const Size(170, 100)),
                              child: TextFormField(
                                decoration: const InputDecoration(
                                  border: UnderlineInputBorder(),
                                  labelText: 'Colour',
                                ),
                                onChanged: (value) => colour = value,
                                validator: (value) {
                                  if (value == null || value.isEmpty)
                                    return 'The colour field is required.';
                                  return null;
                                },
                              ),
                            ),
                            ConstrainedBox(
                              constraints:
                                  BoxConstraints.tight(const Size(170, 100)),
                              child: TextFormField(
                                decoration: const InputDecoration(
                                  border: UnderlineInputBorder(),
                                  labelText: 'Doors',
                                ),
                                onChanged: (value) => doors = int.parse(value),
                                validator: (value) {
                                  if (value == null || value.isEmpty)
                                    return 'The doors field is required.';
                                  else if (!isNumeric(value))
                                    return 'The doors must be an integer.';
                                  return null;
                                },
                              ),
                            ),
                          ],
                        ),
                      ])),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Engine",
                    style: TextStyle(fontSize: 18),
                  ),
                  Container(
                      color: Colors.white,
                      child: Column(children: [
                        TextFormField(
                          decoration: const InputDecoration(
                            border: UnderlineInputBorder(),
                            labelText: 'Engine Cylinders',
                          ),
                          onChanged: (value) => engine_cylinders = int.parse(value),
                          validator: (value) {
                            if (value == null || value.isEmpty)
                              return 'The engine cylinders field is required.';
                            else if (!isNumeric(value))
                              return 'The engine cylinders must be an integer.';
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: const [
                            Text("Gas Type"),
                          ],
                        ),
                        DropdownButton(
                          hint: const Text("Select Gas Type"),
                          items: gasType
                              .map<DropdownMenuItem<String>>((String value) {
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
                      ]))
                ],
              ),
            ),
          ),
        ));
  }
}
