import 'package:flutter_pi_app/services/storage-database.service.dart';
import 'package:flutter_pi_app/services/storage-pi-config.service.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

setupServiceLocator() {
  getIt.registerLazySingleton<StorageDatabaseService>(
      () => StoragePiConfgService());
}
