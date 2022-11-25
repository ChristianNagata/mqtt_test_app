import 'package:flutter/material.dart';
import 'package:mttq_app/layers/domain/entities/box_entity.dart';
import 'package:mttq_app/layers/domain/entities/layout_entity.dart';
import 'package:mttq_app/layers/domain/repositories/toqui_repository.dart';


class ToquiNotifier with ChangeNotifier {
  final ToquiRepository _toquiRepository;
  List<LayoutEntity> layouts = [];
  List<BoxEntity> boxes = [];

  ToquiNotifier(this._toquiRepository) {
    getAllLayouts();
    getAllBoxes();
  }

  Future<void> getAllLayouts() async {
    layouts = await _toquiRepository.getAllLockers();
    notifyListeners();
  }

  Future<void> getAllBoxes() async {
    boxes = await _toquiRepository.getAllBoxes();
    notifyListeners();
  }

  List<BoxEntity> getAllBoxesInLayout(int layoutId) {
    List<BoxEntity> selectedBoxes =
        boxes.where((e) => e.tipoLayout.id == layoutId).toList();
    return selectedBoxes;
  }
}
