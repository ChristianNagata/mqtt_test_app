import 'package:mttq_app/layers/domain/entities/layout_entity.dart';

class LayoutModel extends LayoutEntity {
  LayoutModel({
    required super.id,
    required super.desc,
    required super.altura,
    required super.largura,
    required super.profundidade,
    required super.colunas,
    required super.linhas,
  });

  factory LayoutModel.fromJson(Map<String, dynamic> json) {
    return LayoutModel(
      id: json['id'],
      desc: json['desc'],
      altura: json['altura'],
      largura: json['largura'],
      profundidade: json['profundidade'],
      colunas: json['num_colunas'],
      linhas: json['num_linhas'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['desc'] = desc;
    data['altura'] = altura;
    data['largura'] = largura;
    data['profundidade'] = profundidade;
    data['num_colunas'] = colunas;
    data['num_linhas'] = linhas;
    return data;
  }

  static LayoutEntity toEntity(LayoutModel model) {
    return LayoutEntity(
      id: model.id,
      desc: model.desc,
      altura: model.altura,
      largura: model.largura,
      profundidade: model.profundidade,
      colunas: model.colunas,
      linhas: model.linhas,
    );
  }
}
