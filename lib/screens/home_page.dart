import 'dart:async';

import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:sensors/sensors.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  AccelerometerEvent? accelerometer;
  UserAccelerometerEvent? userAccelerometer;
  GyroscopeEvent? gyroscope;
  LocationData? location;

  List<StreamSubscription> inscricoes = [];

  void listenAccelerometer(AccelerometerEvent event) {
    setState(() {
      accelerometer = event;
    });
  }

  void listenLocation(LocationData event) {
    setState(() {
      location = event;
    });
  }

  @override
  void initState() {
    super.initState();
    inscricoes.add(accelerometerEvents.listen(listenAccelerometer));
    inscricoes.add(userAccelerometerEvents.listen((event) {
      setState(() {
        userAccelerometer = event;
      });
    }));
    inscricoes.add(Location.instance.onLocationChanged.listen(listenLocation));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Atividade 2'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              child: Text('Agendar'),
              onPressed: () {},
            ),
            accelerometer != null
                ? Text(
                    "Data:  \nlat: ${location!.latitude} log: ${location!.longitude}",
                    style: const TextStyle(fontSize: 24),
                  )
                : const Text(
                    'Sem dados',
                    style: TextStyle(fontSize: 24),
                  )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    for (StreamSubscription inscricao in inscricoes) {
      inscricao.cancel();
    }
  }
}
