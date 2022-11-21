import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BodyType extends StatelessWidget {
  const BodyType({Key? key, required this.name, required this.icon})
      : super(
          key: key,
        );
  final String name;
  final String icon;
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 2),
      child: Card(
        child: SizedBox(
          height: 75,
          width: 75,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                  fit: BoxFit.cover,
                  icon,
                  width: 30),
              Text(
                name,
                style: GoogleFonts.lato(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
