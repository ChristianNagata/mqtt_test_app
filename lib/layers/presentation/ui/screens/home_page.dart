import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mttq_app/layers/presentation/controllers/mqtt_notifier.dart';
import 'package:provider/provider.dart';
import '../../controllers/toqui_notifier.dart';
import 'layout_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ToquiNotifier controller = Provider.of<ToquiNotifier>(context);
    MqttNotifier mqttNotifier = Provider.of<MqttNotifier>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('App test'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const LayoutScreen()),
                );
              },
              child: const Text('Exibir layout'),
            ),
            ElevatedButton(
              onPressed: mqttNotifier.initClientAndConnect,
              child: const Text('Conectar mqtt'),
            ),
            ElevatedButton(
              onPressed: mqttNotifier.disconnect,
              child: const Text('Desconectar mqtt'),
            ),
            ElevatedButton(
              onPressed: mqttNotifier.subscribe,
              child: const Text('subscribe mqtt'),
            ),
            ElevatedButton(
              onPressed: () {
                String message = jsonEncode({
                  "locker_id": "e1b132e6-999d-4dc5-a034-8e3a3a9bdb65",
                  "porta_id": "473927ad-b43f-4eef-b4fd-37c37fb46734"
                });
                mqttNotifier.publishMessage(message);
              },
              child: const Text('Publish message'),
            ),
          ],
        ),
      ),
    );
  }
}
