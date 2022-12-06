import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:wheels/models/alert.dart';

import '../models/latest_post.dart';
import '../services/remote_service.dart';
import '../widget/alert_widget.dart';
import '../widget/post.dart';

class Alerts extends StatefulWidget {
  const Alerts({super.key});

  @override
  State<Alerts> createState() => _AlertsState();
}

class _AlertsState extends State<Alerts> {
  late List<Alert> alert = [];
  bool loading = true;
  final storage = new FlutterSecureStorage();
  String? token;
  @override
  void initState() {
    alert = [];
    getData();
    super.initState();
  }

  Future refresh() async {
    setState(() {
      getData();
    });
  }

  getData() async {
    alert = (await RemoteService().getAlerts())!.cast<Alert>();
    
    setState(() {
      loading = false;
    });
    token = await storage.read(key: 'token');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Alerts"),
        backgroundColor: Colors.green,
        actions: [
          IconButton(onPressed: ()=>{}, icon: Icon(Icons.add))
        ],
      ),
      body: loading
          ? CircularProgressIndicator()
          : Wrap(
              children: List.generate(alert.length, (i) => AlertWidget(
                id: alert[i].id,
                price_from: alert[i].priceFrom,
                price_to: alert[i].priceTo,
                maker: alert[i].maker.toString(),
                model: alert[i].model.toString(),
                years: alert[i].years.toString(), 
                colour: alert[i].colour.toString(),
                ))
              ),
    );
  }
}


