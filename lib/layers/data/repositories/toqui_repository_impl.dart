import 'package:mttq_app/layers/data/datasources/toqui_datasource/toqui_datasource.dart';
import 'package:mttq_app/layers/data/models/box_model.dart';
import 'package:mttq_app/layers/data/models/layout_model.dart';
import 'package:mttq_app/layers/domain/entities/box_entity.dart';
import 'package:mttq_app/layers/domain/entities/layout_entity.dart';
import '../../domain/repositories/toqui_repository.dart';

class ToquiRepositoryImpl implements ToquiRepository {
  final ToquiDatasource _toquiDatasource;

  ToquiRepositoryImpl(this._toquiDatasource);

  @override
  Future<List<LayoutEntity>> getAllLockers() async {
    List<LayoutModel> models = await _toquiDatasource.getAllLockers();
    List<LayoutEntity> entities =
        models.map((e) => LayoutModel.toEntity(e)).toList();
    return entities;
  }

  @override
  Future<List<BoxEntity>> getAllBoxes() async {
    List<BoxModel> models = await _toquiDatasource.getAllBoxes();
    List<BoxEntity> entities = models.map((e) => BoxModel.toEntity(e)).toList();
    return entities;
  }
}
