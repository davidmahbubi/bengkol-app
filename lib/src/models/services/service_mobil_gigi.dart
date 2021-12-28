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
    print('Servis Transmisi untuk mobil gigi');
    tambahkanLayananKeListOrder(this, 'Servis transmisi mobil gigi', 200000, index);
  }

  void servisShiftFork(int index) {
    print('Servis Shift Fork untuk mobil gigi');
    tambahkanLayananKeListOrder(this, 'Servis Shift Fork mobil gigi', 200000, index);
  }

  @override 
    void servisKampasKopling(int index) {
    print('Servis Kampas Kopling untuk mobil gigi');
    tambahkanLayananKeListOrder(this, 'Servis Kampas Kopling Mobil gigi', 150000, index);
  }
}
