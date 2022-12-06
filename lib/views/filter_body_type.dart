import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:wheels/models/body_type.dart';
import 'package:wheels/models/latest_post.dart';
import 'package:wheels/services/remote_service.dart';
import 'package:wheels/views/Auth/login.dart';
import 'package:wheels/views/create_post.dart';
import 'package:wheels/views/favorites.dart';
import 'package:wheels/widget/post.dart';
import '../widget/body_types.dart';
import 'package:http/http.dart' as http;

import 'alert.dart';

class FilterBodyTypeScreen extends StatefulWidget {
  const FilterBodyTypeScreen({Key? key, required this.id, required this.name}) : super(key: key);

  final int id;
  final String name;
  @override
  _FilterBodyTypeScreenState createState() => _FilterBodyTypeScreenState();
}

class _FilterBodyTypeScreenState extends State<FilterBodyTypeScreen> {
  late List<LatestPost> latestPost;
  bool loading = true;
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
    latestPost = (await RemoteService().getFilterPosts(widget.id))!.cast<LatestPost>();
    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
        backgroundColor: Colors.green,
      ),
      body: loading
          ? CircularProgressIndicator()
          : RefreshIndicator(
              onRefresh: refresh,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 15.0,
                    ),
                    Wrap(
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
                                transmissionType:
                                    latestPost[i].transmissionType,
                                kilometrage: latestPost[i].kilometrage,
                                gasType: latestPost[i].gasType,
                                doors: latestPost[i].doors,
                                engineCylinders: latestPost[i].engineCylinders,
                                condition: latestPost[i].condition,
                                numberOfOwners: latestPost[i].numberOfOwners,
                                numberOfAccidents:
                                    latestPost[i].numberOfAccidents,
                                createdAt: latestPost[i].createdAt,
                                updatedAt: latestPost[i].updatedAt)))
                  ],
                ),
              ),
            ),
    );
  }
}
