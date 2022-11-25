import 'package:mttq_app/layers/data/models/layout_model.dart';

class BoxEntity {
  String id;
  LayoutModel tipoLayout;
  int status;
  int seq;
  int coluna;
  String? clienteId;

  BoxEntity({
    required this.id,
    required this.tipoLayout,
    required this.status,
    required this.seq,
    required this.coluna,
    required this.clienteId,
  });
}
