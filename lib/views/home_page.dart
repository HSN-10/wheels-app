import 'package:flutter/material.dart';
import 'package:wheels/models/body_type.dart';
import 'package:wheels/models/latest_post.dart';
import 'package:wheels/services/remote_service.dart';
import 'package:wheels/views/Auth/login.dart';
import 'package:wheels/views/create_post.dart';
import 'package:wheels/widget/post.dart';
import '../widget/body_types.dart';

class HomePage extends StatefulWidget{
  const HomePage({Key? key}):super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<BodyType> bodyType;
  late List<LatestPost> latestPost;
  bool loading = true;
  @override
  void initState(){
    latestPost = [];
    bodyType = [];
    getData();
    super.initState();
  }
  Future refresh() async {
    setState(() {
      getData(); 
    });
  }
  getData() async{
    bodyType = (await RemoteService().getBodyTypes())!.cast<BodyType>();
    latestPost = (await RemoteService().getLatestPosts())!.cast<LatestPost>();
    setState(() {
      loading = false;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Wheels"),
        backgroundColor: Colors.green,
        actions: [
          IconButton(onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context) {
            return const Login();
          },)
          ), 
          icon: const Icon(Icons.notification_add), tooltip: "Search",),
          IconButton(onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context) {
            return const Login();
          },)
          ), 
          icon: const Icon(Icons.notification_add), tooltip: "Alert",),
          IconButton(onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context) {
            return const Login();
          },)
          ), icon: const Icon(Icons.favorite), tooltip: "Alert",),
          IconButton(onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context) {
            return const Login();
          },)
          ), icon: const Icon(Icons.login), tooltip: "Login",),
        ],
      ),
      body: loading? CircularProgressIndicator() : RefreshIndicator(
        onRefresh: refresh,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              const SizedBox(
                height: 15.0,
              ),
              const Text("Body Type", style: TextStyle(fontSize: 20)),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(bodyType.length, (i) => 
                  BodyTypeWidget(name: bodyType[i].name, icon: bodyType[i].icon)
                  )
                ),
              ),
              const SizedBox(
                height: 15.0,
              ),
              const Text("Last Posts", style: TextStyle(fontSize: 20)),
              Wrap(
                children: List.generate(latestPost.length, (i) => 
                  PostWidget(idPost: latestPost[i].id, title: latestPost[i].title,
                  description: latestPost[i].description, user: latestPost[i].user,
                  price: latestPost[i].price, image: latestPost[i].image,
                  isFavorite: false, negotiable: latestPost[i].negotiable,
                  typePost: latestPost[i].typePost, maker: latestPost[i].maker,
                  model: latestPost[i].model, colour: latestPost[i].colour,
                  years: latestPost[i].years, bodyType: latestPost[i].bodyType,
                  transmissionType: latestPost[i].transmissionType, kilometrage: latestPost[i].kilometrage,
                  gasType: latestPost[i].gasType, doors: latestPost[i].doors,
                  engineCylinders: latestPost[i].engineCylinders, condition: latestPost[i].condition,
                  numberOfOwners: latestPost[i].numberOfOwners, numberOfAccidents: latestPost[i].numberOfAccidents,
                  createdAt: latestPost[i].createdAt, updatedAt: latestPost[i].updatedAt)
                )
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) {
          return const CreatePost();
        },)
        ),
        tooltip: 'Create Post',
        backgroundColor: Colors.green,
        child: const Icon(Icons.add),
      ),
    );
  }
}

