import 'package:flutter/cupertino.dart';
import 'package:flutter_pi_app/services/service_locator.dart';
import 'package:flutter_pi_app/services/storage-database.service.dart';

class PiConfigViewModel extends ChangeNotifier {
  final StorageDatabaseService _storageService =
      getIt<StorageDatabaseService>();

  Future loadData() async {
    var data = await _storageService.getConfigs();
    notifyListeners();
  }
}
