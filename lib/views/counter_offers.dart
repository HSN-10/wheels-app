import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:wheels/models/alert.dart';
import 'package:wheels/models/counter_offers.dart';
import 'package:wheels/views/create_alert.dart';

import '../models/latest_post.dart';
import '../services/remote_service.dart';
import '../widget/alert_widget.dart';
import '../widget/post.dart';

class CounterOffersScreen extends StatefulWidget {
  const CounterOffersScreen({super.key});

  @override
  State<CounterOffersScreen> createState() => _CounterOffersScreenState();
}

class _CounterOffersScreenState extends State<CounterOffersScreen> {
  late List<CounterOffers> counterOffers = [];
  bool loading = true;
  final storage = new FlutterSecureStorage();
  String? token;
  @override
  void initState() {
    counterOffers = [];
    getData();
    super.initState();
  }

  Future refresh() async {
    setState(() {
      getData();
    });
  }

  getData() async {
    counterOffers = (await RemoteService().getCounterOffers())!.cast<CounterOffers>();
    
    setState(() {
      loading = false;
    });
    token = await storage.read(key: 'token');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Counter Offers"),
        backgroundColor: Colors.green,
      ),
      body: loading
          ? const CircularProgressIndicator()
          : Wrap(
              children: []
              ),
    );
  }
}


