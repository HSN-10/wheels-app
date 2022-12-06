import 'dart:ffi';

import 'package:flutter/material.dart';

class AlertWidget extends StatelessWidget {
  const AlertWidget({
    Key? key,
    required this.id,
    required this.price_from,
    required this.price_to,
    required this.maker,
    required this.model,
    required this.colour,
    required this.years,
  }) : super(key: key);
  final int id;
  final int price_from;
  final int price_to;
  final String maker;
  final String model;
  final String colour;
  final String years;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10.0, top: 20, bottom: 10, right: 10),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white
        ),
        child: Column(
          children: [
            const SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(price_from.toString()),
                Text(maker),
                Text(colour),
              ]
            ),
            const SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(price_to.toString()),
                Text(model),
                Text(years.toString()),
              ]
            ),
            const SizedBox(height: 10,),
            IconButton(onPressed: ()=>{}, icon: Icon(Icons.delete), color: Colors.red,),
          ],
        ),
      ),
    );
  }
}