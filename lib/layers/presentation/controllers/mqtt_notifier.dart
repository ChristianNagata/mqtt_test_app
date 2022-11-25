import 'package:flutter/material.dart';
import 'package:mttq_app/services/mqtt_service.dart';

enum MQTTAppConnectionState { connected, disconnected, connecting }

class MqttNotifier with ChangeNotifier {
  final String _testLockerId = 'e1b132e6-999d-4dc5-a034-8e3a3a9bdb65';
  late MqttService _mqttService;
  late MQTTAppConnectionState _appConnectionState;

  MqttNotifier() {
    _appConnectionState = MQTTAppConnectionState.disconnected;
    _mqttService = MqttService(
      server: '3.93.6.173',
      macAddress: 'AC:67:B2:6A:B7:E2',
      topic: 'reservar/$_testLockerId',
      username: 'mqtt',
      password: 'mb130722',
    );
  }

  MQTTAppConnectionState get getAppConnectionState => _appConnectionState;

  void initClientAndConnect() {
    _setAppConnectionState(MQTTAppConnectionState.connecting);
    _mqttService.initializeMQTTClient();
    _mqttService.connect();
    _setAppConnectionState(MQTTAppConnectionState.connected);
  }

  void disconnect() {
    _mqttService.disconnect();
    _setAppConnectionState(MQTTAppConnectionState.disconnected);
  }

  void publishMessage(String message) {
    String topic = 'portaAberta/locker/$_testLockerId';
    _mqttService.publish(message, topic);
  }

  void subscribe() {
    String health = 'health/get/$_testLockerId';
    String reservar = 'reservar/$_testLockerId';
    _mqttService.subscribe(reservar);
  }

  void _setAppConnectionState(MQTTAppConnectionState state) {
    _appConnectionState = state;
    notifyListeners();
  }
}
