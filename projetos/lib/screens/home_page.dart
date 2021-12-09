import 'dart:async';

import 'package:ativ4/apis/notification_api.dart';
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
  DateTime? dateTime;

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

  void listenNotification() {
    NotificationApi.onNotification.stream.listen((event) {
      if (event == 'Agendar') {}
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
    NotificationApi.init();
    listenNotification();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Atividade 2'),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('Agendar'),
          onPressed: () {
            dateTime = DateTime.now();
            NotificationApi.scheduleNotification(
              id: 0,
              payload: 'agendar',
              title: 'Localização á 10s atrás',
              body:
                  "Data: $dateTime \n Lat: ${location!.latitude} Long: ${location!.longitude}",
              data: DateTime.now().add(const Duration(seconds: 1)),
            );
          },
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
