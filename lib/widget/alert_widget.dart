import 'package:flutter/material.dart';

class AlertWidget extends StatelessWidget {
  const AlertWidget({
    Key? key,
  }) : super(key: key);

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
                Text('Test'),
                Text('Test'),
                Text('Test'),
              ]
            ),
            const SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('Test'),
                Text('Test'),
                Text('Test'),
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