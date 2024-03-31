import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:train2/model/GetAllTripRes.dart';

class ShowTripsPage extends StatefulWidget {
  const ShowTripsPage({super.key});

  @override
  State<ShowTripsPage> createState() => _ShowTripsPageState();
}

class _ShowTripsPageState extends State<ShowTripsPage> {
  late Future<void> loadData;

  List<GetAllTripRes> trips = [];

  @override
  initState() {
    super.initState();
    loadData = loadDataAsync();
  }

  Future<void> loadDataAsync() async {
    var res = await http
        .get(Uri.parse("https://cslab.it.msu.ac.th/tripbooking/trip"));
    List<GetAllTripRes> data = getAllTripResFromJson(res.body);
    setState(() {
      trips = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("รายการทริป"),
      ),
      body: SingleChildScrollView(
        child: FutureBuilder(
            future: loadData,
            builder: (context, snapshot) {
              if (snapshot.connectionState != ConnectionState.done) {
                return const Center(child: CircularProgressIndicator());
              } else {
                return Column(
                  children: trips.map((trip) {
                    return Text(trip.name.toString());
                  }).toList(),
                );
              }
            }),
      ),
    );
  }
}
