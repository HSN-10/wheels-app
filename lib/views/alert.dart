import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:wheels/models/alert.dart';
import 'package:wheels/views/create_alert.dart';
import 'package:http/http.dart' as http;
import '../models/latest_post.dart';
import '../services/globals.dart';
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

  deleteAlert(id) async {
    http.Response response = await RemoteService().deleteAlert(id);
    Map responseMap = jsonDecode(response.body);
    if (response.statusCode == 200) {
      refresh();
    } else {
      errorSnackBar(context, responseMap.values.first.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Alerts"),
        backgroundColor: Colors.green,
        actions: [
          IconButton(
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CreateAlertScreen())),
              icon: const Icon(Icons.add))
        ],
      ),
      body: loading
          ? Center(child: const CircularProgressIndicator())
          : Wrap(
              children: List.generate(
                  alert.length,
                  (i) => AlertWidget(
                        id: alert[i].id,
                        price_from: alert[i].priceFrom,
                        price_to: alert[i].priceTo,
                        maker: alert[i].maker.toString(),
                        model: alert[i].model.toString(),
                        years: alert[i].years.toString(),
                        colour: alert[i].colour.toString(),
                        delete: IconButton(
                          onPressed: () async {
                            deleteAlert(alert[i].id);
                          },
                          icon: Icon(Icons.delete),
                          color: Colors.red,
                        ),
                      ))),
    );
  }
}
