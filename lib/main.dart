import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mttq_app/core/initializations/inject.dart';
import 'package:mttq_app/layers/presentation/controllers/mqtt_notifier.dart';
import 'package:provider/provider.dart';
import 'layers/presentation/controllers/toqui_notifier.dart';
import 'layers/presentation/ui/screens/home_page.dart';

void main() {
  Inject.init();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<ToquiNotifier>(
          create: (_) => GetIt.I.get<ToquiNotifier>(),
        ),
        ChangeNotifierProvider<MqttNotifier>(
          create: (_) => GetIt.I.get<MqttNotifier>(),
        ),
      ],
      child: const MyApp(),
    ),
  );
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
      home: const HomePage(),
    );
  }
}
