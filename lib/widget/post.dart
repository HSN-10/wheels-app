import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../views/post_page.dart';

class Cards extends StatelessWidget {
  const Cards({
    Key? key,
    required this.carname,
    required this.carprice,
    required this.carimage,
    required this.sale,
  }) : super(key: key);
  final String carname;
  final String carprice;
  final String carimage;
  final bool sale;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => PostPage(
                      title: carname,
                      image: carimage,
                      price: carprice,
                    )),
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(children: [
              Image.network(
                  width: MediaQuery.of(context).size.width / 2.2, carimage),
              Positioned(
                  top: 10,
                  left: 0,
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(8),
                            bottomRight: Radius.circular(8)),
                        color: sale ? Colors.green : Colors.yellow),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 5.0, right: 10, top: 2, bottom: 2),
                      child: Text(
                        sale ? 'Sale' : 'Request',
                        style: TextStyle(
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  )),
              Positioned(
                right: 0,
                child: IconButton(onPressed: (){
                  
                }, 
                icon: Icon(Icons.favorite_border),
                color: Colors.white,
                highlightColor: Colors.white,
                ),
              )
            ]),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                carname,
                style: TextStyle(color: Colors.blue),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, top: 0, bottom: 10),
              child: Text(
                carprice,
                style: TextStyle(color: Colors.grey),
              ),
            ),
          ],
        ),
      ),
    );
  }
}