import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wheels/views/filter_body_type.dart';

class BodyTypeWidget extends StatelessWidget {
  const BodyTypeWidget({Key? key, required this.name, required this.icon, required this.id})
      : super(
          key: key,
        );
  final int id;
  final String name;
  final String icon;
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 2),
      child: GestureDetector(
        onTap: () => Navigator.push(context, MaterialPageRoute(builder: ((context) => FilterBodyTypeScreen(id: id, name: name,)))),
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
      ),
    );
  }
}
