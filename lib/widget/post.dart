import 'package:flutter/material.dart';
import '../views/post_page.dart';

class Cards extends StatelessWidget {
  const Cards({
    Key? key,
    required this.idPost,
    required this.title,
    required this.price,
    required this.image,
    required this.sale,
    required this.isFavorite
  }) : super(key: key);
  final int idPost;
  final String title;
  final String price;
  final String image;
  final bool sale;
  final bool isFavorite;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => PostPage(
                      idPost: idPost,
                      title: title,
                      image: image,
                      price: price,
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
                price,
                style: const TextStyle(color: Colors.grey),
              ),
            ),
          ],
        ),
      ),
    );
  }
}