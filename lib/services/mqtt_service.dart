import 'dart:convert';

import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';

class MqttService {
  late MqttServerClient _client;
  final String _macAddress;
  final String _server;
  final String _topic;
  final String _username;
  final String _password;

  MqttService({
    required String server,
    required String topic,
    required String macAddress,
    required String username,
    required String password,
  })  : _macAddress = macAddress,
        _server = server,
        _topic = topic,
        _username = username,
        _password = password;

  void initializeMQTTClient() {
    _client = MqttServerClient(_server, _macAddress);
    _client.port = 1883;
    _client.keepAlivePeriod = 20;
    _client.onDisconnected = onDisconnected;
    _client.secure = false;
    _client.logging(on: true);

    /// Add the successful connection callback
    _client.onConnected = onConnected;
    _client.onSubscribed = onSubscribed;

    final MqttConnectMessage connMess = MqttConnectMessage()
        .authenticateAs(_username, _password)
        .withClientIdentifier(_macAddress)
        .withWillTopic('willtopic')
        .withWillMessage('My Will message')
        .startClean() // Non persistent session for testing
        .withWillQos(MqttQos.exactlyOnce);
    print('EXAMPLE::Mosquitto client connecting....');
    _client.connectionMessage = connMess;
  }

  // Connect to the host
  void connect() async {
    try {
      print('EXAMPLE::Mosquitto start client connecting....');
      await _client.connect();
    } on Exception catch (e) {
      print('EXAMPLE::client exception - $e');
      disconnect();
    }
  }

  void disconnect() {
    print('Disconnected');
    _client.disconnect();
  }

  void publish(String message, String topic) {
    if (_client.connectionStatus!.state == MqttConnectionState.connected) {
      print('EXAMPLE::Mosquitto client connected');
      final MqttClientPayloadBuilder builder = MqttClientPayloadBuilder();
      builder.addString(message);

      _client.subscribe(topic, MqttQos.exactlyOnce);

      _client.publishMessage(topic, MqttQos.exactlyOnce, builder.payload!);
    } else {
      print('EXAMPLE::ERROR Mosquitto client connection failed - '
          'disconnecting, status is ${_client.connectionStatus}');
    }
  }

  void subscribe(String topic) {
    _client.subscribe(topic, MqttQos.exactlyOnce);
  }

  /// The subscribed callback
  void onSubscribed(String topic) {
    print('EXAMPLE::Subscription confirmed for topic $topic');
  }

  /// The unsolicited disconnect callback
  void onDisconnected() {
    print('EXAMPLE::OnDisconnected client callback - Client disconnection');
    if (_client.connectionStatus!.returnCode ==
        MqttConnectReturnCode.noneSpecified) {
      print('EXAMPLE::OnDisconnected callback is solicited, this is correct');
    }
  }

  /// The successful connect callback
  void onConnected() {
    print('EXAMPLE::Mosquitto client connected....');
    _client.subscribe(_topic, MqttQos.atLeastOnce);
    _client.updates!.listen((List<MqttReceivedMessage<MqttMessage?>>? c) {
      final MqttPublishMessage recMess = c![0].payload as MqttPublishMessage;

      final String pt =
          MqttPublishPayload.bytesToStringAsString(recMess.payload.message);

      print('#################### ${c[c.length - 1].topic}');

      if (c[c.length - 1].topic == 'reservar/e1b132e6-999d-4dc5-a034-8e3a3a9bdb65') {
        print('chamar função reservar');
      }
      if (c[c.length - 1].topic == 'health/get/e1b132e6-999d-4dc5-a034-8e3a3a9bdb65') {
        print('chamar função health');
        publish(
          jsonEncode({
            'locker_id': 'e1b132e6-999d-4dc5-a034-8e3a3a9bdb65',
            'msg': 'TESTE',
          }),
          'health/return/e1b132e6-999d-4dc5-a034-8e3a3a9bdb65',
        );
      }

      print(
          'EXAMPLE::Change notification:: topic is <${c[0].topic}>, payload is <-- $pt -->');
      print('');
    });
    print(
        'EXAMPLE::OnConnected client callback - Client connection was sucessful');
  }
}
