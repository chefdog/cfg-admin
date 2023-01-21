import 'package:flutter/cupertino.dart';
import 'package:flutter_pi_app/models/pi-config.model.dart';
import 'package:flutter_pi_app/services/service_locator.dart';
import 'package:flutter_pi_app/services/storage-http.service.dart';

import '../services/storage-database.service.dart';

class PiConfigViewModel extends ChangeNotifier {
  final api = '/api/systeminformation';
  late Future<List<PiConfig>> _piConfigs;

  Future<List<PiConfig>> get piConfigs => _piConfigs;

  final StorageService _storageService = getIt<StorageService>();
  final StorageHttpService _storageHttpService = getIt<StorageHttpService>();

  Future loadData() async {
    _piConfigs = _storageService.getConfigs();
    notifyListeners();
  }
}
