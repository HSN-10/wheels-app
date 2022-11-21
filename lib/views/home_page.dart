import 'package:flutter/material.dart';
import 'package:wheels/views/create_post.dart';
import '../widget/body_types.dart';
import '../widget/post.dart';

class HomePage extends StatefulWidget{
  const HomePage({Key? key}):super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Wheels"),
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
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
                children: const [
                  BodyType(
                    name: 'Seden',
                    icon: 'https://upload.wikimedia.org/wikipedia/commons/thumb/6/65/Circle-icons-car.svg/1200px-Circle-icons-car.svg.png',
                  ),
                  BodyType(
                    name: 'Hatchback',
                    icon: 'https://upload.wikimedia.org/wikipedia/commons/thumb/6/65/Circle-icons-car.svg/1200px-Circle-icons-car.svg.png',
                  ),
                  BodyType(
                    name: 'Coupe',
                    icon: 'https://upload.wikimedia.org/wikipedia/commons/thumb/6/65/Circle-icons-car.svg/1200px-Circle-icons-car.svg.png',
                  ),
                  BodyType(
                    name: 'Supercar',
                    icon: 'https://upload.wikimedia.org/wikipedia/commons/thumb/6/65/Circle-icons-car.svg/1200px-Circle-icons-car.svg.png',
                  ),
                  BodyType(
                    name: 'Pickup',
                    icon: 'https://upload.wikimedia.org/wikipedia/commons/thumb/6/65/Circle-icons-car.svg/1200px-Circle-icons-car.svg.png',
                  ),
                  BodyType(
                    name: 'Minivan',
                    icon: 'https://upload.wikimedia.org/wikipedia/commons/thumb/6/65/Circle-icons-car.svg/1200px-Circle-icons-car.svg.png',
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15.0,
            ),
            const Text("Last Posts", style: TextStyle(fontSize: 20)),
            Wrap(
              children: const [
                Cards(
                  carimage:
                      'https://www.cnet.com/a/img/resize/4476006d1312ec379ee616af256b7596321b3742/hub/2021/08/20/257caf0a-f3a2-45db-9c70-d6ed50a85e6f/2021-toyota-camry-trd-ogi-1.jpg?auto=webp&fit=crop&height=900&width=1200',
                  carname: 'toyota camry TRD 2021',
                  carprice: '25000 BHD',
                  sale: true,
                ),
                Cards(
                  carimage:
                      'https://admin.saudiauto.com.sa/uploads/21/06/ABDO/3/2022-Toyota-GR-Supra-Special-Edition-4-Copy.jpg?1622717233581',
                  carname: 'toyota sopra 2022',
                  carprice: '40000 BHD',
                  sale: false,
                ),
              ],
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => setState(() => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CreatePost()),
          )),
        tooltip: 'Create Post',
        backgroundColor: Colors.green,
        child: const Icon(Icons.add),
      ),
    );
  }
}

