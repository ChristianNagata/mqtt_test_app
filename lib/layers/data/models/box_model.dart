import 'package:mttq_app/layers/domain/entities/box_entity.dart';
import 'layout_model.dart';

class BoxModel extends BoxEntity {
  BoxModel({
    required super.id,
    required super.tipoLayout,
    required super.status,
    required super.seq,
    required super.coluna,
    required super.clienteId,
  });

  factory BoxModel.fromJson(Map<String, dynamic> json) {
    return BoxModel(
      id: json['id'],
      tipoLayout: LayoutModel.fromJson(json['tipo_cubagem']),
      status: json['status'],
      seq: json['seq'],
      coluna: json['coluna'],
      clienteId: json['cliente_id'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['tipo_cubagem'] = tipoLayout.toJson();
    data['status'] = status;
    data['seq'] = seq;
    data['coluna'] = coluna;
    data['cliente_id'] = clienteId;
    return data;
  }

  static BoxEntity toEntity(BoxModel model) {
    return BoxEntity(
      id: model.id,
      tipoLayout: model.tipoLayout,
      status: model.status,
      seq: model.seq,
      coluna: model.coluna,
      clienteId: model.clienteId,
    );
  }
}
