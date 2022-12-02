import 'package:flutter/material.dart';
import 'package:wheels/views/Auth/login.dart';
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
                    icon: 'http://192.168.100.184/storage/images/BodyType/seMzQm4H6FEzO9QGyOqBnQTKHVVSsUSAeRfV8irb.png',
                  ),
                  BodyType(
                    name: 'Hatchback',
                    icon: 'https://cdn-icons-png.flaticon.com/512/55/55308.png',
                  ),
                  BodyType(
                    name: 'Coupe',
                    icon: 'https://static.thenounproject.com/png/2020250-200.png',
                  ),
                  BodyType(
                    name: 'Supercar',
                    icon: 'https://cdn-icons-png.flaticon.com/512/55/55216.png',
                  ),
                  BodyType(
                    name: 'Pickup',
                    icon: 'https://cdn-icons-png.flaticon.com/512/55/55277.png',
                  ),
                  BodyType(
                    name: 'Minivan',
                    icon: 'https://cdn-icons-png.flaticon.com/512/55/55349.png',
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
                  idPost: 1,
                  image:
                      'https://www.cnet.com/a/img/resize/4476006d1312ec379ee616af256b7596321b3742/hub/2021/08/20/257caf0a-f3a2-45db-9c70-d6ed50a85e6f/2021-toyota-camry-trd-ogi-1.jpg?auto=webp&fit=crop&height=900&width=1200',
                  title: 'toyota camry TRD 2021',
                  price: '25000 BHD',
                  sale: true,
                  isFavorite: true,
                ),
                Cards(
                  idPost: 1,
                  image:
                      'https://admin.saudiauto.com.sa/uploads/21/06/ABDO/3/2022-Toyota-GR-Supra-Special-Edition-4-Copy.jpg?1622717233581',
                  title: 'toyota sopra 2022',
                  price: '40000 BHD',
                  sale: false,
                  isFavorite: false,
                ),
                Cards(
                  idPost: 1,
                  image:
                      'https://www.platinumautohaus.com/imagetag/13881/7/l/Used-2018-Mercedes-Benz-G-Class-AMG-G-63.jpg',
                  title: 'Mercedes G-class 2018',
                  price: '30000 BHD',
                  sale: true,
                  isFavorite: false,
                ),
                Cards(
                  idPost: 1,
                  image:
                      'https://www.autotrader.com/wp-content/uploads/2022/03/2008-Mitsubsihi-Lancer-Evolution-MR.jpg?w=1024',
                  title: 'Mitsubishi Lancer Evo 2008',
                  price: '5000 BHD',
                  sale: true,
                  isFavorite: true,
                ),
                Cards(
                  idPost: 1,
                  image:
                      'https://www.newcartestdrive.com/wp-content/uploads/2020/04/2020_Dodge_Durango_hero-e1587422037900.jpg',
                  title: 'dodge durango 2020',
                  price: '9000 BHD',
                  sale: true,
                  isFavorite: false,
                ),
                Cards(
                  idPost: 1,
                  image:
                      'https://s.car.info/image_files/1920/chevrolet-camaro-front-side-1-783875.jpg',
                  title: 'Chevrolet Camaro SS 2013',
                  price: '3500 BHD',
                  sale: true,
                  isFavorite: false,
                ),
              ],
            )
          ],
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

