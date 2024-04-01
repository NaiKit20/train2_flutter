import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:train2/model/GetAllTripRes.dart';
import 'package:train2/pages/loginPage.dart';
import 'package:train2/pages/tripDetailPage.dart';
import 'package:train2/provider/appData.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class ShowTripsPage extends StatefulWidget {
  const ShowTripsPage({super.key});

  @override
  State<ShowTripsPage> createState() => _ShowTripsPageState();
}

class _ShowTripsPageState extends State<ShowTripsPage> {
  late Future<void> loadData;

  late String text;

  List<GetAllTripRes> trips = [];

  @override
  initState() {
    super.initState();

    // ดึงข้อมูลจาก LocalStorage
    // GetStorage gs = GetStorage();
    // text = gs.read("data") ?? "ไม่มีไรเลย";

    text = context.read<AppData>().username;

    loadData = loadTrips();
  }

  Future<void> loadTrips() async {
    var res = await http
        .get(Uri.parse("https://cslab.it.msu.ac.th/tripbooking/trip"));
    List<GetAllTripRes> data = getAllTripResFromJson(res.body);
    trips = data;
  }

  Future<void> getTripsByDesId(int destinaton) async {
    var res = await http
        .get(Uri.parse("https://cslab.it.msu.ac.th/tripbooking/trip"));
    List<GetAllTripRes> data = getAllTripResFromJson(res.body);
    trips =
        data.where((element) => element.destinationid == destinaton).toList();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        appBar: AppBar(
          // automaticallyImplyLeading: false, // ไม่มีปุ่มย้อนกลับ
          title: const Text("รายการทริป"),
        ),
        drawer: Drawer(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 20),
                child: Text("ข้อมูลผู้ใช้"),
              ),
              Text(text),
              ListTile(
                title: const Text("ออกจากระบบ"),
                onTap: () {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => const LoginPage()));
                  Get.to(() => const LoginPage());
                },
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("ปลายทาง"),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      FilledButton(
                          onPressed: () {
                            setState(() {
                              loadData = loadTrips();
                            });
                          },
                          child: const Text("ทั้งหมด")),
                      ElevatedButton(
                          onPressed: () {
                            setState(() {
                              loadData = getTripsByDesId(1);
                            });
                          },
                          child: const Text("เอเชีย")),
                      ElevatedButton(
                          onPressed: () {
                            setState(() {
                              loadData = getTripsByDesId(2);
                            });
                          },
                          child: const Text("ยุโรป")),
                      ElevatedButton(
                          onPressed: () {
                            setState(() {
                              loadData = getTripsByDesId(3);
                            });
                          },
                          child: const Text("อาเซียน")),
                      ElevatedButton(
                          onPressed: () {
                            setState(() {
                              loadData = getTripsByDesId(9);
                            });
                          },
                          child: const Text("ไทย")),
                    ],
                  ),
                ),
                FutureBuilder(
                    future: loadData,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState != ConnectionState.done) {
                        return const Center(child: CircularProgressIndicator());
                      } else {
                        return Center(
                          child: Column(
                            children: trips.map((trip) {
                              return Padding(
                                padding: const EdgeInsets.only(top: 20),
                                child: SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.9,
                                  height: 160,
                                  child: Card(
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(trip.name),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Expanded(
                                                flex: 1,
                                                child: SizedBox(
                                                  height: 100,
                                                  child: Image.network(
                                                    trip.coverimage,
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                flex: 1,
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                        "ประเทศ${trip.country}"),
                                                    Text(
                                                        "ระยะเวลา ${trip.duration} วัน"),
                                                    Text(
                                                        "ราคา ${trip.price} บาท"),
                                                    FilledButton(
                                                        onPressed: () {
                                                          Navigator.push(
                                                              context,
                                                              MaterialPageRoute(
                                                                  builder:
                                                                      (context) =>
                                                                          TripDetailPage(
                                                                            tripId:
                                                                                trip.idx,
                                                                          )));
                                                        },
                                                        child: const Text(
                                                            "รายละเอียดอ่านเพิ่มเติม"))
                                                  ],
                                                ),
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        );
                      }
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
