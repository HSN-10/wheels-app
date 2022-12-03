import 'package:flutter/material.dart';
import '../views/post_page.dart';
import '../models/user.dart';
import '../models/body_type.dart';
class PostWidget extends StatelessWidget {
  const PostWidget({
    Key? key,
    required this.idPost, required this.title,
    required this.description, required this.user,
    required this.price, required this.image,
    required this.isFavorite, required this.negotiable,
    required this.typePost, required this.maker,
    required this.model, required this.colour,
    required this.years, required this.bodyType,
    required this.transmissionType, required this.kilometrage,
    required this.gasType, required this.doors,
    required this.engineCylinders, required this.condition,
    required this.numberOfOwners, required this.numberOfAccidents,
    required this.createdAt, required this.updatedAt
  }) : super(key: key);
  final int idPost;
  final String title;
  final String description;
  final User user;
  final int price;
  final bool negotiable;
  final String image;
  final String typePost;
  final String maker;
  final String model;
  final String colour;
  final int years;
  final BodyType bodyType;
  final String transmissionType;
  final int kilometrage;
  final String gasType;
  final int doors;
  final int engineCylinders;
  final String condition;
  final int numberOfOwners;
  final int numberOfAccidents;
  final DateTime createdAt;
  final DateTime updatedAt;
  final bool isFavorite;
  @override
  Widget build(BuildContext context) {
    bool sale = typePost == "Sale"? true:false;
    
    return Card(
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => PostPage(
                      idPost: idPost,
                      title: title,
                      description: description,
                      user:user,
                      price: price,
                      negotiable: negotiable,
                      image: image,
                      typePost: typePost,
                      maker: maker,
                      model: model,
                      colour: colour,
                      years: years,
                      bodyType: bodyType,
                      transmissionType: transmissionType,
                      kilometrage: kilometrage,
                      gasType: gasType,
                      doors: doors,
                      engineCylinders: engineCylinders,
                      condition: condition,
                      numberOfOwners: numberOfOwners,
                      numberOfAccidents: numberOfAccidents,
                      createdAt: createdAt,
                      updatedAt: updatedAt
                    )),
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(children: [
              Image.network(
                  width: MediaQuery.of(context).size.width / 2.2, image),
              Positioned(
                  top: 10,
                  left: 0,
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(8),
                            bottomRight: Radius.circular(8)),
                        color: sale ? Colors.green : Colors.yellow),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 5.0, right: 10, top: 2, bottom: 2),
                      child: Text(
                        sale ? 'Sale' : 'Request',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  )),
              Positioned(
                right: 0,
                child: IconButton(onPressed: (){
                  
                }, 
                icon: Icon(isFavorite?Icons.favorite:Icons.favorite_border),
                color: isFavorite?Colors.red:Colors.white,
                ),
              )
            ]),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                style: const TextStyle(color: Colors.blue),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, top: 0, bottom: 10),
              child: Text(
                price.toString(),
                style: const TextStyle(color: Colors.grey),
              ),
            ),
          ],
        ),
      ),
    );
  }
}