import 'package:flutter/material.dart';
import 'package:mttq_app/layers/domain/entities/layout_entity.dart';
import 'package:mttq_app/layers/presentation/controllers/toqui_notifier.dart';
import 'package:provider/provider.dart';
import '../widgets/layout.dart';

class LayoutScreen extends StatelessWidget {
  const LayoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ToquiNotifier controller = Provider.of<ToquiNotifier>(context);

    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.white,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              Row(
                children: [
                  for (LayoutEntity layout in controller.layouts)
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Layout(layout),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
