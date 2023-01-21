import 'dart:convert';

import 'package:flutter_pi_app/models/pi-config.model.dart';
import 'package:flutter_pi_app/services/storage-database.service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageSharedPreferencesPiConfigService extends StorageService {
  final Future<SharedPreferences> sharedPreferences =
      SharedPreferences.getInstance();

  @override
  Future<void> create(PiConfig model) async {
    final SharedPreferences prefs = await sharedPreferences;
    prefs.setString(model.id, model.toJson().toString());
  }

  @override
  Future<List<PiConfig>> getConfigs() async {
    final SharedPreferences prefs = await sharedPreferences;
    List<PiConfig> result = [];
    PiConfig emptyModel = PiConfig(id: '0', ipaddress: '', port: '');
    var keys = prefs.getKeys();
    for (var element in keys) {
      var data = prefs.getString(element);
      if (data != null) {
        Map<String, dynamic> piMap = jsonDecode(data);
        var model = PiConfig.fromDynamicMap(piMap);
        result.add(model);
      }
    }
    result.add(emptyModel);
    return result;
  }
}
