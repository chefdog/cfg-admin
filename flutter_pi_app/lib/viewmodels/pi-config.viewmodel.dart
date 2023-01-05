import 'package:flutter/cupertino.dart';
import 'package:flutter_pi_app/models/pi-config.model.dart';
import 'package:flutter_pi_app/models/result.model.dart';
import 'package:flutter_pi_app/models/result-system-information.model.dart';
import 'package:flutter_pi_app/services/service_locator.dart';
import 'package:flutter_pi_app/services/storage-database.service.dart';
import 'package:flutter_pi_app/services/storage-http.service.dart';

class PiConfigViewModel extends ChangeNotifier {
  final api = '/api/systeminformation';
  late Future<List<PiConfig>> _piConfigs;

  Future<List<PiConfig>> get piConfigs => _piConfigs;

  final StorageDatabaseService _storageService =
      getIt<StorageDatabaseService>();
  final StorageHttpService _storageHttpService = getIt<StorageHttpService>();

  Future loadData() async {
    var piConfigs = await _storageService.getConfigs();
    List<PiConfig> data = [];
    for (var item in piConfigs) {
      var result =
          _storageHttpService.fetchSysInfo('$item.ipaddress/$api');
      data.add(_populate(item, result));
    }
    _piConfigs = data as Future<List<PiConfig>>;
    notifyListeners();
  }

  PiConfig _populate(PiConfig piConfig, Result httpResult) {
    if (!httpResult.didError) {
      var si = SystemInformation.fromDynamic(httpResult.data);
      piConfig.machineName = si.machineName;
      return piConfig;
    }

    throw Exception(httpResult.error);
  }
}
