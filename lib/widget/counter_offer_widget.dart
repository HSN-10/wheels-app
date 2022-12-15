import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;
import 'package:wheels/models/post.dart';
import '../models/user.dart';

class CounterOfferWidget extends StatelessWidget {
  const CounterOfferWidget({
    Key? key,
    required this.post,
    required this.price,
    required this.user,
  }) : super(key: key);
  final Post post;
  final int price;
  final User user;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          left: 10.0, top: 20, bottom: 10, right: 10),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.network(
                post.image,
                height: 120,
              ),
              const SizedBox(
                width: 5,
              ),
              Column(
                children: [
                  Column(
                    children: [
                      Text(
                        post.title,
                        style: const TextStyle(fontSize: 18),
                      ),
                      Text(price.toString(), style: const TextStyle(fontSize: 15),),
                    ],
                  ),
                  ElevatedButton(
                onPressed: () => UrlLauncher.launch("tel:+973${post.user.phone}"),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green),
                child: Row(
                  children: const [
                    Text('Call To Order'),
                  ],
                ),
              ),
                ],
              ),
              
            ]),
      ),
    );
  }
}
