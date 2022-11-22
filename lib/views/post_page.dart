import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PostPage extends StatefulWidget {
  const PostPage({super.key, required this.title, required this.image, required this.price});
  final String title;
  final String image;
  final String price;
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
        child: Container(
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
                    widget.price,
                    style: GoogleFonts.averiaLibre(
                        fontSize: 18, fontWeight: FontWeight.bold,
                        color: Colors.grey),
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () => print('call'),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 35,
                      ),
                      Text('Call To Order'),
                      SizedBox(
                        width: 35,
                      ),
                    ],
                  ),
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.green),
                ),
                ElevatedButton(
                  onPressed: () => print('conuter offer'),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 35,
                      ),
                      Text('Counter Offer'),
                      SizedBox(
                        width: 35,
                      ),
                    ],
                  ),
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.green),
                )
              ],
            ),
            SizedBox(height: 15,),
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
                              color: Color.fromARGB(255, 0, 53, 97)),
                        ),
                        Text(
                          'Used',
                          style: GoogleFonts.adamina(
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 0, 53, 97)),
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
                              color: Color.fromARGB(255, 0, 53, 97)),
                        ),
                        Text(
                          'Tyota',
                          style: GoogleFonts.adamina(
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 0, 53, 97)),
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
                              color: Color.fromARGB(255, 0, 53, 97)),
                        ),
                        Text(
                          '2021',
                          style: GoogleFonts.adamina(
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 0, 53, 97)),
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
                              color: Color.fromARGB(255, 0, 53, 97)),
                        ),
                        Text(
                          'Sedan',
                          style: GoogleFonts.adamina(
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 0, 53, 97)),
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
                              color: Color.fromARGB(255, 0, 53, 97)),
                        ),
                        Text(
                          'Automatic',
                          style: GoogleFonts.adamina(
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 0, 53, 97)),
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
                              color: Color.fromARGB(255, 0, 53, 97)),
                        ),
                        Text(
                          '5000 km',
                          style: GoogleFonts.adamina(
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 0, 53, 97)),
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
                              color: Color.fromARGB(255, 0, 53, 97)),
                        ),
                        Text(
                          '8',
                          style: GoogleFonts.adamina(
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 0, 53, 97)),
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
                              color: Color.fromARGB(255, 0, 53, 97)),
                        ),
                        Text(
                          'Mumtaz',
                          style: GoogleFonts.adamina(
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 0, 53, 97)),
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
                              color: Color.fromARGB(255, 0, 53, 97)),
                        ),
                        Text(
                          '4',
                          style: GoogleFonts.adamina(
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 0, 53, 97)),
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
                              color: Color.fromARGB(255, 0, 53, 97)),
                        ),
                        Text(
                          '2',
                          style: GoogleFonts.adamina(
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 0, 53, 97)),
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
                              color: Color.fromARGB(255, 0, 53, 97)),
                        ),
                        Text(
                          '0',
                          style: GoogleFonts.adamina(
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 0, 53, 97)),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 15,),
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
                              color: Color.fromARGB(255, 0, 53, 97),
                              fontSize: 16),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width - 32,
                            child: Text(
                              'This car is excellent but there are no defects and maintained and there are no incidents',
                              style: GoogleFonts.adamina(
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 0, 53, 97)),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 15,),
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
                        child: Image.network(
                          'https://www.prajwaldesai.com/wp-content/uploads/2021/02/Find-Users-Last-Logon-Time-using-4-Easy-Methods.jpg',
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
                            'Ali Hussain',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                                color: Colors.green),
                          ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 50,)
          ],
        )
        ),
      ),
    );
  }
}
