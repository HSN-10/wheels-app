import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

import '../services/globals.dart';
import '../services/remote_service.dart';

const List<String> transmission = <String>['Manual', 'Automatic'];
const List<String> condition = <String>['New', 'Used', 'Scrap'];
const List<String> gasType = <String>['Diesel', 'Jayyid', 'Mumtaz', 'Super'];

const apiURL = "http://192.168.100.184/api/";
class CreateAlertScreen extends StatefulWidget {
  const CreateAlertScreen({Key? key}) : super(key: key);

  @override
  _CreateAlertScreenState createState() => _CreateAlertScreenState();
}

class _CreateAlertScreenState extends State<CreateAlertScreen> {
  List bodyType = [];
  bool loading = true;
  
  late int price_from;
  late int price_to;
  late String maker;
  late String model;
  late int years;
  late int kilometrage;
  late String transmissionValue = transmission.first;
  late String conditionValue = condition.first;
  late var bodyTypeValue;
  late String colour;
  late int doors;
  late int engine_cylinders;
  late String gasTypeValue = gasType.first;
  

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
    super.initState();
    getBodyTypes();
    loading = false;
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
          title: const Text("Create Alert"),
          backgroundColor: Colors.green,
          actions: [
            IconButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    
                  }
                },
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
                    "Alert Detalis",
                    style: TextStyle(fontSize: 18),
                  ),
                  Container(
                    color: Colors.white,
                    child: Column(children: [
                      const SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: 'Price From',
                        ),
                        onChanged: (value) => price_from = int.parse(value),
                        validator: (value) {
                          if (value == null || value.isEmpty)
                            return 'The price field is required.';
                          else if (!isNumeric(value))
                            return 'The price must be an integer.';
                          return null;
                        },
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: 'Price To',
                        ),
                        onChanged: (value) => price_to = int.parse(value),
                        validator: (value) {
                          if (value == null || value.isEmpty)
                            return 'The price field is required.';
                          else if (!isNumeric(value))
                            return 'The price must be an integer.';
                          return null;
                        },
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
                              bodyTypeValue = value;
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
