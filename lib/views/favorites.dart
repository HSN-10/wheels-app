import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../models/latest_post.dart';
import '../services/remote_service.dart';
import '../widget/post.dart';

class favorites extends StatefulWidget {
  const favorites({super.key});

  @override
  State<favorites> createState() => _favoritesState();
}

class _favoritesState extends State<favorites> {
  late List<LatestPost> latestPost = [];
  bool loading = true;
  final storage = new FlutterSecureStorage();
  String? token;
  @override
  void initState() {
    latestPost = [];
    getData();
    super.initState();
  }

  Future refresh() async {
    setState(() {
      getData();
    });
  }

  getData() async {
    latestPost = (await RemoteService().getFavotites())!.cast<LatestPost>();
    setState(() {
      loading = false;
    });
    token = await storage.read(key: 'token');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favorites"),
        backgroundColor: Colors.green,
      ),
      body: loading
          ? CircularProgressIndicator()
          : Wrap(
              children: List.generate(
                  latestPost.length,
                  (i) => PostWidget(
                      idPost: latestPost[i].id,
                      title: latestPost[i].title,
                      description: latestPost[i].description,
                      user: latestPost[i].user,
                      price: latestPost[i].price,
                      image: latestPost[i].image,
                      isFavorite: false,
                      negotiable: latestPost[i].negotiable,
                      typePost: latestPost[i].typePost,
                      maker: latestPost[i].maker,
                      model: latestPost[i].model,
                      colour: latestPost[i].colour,
                      years: latestPost[i].years,
                      bodyType: latestPost[i].bodyType,
                      transmissionType: latestPost[i].transmissionType,
                      kilometrage: latestPost[i].kilometrage,
                      gasType: latestPost[i].gasType,
                      doors: latestPost[i].doors,
                      engineCylinders: latestPost[i].engineCylinders,
                      condition: latestPost[i].condition,
                      numberOfOwners: latestPost[i].numberOfOwners,
                      numberOfAccidents: latestPost[i].numberOfAccidents,
                      createdAt: latestPost[i].createdAt,
                      updatedAt: latestPost[i].updatedAt))),
    );
  }
}
