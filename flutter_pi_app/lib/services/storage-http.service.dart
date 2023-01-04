import 'package:flutter_pi_app/models/result.model.dart';

abstract class StorageHttpService {
  Future<Result> fetchSysInfo(String url);
}
