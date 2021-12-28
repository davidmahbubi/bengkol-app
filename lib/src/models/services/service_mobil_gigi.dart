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

  void servisTransmisi(int index) {
    print('Servis Transmisi untuk mobil gigi');
    tambahkanLayananKeListOrder(this, 'Servis transmisi mobil gigi', 200000, index);
  }

  @override 
    void servisKampasKopling(int index) {
    print('Servis Kampas Kopling untuk mobil matic');
    tambahkanLayananKeListOrder(this, 'Servis Kampas Kopling Mobil Matic', 150000, index);
  }
}
