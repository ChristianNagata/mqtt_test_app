import 'package:mttq_app/layers/domain/entities/box_entity.dart';

import '../entities/layout_entity.dart';

abstract class ToquiRepository {
  Future<List<LayoutEntity>> getAllLockers();

  Future<List<BoxEntity>> getAllBoxes();
}
