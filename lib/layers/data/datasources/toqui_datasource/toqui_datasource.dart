import 'package:mttq_app/layers/data/models/layout_model.dart';
import '../../models/box_model.dart';

abstract class ToquiDatasource {
  Future<List<LayoutModel>> getAllLockers();

  Future<void> getLockerByMAC(String mac);

  Future<void> healthCheck(String idLocker);

  Future<List<BoxModel>> getAllBoxes();
}
