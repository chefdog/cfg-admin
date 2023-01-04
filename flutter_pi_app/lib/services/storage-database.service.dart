import 'dart:async';
import 'package:flutter_pi_app/models/pi-config.model.dart';

abstract class StorageDatabaseService {
  Future<void> create(PiConfig model);
  Future<List<PiConfig>> getConfigs();
}
