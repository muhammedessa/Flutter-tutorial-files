import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class LocationPage extends StatefulWidget {
  const LocationPage({super.key});


  @override
  State<LocationPage> createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {

  String? _currentAddress;
  Position? _currentPostion;


  Future<bool> _handleLocationPersmission() async{
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if(!serviceEnabled){
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Please enable Location service')));
      return false;
    }
    permission = await Geolocator.checkPermission();
    if(permission == LocationPermission.denied){
      permission = await Geolocator.requestPermission();
    }
    if(permission == LocationPermission.denied){
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Location service is denied')));
      return false;
    }
    return true;
  }

  Future<void> _getCurrentPosition() async {
    final hasPermission = await _handleLocationPersmission();
    if(!hasPermission) return;
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) {
          setState(()  => _currentPostion = position);
          _getAddressFromLatLng(_currentPostion!);
    }).catchError((e){
      print(e);
    });
  }

  Future<void> _getAddressFromLatLng(Position position) async {
    await placemarkFromCoordinates(_currentPostion!.latitude, _currentPostion!.longitude)
        .then((List<Placemark> placemarks) {
    Placemark place = placemarks[0];
        setState(()
    {
      _currentAddress = '${place.street } '
          ',${place.subLocality } ,${place.country}  ,${place
          .postalCode } ';
    } );
  }).catchError((e){
    print(e);
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: const Text('GPS'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Latitutde ${_currentPostion?.latitude ?? ""}'),
            Text('longtiude ${_currentPostion?.longitude ?? ""}'),
            Text('accuracy ${_currentPostion?.accuracy ?? ""}'),
            Text('altitude ${_currentPostion?.altitude ?? ""}'),
            Text('speed ${_currentPostion?.speed ?? ""}'),
            Text('Address ${_currentAddress ?? ""}'),

            const SizedBox(height: 33,),
            ElevatedButton(onPressed: _getCurrentPosition,
                child: const Text('Location'),)
          ],
        ),

      ),
    );
  }
}