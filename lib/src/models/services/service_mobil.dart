import 'package:bengkol_app/src/models/services/layanan.dart';
import 'package:bengkol_app/src/models/services/service_motor_gigi.dart';

abstract class ServiceMobil extends Layanan {
  ServiceMobil(List<String> sop, String tipeLayanan, String nomorPlat)
      : super([
          'Pemeriksaan suspensi depan dan belakang',
          'Pemeriksaan fungsi kelistrikan',
          'Pemeriksaan gerak bebas kemudi'
        ], tipeLayanan, nomorPlat) {
    sop += sop;
  }

  void servisKampasKopling(int index);
}
