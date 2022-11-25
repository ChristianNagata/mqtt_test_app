import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../domain/entities/box_entity.dart';
import '../../../domain/entities/layout_entity.dart';
import '../../controllers/toqui_notifier.dart';
import 'custom_grid_view.dart';

class Layout extends StatelessWidget {
  final LayoutEntity layout;

  const Layout(
    this.layout, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ToquiNotifier toquiNotifier = Provider.of<ToquiNotifier>(context);
    List<BoxEntity> boxes = toquiNotifier.getAllBoxesInLayout(layout.id);
    return Container(
      height: 360,
      width: 200,
      color: Colors.indigo,
      child: CustomGridView(
        crossAxisCount: layout.colunas,
        mainAxisCount: layout.linhas,
        crossAxisSpacing: 4,
        mainAxisSpacing: 4,
        children: boxes
            .map(
              (e) => Container(
                color: Colors.amber,
                child: Center(
                  child: Text(e.seq.toString()),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
