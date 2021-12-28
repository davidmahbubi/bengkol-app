import 'dart:html';

import 'package:bengkol_app/src/models/services/service_mobil.dart';

import 'layanan.dart';
import 'service_motor.dart';

class ServiceMobilMatic extends ServiceMobil {
  ServiceMobilMatic(String? nomorPlat)
      : super([
          'Penyetelan tuas kopling',
          'Pemeriksaan perseneling',
        ], Layanan.SERVICE_MOBIL_MATIC, nomorPlat ?? '');

  void servisRoler(int index) {
    print('Servis Roler untuk mobil matic');
    tambahkanLayananKeListOrder(this, 'Servis Roler Mobil Matic', 100000, index);
  }

  void servisVBelt(int index) {
    print('Servis V-Belt untuk mobil matic');
    tambahkanLayananKeListOrder(this, 'Servis V-Belt Mobil Matic', 150000, index);
  }

  @override 
    void servisKampasKopling(int index) {
    print('Servis Kampas Kopling untuk mobil matic');
    tambahkanLayananKeListOrder(this, 'Servis Kampas Kopling Mobil Matic', 150000, index);
  }

}
