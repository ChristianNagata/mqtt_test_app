import 'dart:convert';
import 'package:mttq_app/layers/data/datasources/toqui_datasource/toqui_datasource.dart';
import 'package:mttq_app/layers/data/models/box_model.dart';
import 'package:mttq_app/layers/data/models/layout_model.dart';
import 'package:http/http.dart' as http;

class ToquiDatasourceImpl implements ToquiDatasource {
  final String _baseUrl = 'http://3.93.6.173:3333/api/v1/lockers';
  final String _lockerId = 'e1b132e6-999d-4dc5-a034-8e3a3a9bdb65';

  @override
  Future<List<BoxModel>> getAllBoxes() async {
    try {
      String path = '$_baseUrl/$_lockerId/portas';

      var response = await http.get(Uri.parse(path));

      final List parsed = jsonDecode(response.body) as List;

      List<BoxModel> models =
          parsed.map<BoxModel>((e) => BoxModel.fromJson(e)).toList();
      return models;
    } catch (e) {
      print(e);
      throw Exception();
    }
  }

  @override
  Future<List<LayoutModel>> getAllLockers() async {
    try {
      var response = await http.get(Uri.parse(_baseUrl));

      final List parsed = jsonDecode(response.body)[0]['layout'] as List;

      List<LayoutModel> models =
          parsed.map<LayoutModel>((e) => LayoutModel.fromJson(e)).toList();
      return models;
    } catch (e) {
      print(e);
      throw Exception();
    }
  }

  @override
  Future<void> getLockerByMAC(String mac) {
    // TODO: implement getLockerByMAC
    throw UnimplementedError();
  }

  @override
  Future<void> healthCheck(String idLocker) {
    // TODO: implement healthCheck
    throw UnimplementedError();
  }
}
