import 'dart:convert';

import 'package:flutter_pi_app/models/card-type.enum.dart';
import 'package:flutter_pi_app/models/pi-config.model.dart';
import 'package:flutter_pi_app/services/storage-database.service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageSharedPreferencesPiConfigService extends StorageService {
  final Future<SharedPreferences> sharedPreferences =
      SharedPreferences.getInstance();

  @override
  Future<void> create(PiConfig model) async {
    final SharedPreferences prefs = await sharedPreferences;
    prefs.setString(model.id.toString(), model.toJson().toString());
  }

  @override
  Future<List<PiConfig>> getConfigs() async {
    final SharedPreferences prefs = await sharedPreferences;
    List<PiConfig> result = [];
    var keys = prefs.getKeys();
    for (var element in keys) {
      var data = prefs.getString(element);
      if (data != null) {
        Map<String, dynamic> piMap = jsonDecode(data);
        var model = PiConfig.fromDynamicMap(piMap);
        result.add(model);
      }
    }

    var model = PiConfig(
        id: 0,
        description: 'Lorum ipsum',
        ipAddress: '133.12.12.1',
        port: '24');
    result.add(model);

    model = PiConfig(
        id: 1,
        description: 'Lorum ipsum',
        ipAddress: '133.12.12.2',
        port: '24');
    result.add(model);

    model = PiConfig(
        id: 2,
        description: 'Lorum ipsum',
        ipAddress: '133.12.12.3',
        port: '24');
    result.add(model);

    return result;
  }
}
