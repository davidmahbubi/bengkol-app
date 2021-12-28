import 'package:bengkol_app/src/models/services/service_mobil.dart';

import 'layanan.dart';
import 'service_motor.dart';

class ServiceMobilGigi extends ServiceMobil {
  ServiceMobilGigi(String? nomorPlat)
      : super([
          'Penyetelan tuas kopling',
          'Pemeriksaan perseneling',
        ], Layanan.SERVICE_MOBIL_GIGI, nomorPlat ?? '');

  void servisTransmisi(int index) {
    tambahkanLayananKeListOrder(
        this, 'Servis transmisi mobil gigi', 200000, index);
  }

  void servisShiftFork(int index) {
    tambahkanLayananKeListOrder(
        this, 'Servis Shift Fork mobil gigi', 200000, index);
  }

  @override
  void servisKampasKopling(int index) {
    tambahkanLayananKeListOrder(
        this, 'Servis Kampas Kopling Mobil gigi', 150000, index);
  }
}
