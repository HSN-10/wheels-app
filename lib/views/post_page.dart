import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/body_type.dart';
import '../models/user.dart';

class PostPage extends StatefulWidget {
  const PostPage({super.key, required this.idPost, required this.title, required this.image, required this.price, required this.description, required this.user, required this.negotiable, required this.typePost, required this.maker, required this.model, required this.colour, required this.years, required this.bodyType, required this.transmissionType, required this.kilometrage, required this.gasType, required this.doors, required this.engineCylinders, required this.condition, required this.numberOfOwners, required this.numberOfAccidents, required this.createdAt, required this.updatedAt});
  final int idPost;
  final String title;
  final String description;
  final User user;
  final int price;
  final bool negotiable;
  final String image;
  final String typePost;
  final String maker;
  final String model;
  final String colour;
  final int years;
  final BodyType bodyType;
  final String transmissionType;
  final int kilometrage;
  final String gasType;
  final int doors;
  final int engineCylinders;
  final String condition;
  final int numberOfOwners;
  final int numberOfAccidents;
  final DateTime createdAt;
  final DateTime updatedAt;
  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.green,
        ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
        Image.network(
          widget.image,
          width: MediaQuery.of(context).size.width,
          height: 180,
          fit: BoxFit.cover,
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8.0, left: 10.0),
              child: Text(
                widget.title,
                style: GoogleFonts.averiaLibre(
                    fontSize: 20, fontWeight: FontWeight.bold
                    ),
              ),
            )
          ],
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left:15.0, bottom: 8.0, top: 5),
              child: Text(
                widget.price.toString(),
                style: GoogleFonts.averiaLibre(
                    fontSize: 18, fontWeight: FontWeight.bold,
                    color: Colors.grey),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 10, top: 7,bottom: 8),
              child: Text("Negotiable", style: TextStyle(color: Colors.blueGrey),),
              )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
              onPressed: () => print('call'),
              style:
                  ElevatedButton.styleFrom(backgroundColor: Colors.green),
              child: Row(
                children: const [
                  SizedBox(
                    width: 35,
                  ),
                  Text('Call To Order'),
                  SizedBox(
                    width: 35,
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () => print('conuter offer'),
              style:
                  ElevatedButton.styleFrom(backgroundColor: Colors.green),
              child: Row(
                children: const [
                  SizedBox(
                    width: 35,
                  ),
                  Text('Counter Offer'),
                  SizedBox(
                    width: 35,
                  ),
                ],
              ),
            )
          ],
        ),
        const SizedBox(height: 15,),
        Container(
          color: Colors.white,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Condition',
                      style: GoogleFonts.adamina(
                          fontWeight: FontWeight.bold,
                          color: const Color.fromARGB(255, 0, 53, 97)),
                    ),
                    Text(
                      widget.condition,
                      style: GoogleFonts.adamina(
                          fontWeight: FontWeight.bold,
                          color: const Color.fromARGB(255, 0, 53, 97)),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Maker',
                      style: GoogleFonts.adamina(
                          fontWeight: FontWeight.bold,
                          color: const Color.fromARGB(255, 0, 53, 97)),
                    ),
                    Text(
                      widget.maker,
                      style: GoogleFonts.adamina(
                          fontWeight: FontWeight.bold,
                          color: const Color.fromARGB(255, 0, 53, 97)),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Model',
                      style: GoogleFonts.adamina(
                          fontWeight: FontWeight.bold,
                          color: const Color.fromARGB(255, 0, 53, 97)),
                    ),
                    Text(
                      widget.model,
                      style: GoogleFonts.adamina(
                          fontWeight: FontWeight.bold,
                          color: const Color.fromARGB(255, 0, 53, 97)),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Year',
                      style: GoogleFonts.adamina(
                          fontWeight: FontWeight.bold,
                          color: const Color.fromARGB(255, 0, 53, 97)),
                    ),
                    Text(
                      widget.years.toString(),
                      style: GoogleFonts.adamina(
                          fontWeight: FontWeight.bold,
                          color: const Color.fromARGB(255, 0, 53, 97)),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Body Type',
                      style: GoogleFonts.adamina(
                          fontWeight: FontWeight.bold,
                          color: const Color.fromARGB(255, 0, 53, 97)),
                    ),
                    Text(
                      widget.bodyType.name,
                      style: GoogleFonts.adamina(
                          fontWeight: FontWeight.bold,
                          color: const Color.fromARGB(255, 0, 53, 97)),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Transmission',
                      style: GoogleFonts.adamina(
                          fontWeight: FontWeight.bold,
                          color: const Color.fromARGB(255, 0, 53, 97)),
                    ),
                    Text(
                      widget.transmissionType,
                      style: GoogleFonts.adamina(
                          fontWeight: FontWeight.bold,
                          color: const Color.fromARGB(255, 0, 53, 97)),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Kilometrage',
                      style: GoogleFonts.adamina(
                          fontWeight: FontWeight.bold,
                          color: const Color.fromARGB(255, 0, 53, 97)),
                    ),
                    Text(
                      widget.kilometrage.toString(),
                      style: GoogleFonts.adamina(
                          fontWeight: FontWeight.bold,
                          color: const Color.fromARGB(255, 0, 53, 97)),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Engine Cylinders',
                      style: GoogleFonts.adamina(
                          fontWeight: FontWeight.bold,
                          color: const Color.fromARGB(255, 0, 53, 97)),
                    ),
                    Text(
                      widget.engineCylinders.toString(),
                      style: GoogleFonts.adamina(
                          fontWeight: FontWeight.bold,
                          color: const Color.fromARGB(255, 0, 53, 97)),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Gas Type',
                      style: GoogleFonts.adamina(
                          fontWeight: FontWeight.bold,
                          color: const Color.fromARGB(255, 0, 53, 97)),
                    ),
                    Text(
                      widget.gasType,
                      style: GoogleFonts.adamina(
                          fontWeight: FontWeight.bold,
                          color: const Color.fromARGB(255, 0, 53, 97)),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Doors',
                      style: GoogleFonts.adamina(
                          fontWeight: FontWeight.bold,
                          color: const Color.fromARGB(255, 0, 53, 97)),
                    ),
                    Text(
                      widget.doors.toString(),
                      style: GoogleFonts.adamina(
                          fontWeight: FontWeight.bold,
                          color: const Color.fromARGB(255, 0, 53, 97)),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Number of Owners',
                      style: GoogleFonts.adamina(
                          fontWeight: FontWeight.bold,
                          color: const Color.fromARGB(255, 0, 53, 97)),
                    ),
                    Text(
                      widget.numberOfOwners.toString(),
                      style: GoogleFonts.adamina(
                          fontWeight: FontWeight.bold,
                          color: const Color.fromARGB(255, 0, 53, 97)),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Number of Accidents',
                      style: GoogleFonts.adamina(
                          fontWeight: FontWeight.bold,
                          color: const Color.fromARGB(255, 0, 53, 97)),
                    ),
                    Text(
                      widget.numberOfAccidents.toString(),
                      style: GoogleFonts.adamina(
                          fontWeight: FontWeight.bold,
                          color: const Color.fromARGB(255, 0, 53, 97)),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 15,),
        Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.only(top: 15.0, left: 8, right: 8),
            child: Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Description',
                      style: GoogleFonts.adamina(
                          fontWeight: FontWeight.bold,
                          color: const Color.fromARGB(255, 0, 53, 97),
                          fontSize: 16),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width - 32,
                        child: Text(
                          widget.description,
                          style: GoogleFonts.adamina(
                              fontWeight: FontWeight.bold,
                              color: const Color.fromARGB(255, 0, 53, 97)),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 15,),
        Container(
          width: MediaQuery.of(context).size.width/1.1,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.white
          ),

          //color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                    CircleAvatar(
                      radius: 38,
                      child: ClipOval(
                        child: Image.asset(
                          'assets/images/user.jpg',
                          width: 150,
                          height: 150,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ), 
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: 
                      Text(
                        widget.user.name,
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                            color: Colors.green),
                      ),
                )
              ],
            ),
          ),
        ),
        const SizedBox(height: 50,)
          ],
        ),
      ),
    );
  }
}
