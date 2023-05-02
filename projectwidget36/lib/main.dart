import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_maps/maps.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

   @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

     List _data = [];
  late MapZoomPanBehavior _zoomPanBehavior;

  @override
  void initState() {
    _zoomPanBehavior = MapZoomPanBehavior();
    _data =  const [
      Model('Karadat Maryam', 33.310723, 44.402911),
      Model('Inner Karada', 33.305668, 44.427568),
      Model('Arasat AlHindiya', 33.294748, 44.428752),
      Model('Daoudi', 33.309746, 44.332999),
      Model('Baghdad International Airport', 33.249025, 44.248412)
    ];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return   Scaffold(

      body: Center(
        child: SfMaps(
          layers: [
            MapTileLayer(
              initialZoomLevel: 9,
              initialFocalLatLng: const MapLatLng(33.18, 44.39),
              urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
              initialMarkersCount: _data.length,
              markerBuilder: (BuildContext context, int index) {
                return MapMarker(
                  latitude: _data[index].latitude,
                  longitude: _data[index].longitude,
                  // iconColor: Colors.white,
                  // iconStrokeWidth: 2,
                  // iconStrokeColor: Colors.black,
                  child: IconButton(
                    icon: const Icon(Icons.location_history),
                    onPressed: (){
                      print('Clicked! : ${_data[index].name}');
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(
                          content: Text('Clicked! : ${_data[index].name}')));
                    },
                  ),
                );
              },
              zoomPanBehavior: _zoomPanBehavior,
            ),
          ],
        ),
      ),
     );
  }
}


class Model {
  const Model(this.name, this.latitude, this.longitude);

  final String name;
  final double latitude;
  final double longitude;
}
