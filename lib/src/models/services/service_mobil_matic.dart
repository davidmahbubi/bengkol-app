import 'package:bengkol_app/src/models/services/service_mobil.dart';

import 'layanan.dart';
import 'service_motor.dart';

class ServiceMobilMatic extends ServiceMobil {
  ServiceMobilMatic(String? nomorPlat)
      : super([
          'Penyetelan tuas kopling',
          'Pemeriksaan perseneling',
        ], Layanan.SERVICE_MOBIL_MATIC, nomorPlat ?? '');
}
