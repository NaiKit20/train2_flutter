import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:train2/model/GetAllTripRes.dart';

class TripDetailPage extends StatefulWidget {
  final int tripId;
  const TripDetailPage({super.key, required this.tripId});

  @override
  State<TripDetailPage> createState() => _TripDetailPageState();
}

class _TripDetailPageState extends State<TripDetailPage> {
  late GetAllTripRes trip;
  late Future<void> loadData;

  @override
  void initState() {
    super.initState();
    loadData = loadDataAsync();
  }

  Future<void> loadDataAsync() async {
    var res = await http.get(Uri.parse(
        "https://cslab.it.msu.ac.th/tripbooking/trip/${widget.tripId}"));
    List<GetAllTripRes> data = getAllTripResFromJson(res.body);
    trip = data.first;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("รายละเอียดทริป"),
      ),
      body: FutureBuilder(
          future: loadData,
          builder: (context, snapShot) {
            if (snapShot.connectionState != ConnectionState.done) {
              return const Center(child: CircularProgressIndicator());
            }
            return Column(
              children: [
                Image.network(trip.coverimage),
                Text(trip.name),
                Row(
                  children: [
                    // Icon(),
                    Text(trip.country),
                    FilledButton(
                        onPressed: () {},
                        child: Text("${trip.price.toString()} บาท"))
                  ],
                )
              ],
            );
          }),
    );
  }
}
