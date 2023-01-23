import 'package:flutter_pi_app/services/http-pi-config.service.dart';
import 'package:flutter_pi_app/services/storage-database.service.dart';
import 'package:flutter_pi_app/services/storage-http.service.dart';
import 'package:flutter_pi_app/services/storage-shared-preferences-pi-config.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

setupServiceLocator() {
  getIt.registerLazySingleton<StorageService>(
      () => StorageSharedPreferencesPiConfigService());
  getIt.registerLazySingleton<StorageHttpService>(() => HttpPiService());
}
